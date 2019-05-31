#!/bin/bash
docker run -d \
  --name samba \
  -p 137:137/udp \
  -p 138:138/udp \
  -p 139:139 \
  -p 445:445 \
  -p 445:445/udp \
  --hostname 'black-pearl' \
  -v share:/share/stick \
  rpi-samba \
  -u "pi:raspberry" \
  -s "Share:/share/stick:rw:pi"
