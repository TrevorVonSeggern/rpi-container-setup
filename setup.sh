#!/bin/bash

cd /home/pirate/setup


mkdir -p share

# setup drive
./usbhdd/start.sh

# samba
docker stop samba
docker rm samba
cd rpi-samba
./build_image.sh
cd ..
./rpi-samba/start.sh


# transmission
./bittorrent/start.sh


#plex
./plex/start.sh
