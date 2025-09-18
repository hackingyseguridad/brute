



msfconsole -q -x "use auxiliary/scanner/ftp/ftp_version; set RHOSTS $1 ; run; exit"
msfconsole -q -x "use auxiliary/scanner/ftp/anonymous; set RHOSTS $1 ; run; exit"
msfconsole -q -x "use auxiliary/scanner/ftp/ftp_login; set RHOSTS $1; set USER_FILE /home/antonio/brute/usuarios0.txt; set PASS_FILE /home/antonio/brute/claves0.txt; set STOP_ON_SUCCESS true; run; exit"






