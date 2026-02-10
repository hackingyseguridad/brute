#!/usr/bin/env bash
echo
echo "... actualizando diccionarios ...   2024 hackingyseguridad.com "
chmod 777 *
echo ".."
echo "."
echo
wget https://raw.githubusercontent.com/hackingyseguridad/diccionarios/master/diccionario.txt -q -O diccionario.txt  --inet4-only
wc -l diccionario.txt
echo ".."
wget https://raw.githubusercontent.com/hackingyseguridad/diccionarios/master/usuarios.txt -q -O usuarios.txt  --inet4-only
wc -l usuarios.txt
echo ".."
wget https://raw.githubusercontent.com/hackingyseguridad/diccionarios/master/usuarios0.txt -q -O usuarios0.txt  --inet4-only
wc -l usuarios0.txt
echo ".."
wget https://raw.githubusercontent.com/hackingyseguridad/diccionarios/master/claves.txt -q -O claves.txt  --inet4-only
wc -l claves.txt
echo ".."
wget https://raw.githubusercontent.com/hackingyseguridad/diccionarios/master/claves2.txt -q -O claves2.txt  --inet4-only
wc -l claves2.txt
echo ".."
wget https://raw.githubusercontent.com/hackingyseguridad/diccionarios/master/claves0.txt -q -O claves0.txt  --inet4-only
wc -l claves0.txt
echo ".."
wget https://github.com/RykerWilder/rockyou.txt/blob/main/rockyou.txt.zip --inet4-only
echo ".."
echo "..."
echo "...."
echo "..... fin!"
echo

