#!/usr/bin/env bash
case "$1" in
	start)
		iptables-restore < /etc/iptables/rules.v4
		;;
	stop)
		echo "Stopping firewall"
esac		
