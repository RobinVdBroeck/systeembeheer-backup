#!/usr/bin/env bash
# Script used to generate IP tables
# Based on: 
# 1. https://www.digitalocean.com/community/tutorials/how-to-list-and-delete-iptables-firewall-rules#flush-all-rules,-delete-all-chains,-and-accept-all
# 2. https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-using-iptables-on-ubuntu-14-04
mrtip=193.191.177.6
leiaip=193.191.177.1

echo "Accepting everything"
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

echo "Flushing the settings"
iptables -t nat -F
iptables -t mangle -F
iptables -F
iptables -X

echo "Allow everything from loopback"
iptables -A INPUT -i lo -j ACCEPT

echo "Allow everything from mrt and leia"
iptables -A INPUT -s $mrtip -j ACCEPT
iptables -A INPUT -s $leiaip -j ACCEPT

echo "Allow private ip addresses"
iptables -A INPUT -s 10.0.0.0/8 -j ACCEPT
iptables -A INPUT -s 127.16.0.0/12 -j ACCEPT
iptables -A INPUT -s 192.168.0.0/16 -j ACCEPT

echo "Allowing current connections"
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

echo "Setup rules for specific services"
iptables -A INPUT -p tcp --dport 25 -j ACCEPT
iptables -A INPUT -p tcp --dport 53 -j ACCEPT
iptables -A INPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp --dport 587 -j ACCEPT
iptables -A INPUT -p tcp --dport 993 -j ACCEPT
iptables -A INPUT -p tcp --dport 5601 -j ACCEPT
iptables -A INPUT -p tcp --dport 22345 -j ACCEPT

echo "Allow icmp"
iptables -A INPUT -p icmp -j ACCEPT

echo "Drop all other packages"
iptables -A INPUT -j DROP

echo "Dissallow ip routing"
iptables -I FORWARD -j DROP

echo "------------"
echo "New settings"
iptables -L --line-numbers

read -r -p "Do you want to save the settings? [y/N] " response
echo #
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    echo "Saving settings"
    iptables-save > /etc/iptables/rules.v4
else 
    echo "Not saving settings, you can always regenerate them by using this script again"
fi
