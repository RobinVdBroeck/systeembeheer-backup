$TTL	1
@	IN	SOA	robin-vandenbroeck.sb.uclllabs.be. ns1.uclllabs.be. (
			 111123		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			  86400 )	; Negative Cache TTL
	IN	NS	ns1.uclllabs.be.
	IN	NS	ns2.uclllabs.be.
	IN	NS	ns.larry-boltovskoi.sb.uclllabs.be.

ns	IN	A	193.191.177.180
www	IN	A	193.191.177.180
www1	IN	A	193.191.177.180
test	IN	A	193.191.177.254
www2	IN	A	193.191.177.180
secure	IN	A	193.191.177.180

robin-vandenbroeck.sb.uclllabs.be.	IN	CAA	0 issuewild ";"
robin-vandenbroeck.sb.uclllabs.be.	IN	CAA	0 issue "letsencrypt.org"
robin-vandenbroeck.sb.uclllabs.be.	IN	CAA	0 iodef "mailto:robin.broeck@gmail.com"
