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

[ ! ${EUID} -eq 0 ] && (echo "[ERROR] Please run this script using sudo"; exit 1)
[ -d "${HOME}/GitHub/dotfiles" ] || (echo "[ERROR] No dotfiles repo cloned to ${HOME}/GitHub" ; exit 1)
result=$(which dnsmasq)
result=$(echo "${result} | grep 'not found'")
[ -n "${result}" ] && (echo "[ERROR] dnsmasq not installed" ; exit 1)

# Update bootfiles
sudo echo dtoverlay=dwc2 >> /boot/firmware/config.txt
sudo echo ' modules-load=dwc2' >> /boot/firmware/cmdline.txt
sudo echo libcomposite > /etc/modules-load.d/usb-gadget.conf

# Copy service scripts
cd "${HOME}/GitHub/dotfiles/Pi"
sudo cp usb-gadget.service /lib/systemd/system
sudo cp usb-gagdet.sh /usr/local/sbin
sudo chmod +x /usr/local/sbin/usb-gadget.sh
sudo systemctl enable usb-gadget.service

# Set up connection via nmcli
sudo nmcli con add type bridge ifname br0
sudo nmcli con add type bridge-slave ifname usb0 master br0
#sudo nmcli con add type bridge-slave ifname usb1 master br0
sudo nmcli connection modify bridge-br0 ipv4.method manual ipv4.addresses 10.55.0.1/24

# Set up dnsmasq
sudo cat <<EOT > /etc/dnsmasq.d/br0
dhcp-authoritative
dhcp-rapid-commit
no-ping
interface=br0
dhcp-range=10.55.0.2,10.55.0.6,255.255.255.248,1h
dhcp-option=3
leasefile-ro
EOT
