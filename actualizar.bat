@echo off
echo " "
echo "... actualizando diccionarios ...   2022 hackingyseguridad.com "
echo ".."
curl -k https://raw.githubusercontent.com/hackingyseguridad/diccionarios/master/diccionario.txt -O 
echo "diccionario.txt"
echo ".."
curl -k https://raw.githubusercontent.com/hackingyseguridad/diccionarios/master/usuarios.txt -O
echo "usuarios.txt"
echo ".."
curl -k https://raw.githubusercontent.com/hackingyseguridad/diccionarios/master/claves.txt -O
echo "claves.txt"
echo ".."
curl -k https://raw.githubusercontent.com/hackingyseguridad/diccionarios/master/claves2.txt -O
echo "claves2.txt"
echo ".."
echo "..."
echo "...."
echo "..... fin!"
echo " "
