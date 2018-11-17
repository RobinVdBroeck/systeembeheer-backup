#!/usr/bin/env bash
# Generate empty firewall rules
# Based on: https://serverfault.com/questions/200635/best-way-to-clear-all-iptables-rules

ip6tables -P INPUT ACCEPT
ip6tables -P FORWARD ACCEPT
ip6tables -P OUTPUT ACCEPT
ip6tables -t nat -F
ip6tables -t mangle -F
ip6tables -F
ip6tables -X

read -r -p "Do you want to save the settings? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    echo "Saving settings"
    ip6tables-save > /etc/iptables/empty-rules.v6
else 
    echo "Not saving settings, you can always regenerate them by using this script again"
fi
