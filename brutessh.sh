#!/bin/bash
echo 
echo "ncrack ssh://1.1.1.1:65535 -U usuarios.txt -P claves.txt"
echo 
echo $1 "<======================"
ncrack ssh://$1:22 -U usuarios.txt -P claves.txt
