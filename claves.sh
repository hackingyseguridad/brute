#!/bin/bash

# Script para generar diccionarios, enriquecidos con Mayusculas y caracteres numericos al final
# Lee las palabas y modificar sobre cada una, del fichero: claves.txt
# modifica a mayuscula y minuscula el primer caracter e incluye dos numeros al finl.
# Genera un fichero que incluya todas las palabras nuevas y las ya existentes en: passwords.txt
# hackingyseguridad.com 2025

# Verificar si el archivo claves0.txt existe
if [ ! -f "claves.txt" ]; then
    echo "Error: claves0.txt no existe."
    exit 1
fi

# Generar claves3.txt con contraseñas originales y variantes
> claves3.txt  # Limpiar el archivo si ya existe

while IFS= read -r password; do
    if [ -n "$password" ]; then
        # Añadir la contraseña original al archivo
        echo "$password" >> passwords.txt

        # Generar variante con primera letra MAYÚSCULA + números 00-99
        first_upper="${password^}"
        for num in {00..99}; do
            echo "${first_upper}${num}" >> passwords.txt
        done

        # Generar variante con primera letra minúscula + números 00-99
        first_lower="${password,}"
        for num in {00..99}; do
            echo "${first_lower}${num}" >> passwords.txt
        done
    fi
done < "claves.txt"
echo " ."
echo " .."
echo " ..."
