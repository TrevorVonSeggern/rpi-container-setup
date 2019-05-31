#!/bin/sh

if [ -f ./bittorrent/transmission.env ]
then
	echo "Transmission information already provided. Skipping asking input. Refer to the ./bittorrent/transmission.env file for values."
else
	echo "OpenVpn Provider? (NORDVPN)"
	read provider
	echo "OPENVPN_PROVIDER="$provider >> ./bittorrent/transmission.env

	echo "OpenVpn username?"
        read username
        echo "OPENVPN_USERNAME="$username >> ./bittorrent/transmission.env

	echo "OpenVpn password?"
        read password
        echo "OPENVPN_PASSWORD="$password >> ./bittorrent/transmission.env
fi


docker stop transmission
docker rm transmission
docker run -d --name=transmission --cap-add=NET_ADMIN --env-file bittorrent/transmission.env --env-file bittorrent/default.env -v `pwd`/share/transmission:/data --restart unless-stopped -p 9091:9091 haugene/transmission-openvpn:latest-armhf
