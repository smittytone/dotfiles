sudo apt update && apt install -y dnsmasq git
[ mkdir "$HOME/GitHub" ] && cd "$HOME/GitHub"
sudo cp usb-gadget.service /lib/systemd/system
sudo cp usb-gagdet.sh /usr/local/sbin
sudo chmod +x /usr/local/sbin/usb-gadget.sh
#
sudo nmcli con add type bridge ifname br0
sudo nmcli con add type bridge-slave ifname usb0 master br0
#sudo nmcli con add type bridge-slave ifname usb1 master br0
sudo nmcli connection modify bridge-br0 ipv4.method manual ipv4.addresses 10.55.0.1/24
#
sudo echo libcomposite > /etc/modules-load.d/usb-gadget.conf
#
sudo cat <<EOT > /etc/dnsmasq.d/br0
dhcp-authoritative
dhcp-rapid-commit
no-ping
interface=br0
dhcp-range=10.55.0.2,10.55.0.6,255.255.255.248,1h
dhcp-option=3
leasefile-ro
EOT
