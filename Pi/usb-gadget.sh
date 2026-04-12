#!/bin/bash
#
cd /sys/kernel/config/usb_gadget/
mkdir -p pigadget
cd pigadget
echo 0x1d6b > idVendor
echo 0x0104 > idProduct
echo 0x0103 > bcdDevice # v1.0.3
echo 0x0320 > bcdUSB
echo 2 > bDeviceClass
#
mkdir -p strings/0x409
echo "fedcba9876543213" > strings/0x409/serialnumber
echo "smittytone" > strings/0x409/manufacturer
echo "Pi Gadget" > strings/0x409/product
mkdir -p configs/c.1/strings/0x409
echo "CDC" > configs/c.1/strings/0x409/configuration
echo 250 > configs/c.1/MaxPower
echo 0x80 > configs/c.1/bmAttributes
#ECM
mkdir -p functions/ecm.usb0
HOST="00:dc:c8:f7:75:15" # "HostPC"
SELF="00:dd:dc:eb:6d:a1" # "BadUSB"
echo ${HOST} > functions/ecm.usb0/host_addr
echo ${SELF} > functions/ecm.usb0/dev_addr
ln -s functions/ecm.usb0 configs/c.1/
#RNDIS
#mkdir -p configs/c.2
#echo 0x80 > configs/c.2/bmAttributes
#echo 0x250 > configs/c.2/MaxPower
#mkdir -p configs/c.2/strings/0x409
#echo "RNDIS" > configs/c.2/strings/0x409/configuration
#
#echo "1" > os_desc/use
#echo "0xcd" > os_desc/b_vendor_code
#echo "MSFT100" > os_desc/qw_sign
#
#mkdir -p functions/rndis.usb0
#HOST_R="00:dc:c8:f7:75:16"
#SELF_R="00:dd:dc:eb:6d:a2"
#echo $HOST_R > functions/rndis.usb0/dev_addr
#echo $SELF_R > functions/rndis.usb0/host_addr
#echo "RNDIS" >   functions/rndis.usb0/os_desc/interface.rndis/compatible_id
#echo "5162001" > functions/rndis.usb0/os_desc/interface.rndis/sub_compatible_id
#
#ln -s functions/rndis.usb0 configs/c.2
#ln -s configs/c.2 os_desc
#
udevadm settle -t 5 || :
ls /sys/class/udc > UDC
#
sleep 5
#
nmcli connection up bridge-br0
nmcli connection up bridge-slave-usb0
#nmcli connection up bridge-slave-usb1
sleep 5
service dnsmasq restart
