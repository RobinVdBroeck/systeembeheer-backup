#!/usr/bin/env bash
# Generate empty firewall rules
# Based on: https://serverfault.com/questions/200635/best-way-to-clear-all-iptables-rules

iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
iptables -t nat -F
iptables -t mangle -F
iptables -F
iptables -X

read -r -p "Do you want to save the settings? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    echo "Saving settings"
    iptables-save > /etc/iptables/empty-rules.v4
else 
    echo "Not saving settings, you can always regenerate them by using this script again"
fi
