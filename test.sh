#!/bin/bash
echo "Welcome to my World"

# Changer le hostname
host_F=SRV-LIN1-02
sudo hostnamectl set-hostname $host_F

# Interface ip static
#bash -c (interpréter la commande -c , pour executer la commande cat)(<< toutes ses lignes qui vont etre écrites dans /etc/network/interfaces qui sera ecraser grace à ">")
interfaces_F="/etc/network/interfaces"
sudo bash -c "cat << EOF >$interfaces_F
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

#Set resolv.cong pour le dns
resolv_F="/etc/resolv.conf"

sudo bash -c "cat <<EOM >$resolv_F

domain lin1.local
search lin1.local
nameserver 10.10.10.11
nameserver 10.10.10.2

EOM"