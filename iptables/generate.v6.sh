#!/usr/bin/env bash
# Script used to generate IP tables
# Based on: 
# 1. https://www.digitalocean.com/community/tutorials/how-to-list-and-delete-iptables-firewall-rules#flush-all-rules,-delete-all-chains,-and-accept-all
# 2. https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-using-iptables-on-ubuntu-14-04
mrtip=2001:6a8:2880:a021::6

echo "Accepting everything"
ip6tables -P INPUT ACCEPT
ip6tables -P FORWARD ACCEPT
ip6tables -P OUTPUT ACCEPT

echo "Flushing the settings"
ip6tables -t nat -F
ip6tables -t mangle -F
ip6tables -F
ip6tables -X

echo "Allow everything from loopback"
ip6tables -A INPUT -i lo -j ACCEPT

echo "Allow everything from mrt (Leia does not have ipv6)"
ip6tables -A INPUT -s $mrtip -j ACCEPT

echo "Allowing current connections"
ip6tables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

echo "Setup rules for specific services"
ip6tables -A INPUT -p tcp --dport 25 -j ACCEPT
ip6tables -A INPUT -p tcp --dport 53 -j ACCEPT
ip6tables -A INPUT -p udp --dport 53 -j ACCEPT
ip6tables -A INPUT -p tcp --dport 80 -j ACCEPT
ip6tables -A INPUT -p tcp --dport 443 -j ACCEPT
ip6tables -A INPUT -p tcp --dport 587 -j ACCEPT
ip6tables -A INPUT -p tcp --dport 993 -j ACCEPT
ip6tables -A INPUT -p tcp --dport 22345 -j ACCEPT

echo "Allow icmp"
ip6tables -A INPUT -p icmp -j ACCEPT

echo "Drop all other packages"
ip6tables -A INPUT -j DROP

echo "Dissallow ip routing"
ip6tables -I FORWARD -j DROP

echo "------------"
echo "New settings"
ip6tables -L --line-numbers

read -r -p "Do you want to save the settings? [y/N] " response
echo #
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    echo "Saving settings"
    ip6tables-save > /etc/iptables/rules.v6
else 
    echo "Not saving settings, you can always regenerate them by using this script again"
fi
