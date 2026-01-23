#!/bin/sh
# Script educativo para probar conexiones telnet
# NO es un exploit real - solo prueba conexiones básicas

HOST="${1}"
PORT="${2:-23}"
USER="${3:-root}"

echo "========================================="
echo "Telnet Connection Tester"
echo "========================================="
echo "Host: $HOST"
echo "Port: $PORT"
echo "Trying connection..."

# Método 1: Intento de autenticación automática
echo -e "\n[1] Trying automatic authentication (-a flag)..."
timeout 5 telnet -a "$HOST" "$PORT" 2>&1 | grep -i "auth\|login\|fail\|error" | head -5

# Método 2: Conexión normal
echo -e "\n[2] Normal connection attempt..."
{
    sleep 1
    echo "$USER"
    sleep 1
    echo "help"
    sleep 2
    echo "quit"
} | timeout 10 telnet "$HOST" "$PORT" 2>&1 | tail -20

# Método 3: Banner grabbing
echo -e "\n[3] Banner grabbing..."
echo "" | timeout 5 nc "$HOST" "$PORT" 2>&1 | head -10

echo -e "\n========================================="
echo "Test completed"
echo "========================================="
