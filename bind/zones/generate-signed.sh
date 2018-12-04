SALT=$(cat /dev/urandom | tr -dc 'A-F0-9' | fold -w 32 | head -n 1)
DOMAIN=robin-vandenbroeck.sb.uclllabs.be
dnssec-signzone -A -3 $SALT -N INCREMENT -o $DOMAIN -t db.$DOMAIN
