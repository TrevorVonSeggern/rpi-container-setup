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
--net=host \
-e TZ="America/Denver" \
-e VERSION="latest" \
linuxserver/plex


# todo: add a watchdog for this container?

