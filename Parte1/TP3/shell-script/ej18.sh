#!/bin/bash

# Verifica cada 10s si el usuario pasado por parámetro se logueo

if [ $# -ne 1 ]; then
    echo "No se ha indicado un usuario" >&2
    exit 1
fi

while true
do
    echo "Verificando usuarios conectados..."
    users=$(who | tr -s ' ' | cut -d ' ' -f1)
    
    # no usa [] porque devolverá un código de salida 0 o 1
    # que indicará si se ejecuta el if o no
    if echo "$users" | grep -q "$1"; then
        echo "Usuario $1 logueado en el sistema"
        exit 0
    fi

    sleep 10
done