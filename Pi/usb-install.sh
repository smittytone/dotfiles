#!/bin/bash

# Raspberry Pi USB Gadget Install Script
# Version 0.1.0
# By Tony Smith (@smittytone)
# Derived from work by Ben Hardill (https://blog.hardill.me.uk/2023/12/23/pi5-usb-c-gadget/)
#
# Notes
# - Tested on RPi Zero 2W
# - Requires:
#     1. sudo apt install git dnsmasq (git to get dotfiles; dnsmasq for the gadget)
#     2. git clone https://github.com/smittytone/dotfiles (this script and others)
#  - Operation:
#     - Must be run as sudo
#

# Key file locations (separated out to ease script testing)
CONFIG=/boot/firmware/config.txt
CMDLIN=/boot/firmware/cmdline.txt
MODCON=/etc/modules-load.d/usb-gadget.conf
DNSCON=/etc/dnsmasq.d/br0

[ ${EUID} -eq 0 ] || echo "[ERROR] Please run this script using sudo" ; exit 1
[ -d "${HOME}/GitHub/dotfiles" ] || echo "[ERROR] No dotfiles repo cloned to ${HOME}/GitHub" ; exit 1
[ -d "/etc/dnsmasq.d" ] || echo "[ERROR] dnsmasq not installed" ; exit 1

# Update bootfiles
echo dtoverlay=dwc2 >> "${CONFIG}"
echo ' modules-load=dwc2' >> "${CMDLIN}"
echo libcomposite > "${MODCON}"

# Copy service scripts
cd "${HOME}/GitHub/dotfiles/Pi"
cp usb-gadget.service /lib/systemd/system
cp usb-gagdet.sh /usr/local/sbin
chmod +x /usr/local/sbin/usb-gadget.sh
systemctl enable usb-gadget.service

# Set up connection via nmcli
nmcli con add type bridge ifname br0
nmcli con add type bridge-slave ifname usb0 master br0
nmcli connection modify bridge-br0 ipv4.method manual ipv4.addresses 10.55.0.1/24

# Set up dnsmasq
cat <<EOT > "${DNSCON}"
dhcp-authoritative
dhcp-rapid-commit
no-ping
interface=br0
dhcp-range=10.55.0.2,10.55.0.6,255.255.255.248,1h
dhcp-option=3
leasefile-ro
EOT
