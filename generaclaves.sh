#!/bin/bash
# (c) Hacking y Seguridad .com 2024
# Generacdor de claves ccombinando dos ficheros
# > passw.txt para guardar en un fichero el resultado

crunch 2 3 -f /usr/share/crunch/charset.lst mixalpha-numeric -o combinaciones.txt

for i in `cat claves.txt`
do
for h  in `cat combinaciones.txt`
do
       echo $i$h
done
done
