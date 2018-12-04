DOMAIN=robin-vandenbroeck.sb.uclllabs.be
for key in `ls K$DOMAIN*.key`
do
	echo "\$INCLUDE $key">> db.$DOMAIN
done
