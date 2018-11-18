$TTL	1
@	IN	SOA	robin-vandenbroeck.sb.uclllabs.be. ns1.uclllabs.be. (
			 111139		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			  86400 )	; Negative Cache TTL
	IN	NS	ns1.uclllabs.be.
	IN	NS	ns2.uclllabs.be.
	IN	NS	ns.larry-boltovskoi.sb.uclllabs.be.
	IN	A 	193.191.177.180
	IN	AAAA	2001:6a8:2880:a077::b4
	IN	MX 	10	mx

ns		IN	A	193.191.177.180
ns		IN	AAAA	2001:6a8:2880:a077::b4
www		IN	A	193.191.177.180
www		IN	AAAA	2001:6a8:2880:a077::b4
www1		IN	A	193.191.177.180
www1		IN	AAAA	2001:6a8:2880:a077::b4
test		IN	A	193.191.177.254
www2		IN	A	193.191.177.180
www2		IN	AAAA	2001:6a8:2880:a077::b4
secure		IN	A	193.191.177.180
secure		IN	AAAA	2001:6a8:2880:a077::b4
supersecure 	IN	A	193.191.177.180
supersecure 	IN	AAAA	2001:6a8:2880:a077::b4
phpmyadmin 	IN 	A	193.191.177.180
phpmyadmin 	IN 	AAAA	2001:6a8:2880:a077::b4
mx		IN	A	193.191.177.180
mx		IN	AAAA	2001:6a8:2880:a077::b4

robin-vandenbroeck.sb.uclllabs.be. 		IN 	CAA	0 issue "letsencrypt.org"
robin-vandenbroeck.sb.uclllabs.be.		IN	CAA	0 issuewild "letsencrypt.org"
robin-vandenbroeck.sb.uclllabs.be.		IN	CAA	0 iodef "mailto:robin.vandenbroeck@student.ucll.be"
secure.robin-vandenbroeck.sb.uclllabs.be.	IN	CAA	0 issue "letsencrypt.org"
secure.robin-vandenbroeck.sb.uclllabs.be.	IN	CAA	0 iodef "mailto:robin.vandenbroeck@student.ucll.be"
supersecure.robin-vandenbroeck.sb.uclllabs.be	IN	CAA	0 issue "letsencrypt.org"
supersecure.robin-vandenbroeck.sb.uclllabs.be.	IN	CAA	0 iodef "mailto:robin.vandenbroeck@student.ucll.be"
phpmyadmin.robin-vandenbroeck.sb.uclllabs.be.	IN	CAA	0 issue "letsencrypt.org"
phpmyadmin.robin-vandenbroeck.sb.uclllabs.be.	IN	CAA	0 iodef "mailto:robin.vandenbroeck@student.ucll.be"
mx.robin-vandenbroeck.sb.uclllabs.be		IN	CAA	0 issue "letsencrypt.org"
mx.robin-vandenbroeck.sb.uclllabs.be		IN	CAA	0 iodef "mailto:robin.vandenbroeck@student.ucll.be"
