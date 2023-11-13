#!/usr/bin/env bash
echo 
echo "... actualizando diccionarios ...   2022 hackingyseguridad.com "
chmod 777 *
echo ".."
wget https://raw.githubusercontent.com/hackingyseguridad/diccionarios/master/diccionario.txt -q -O diccionario.txt  --inet4-only
echo "diccionario.txt"
echo ".."
wget https://raw.githubusercontent.com/hackingyseguridad/diccionarios/master/usuarios.txt -q -O usuarios.txt  --inet4-only
echo "usuarios.txt"
echo ".."
wget https://raw.githubusercontent.com/hackingyseguridad/diccionarios/master/usuarios0.txt -q -O usuarios0.txt  --inet4-only
echo "usuarios0.txt"
echo ".."
wget https://raw.githubusercontent.com/hackingyseguridad/diccionarios/master/claves.txt -q -O claves.txt  --inet4-only
echo "claves.txt"
echo ".."
wget https://raw.githubusercontent.com/hackingyseguridad/diccionarios/master/claves2.txt -q -O claves2.txt  --inet4-only
echo "claves2.txt"
echo ".."
wget https://raw.githubusercontent.com/hackingyseguridad/diccionarios/master/claves0.txt -q -O claves0.txt  --inet4-only
echo "claves0.txt"
echo ".."
echo "..."
echo "...."
echo "..... fin!"
echo
