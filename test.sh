#!/bin/bash
echo "Hello World"
sudo hostnamectl set-hostname SRV-LIN1-02
sudo cat <<EOF > /etc/network/interface
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto hotplug ens33
iface ens33 inet static
address 10.10.10.22
netmask 255.255.255.0
gateway 10.10.10.2
EOF
