#!/bin/bash
echo 
echo 
echo $1 "<======================"
ncrack ssh://$1:22 -U usuarios.txt -P claves.txt -m -v
