#!/usr/bin/env bash
echo 
echo "... actualizando diccionarios ...   2022 hackingyseguridad.com "
chmod 777 *
wget https://raw.githubusercontent.com/hackingyseguridad/diccionarios/master/diccionario.txt -q -O diccionario.txt
echo "diccionario.txt"
wget https://raw.githubusercontent.com/hackingyseguridad/diccionarios/master/usuarios.txt -q -O usuarios.txt
echo "usuarios.txt"
wget https://raw.githubusercontent.com/hackingyseguridad/diccionarios/master/claves.txt -q -O claves.txt
echo "claves.txt"
wget https://raw.githubusercontent.com/hackingyseguridad/diccionarios/master/claves2.txt -q -O claves2.txt
echo "claves2.txt"
echo "."
echo ".."
echo "... fin!"
echo
