sudo -s << EOF
OVPN_DATA="ovpn-data"
docker run --name $OVPN_DATA -v /etc/openvpn busybox
IPADDRESS=$(ip a | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | sed -n 2p)
docker-compose run --rm openvpn ovpn_genconfig -u udp://$IPADDRESS
docker-compose run --rm openvpn ovpn_initpki
#prompt for CA Key Passphrase
#2nd prompt for CA Key Passphrase
#prompt for server name
#prompt for public key password
#reprompt for public key password
docker-compose up -d openvpn
export CLIENTNAME="libertyhound"
docker-compose run --rm openvpn easyrsa build-client-full $CLIENTNAME
#prompt for password generation
docker-compose run --rm openvpn ovpn_getclient $CLIENTNAME > $CLIENTNAME.ovpn
EOF
