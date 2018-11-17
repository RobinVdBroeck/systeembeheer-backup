#!/usr/bin/env bash
case "$1" in
	start)
		iptables-restore < /etc/iptables/rules.v4
		ip6tables-restore < /etc/iptables/rules.v6
		;;
	stop)
		iptables-restore < /etc/iptables/empty-rules.v4
		ip6tables-restore < /etc/iptables/empty-rules.v6
		;;	
esac		
