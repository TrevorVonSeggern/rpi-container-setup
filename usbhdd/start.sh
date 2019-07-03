#!/bin/sh



echo 'Select drive:'
lsblk
#sudo parted -l | grep '/dev'
#df -h | grep ^/dev
echo 'Enter text exactly. "/dev/sda1" or similar'

#read the command. assume sda1 or something.

#$drive = '/dev/sda1'

sudo mount -t vfat /dev/sda1 /home/pirate/setup/share -o umask=000

