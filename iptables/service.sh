#!/usr/bin/env bash
case "$1" in
	start)
		iptables-restore < /etc/iptables/rules.v4
		;;
	stop)
		iptables-restore < /etc/iptables/empty-rules.v4
		;;	
esac		
