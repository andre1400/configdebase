#!/bin/bash
echo "Hello World"
sudo hostnamectl set-hostname SRV-LIN1-02
# bash -c (interpréter la commande -c , pour executer la commande cat)(<< toutes ses lignes qui vont etre écrites dans /etc/network/interfaces qui sera ecraser grace à ">")
sudo bash -c "cat << EOF > /etc/network/interfaces
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto ens33
iface ens33 inet static
address 10.10.10.22
netmask 255.255.255.0
gateway 10.10.10.2
EOF"