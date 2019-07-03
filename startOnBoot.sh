#!/bin/bash

crontab -l > mycron
echo "@reboot "`pwd`/setup.sh >> mycron
crontab mycron
rm mycron
