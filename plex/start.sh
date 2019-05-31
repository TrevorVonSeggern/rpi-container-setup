#!/bin/sh

if [ -f ./plex/claim.env ]
then
	echo "Plex claim information already provided. Skipping asking input."
else
	echo "Plex claim? (https://www.plex.tv/claim)"
	read claim
	echo "PLEX_CLAIM="$claim >> ./plex/claim.env
fi


docker stop plex
docker rm plex
docker run -d --name=plex --env-file plex/claim.env -v `pwd`/share:/config  -v `pwd`/share/plex/transcode:/transcode -v `pwd`/share/:/data --restart unless-stopped \
-p 32400:32400/tcp \
-p 3005:3005/tcp \
-p 8324:8324/tcp \
-p 32469:32469/tcp \
-p 1900:1900/udp \
-p 32410:32410/udp \
-p 32412:32412/udp \
-p 32413:32413/udp \
-p 32414:32414/udp \
-e TZ="America/Denver" \
-e VERSION="latest" \
-e ADVERTISE_IP="http://192.198.0.12:32400" \
linuxserver/plex:arm32v7-latest


# todo: add a watchdog for this container?

