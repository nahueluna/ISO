#!/bin/bash
# Recibe dos números por parámetro del script. Realiza suma,
# resta, multiplicación y verificación del mayor

if [ $# -ne 2 ]; then
    echo "No se han recibido los parametros necesarios"
else
    
    echo "$1 + $2 = $(expr $1 + $2)"
    echo "$1 - $2 = $(expr $1 - $2)"
    echo "$1 * $2 = $(expr $1 \* $2)"

    if [ "$1" -gt "$2" ]; then
        echo "$1 es mayor"
    else
        echo "$2 es mayor"
    fi
fi