patator http_fuzz  method=GET url= https://$1/index.jsp auth_type=basic user=usuarios0.txt password=claves0.txt 0=usuarios0.txt 1=claves0.txt -x ignore:code=401
