#!/bin/sh
chmod 777 *
apt-get install ncrack
apt-get install hydra
apt-get install medusa
apt-get install nmap
apt-get install sshpass
curl -sSfL 'https://git.io/kitabisa-ssb' | sh -s -- -b /usr/local/bin
sh actualizar.sh
