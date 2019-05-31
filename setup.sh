#!/bin/bash
mkdir -p share

#samba
docker stop samba
docker rm samba
cd rpi-samba
./build_image.sh
cd ..
./rpi-samba/start.sh


