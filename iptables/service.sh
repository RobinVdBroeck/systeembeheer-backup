#!/usr/bin/env bash
case "$1" in
	start)
		iptables-restore < /etc/iptables/rules.v4
		ip6tables-restore < /etc/iptables/rules.v6
		sysctl -w net.ipv4.ip_forward=0
		sysctl -w net.ipv4.tcp_syncookies=1
		;;
	stop)
		iptables-restore < /etc/iptables/empty-rules.v4
		ip6tables-restore < /etc/iptables/empty-rules.v6
		sysctl -w net.ipv4.ip_forward=1
		sysctl -w net.ipv4.tcp_syncookies=0
		;;	
esac		
