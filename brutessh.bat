@ECHO OFF

nmap -Pn -p 22 --script ssh-brute --script-args userdb=usuarios0.txt,passdb=claves0.txt,unpwdb.timelimit=0 %1 %2 %3 %4
