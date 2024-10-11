#!/bin/bash

# Recibe rutas como parámetros y verifica aquellas en posiciones impares,
# evaluando si son archivos o directorios

evaluar_rutas()
{
    cantInexistentes=0

    for ((i=0; i < ${#paths[@]}; i++))
    do
        if (( (i+1) % 2 != 0 )); then
            path=${paths[i]}
            
            if [ -d $path ]; then
                echo "$path corresponde a un directorio"
            elif [ -f $path ]; then
                echo "$path corresponde a un archivo"
            elif ! [ -e $path ]; then
                (( cantInexistentes++ ))
            fi
        fi
    done

    echo "Cantidad de archivos o directorios inexistentes: $cantInexistentes"

    return 0
}

if [ $# -lt 1 ]; then
    echo "No se han recibido parámetros" >&2
    exit 1
fi

paths=($*)

evaluar_rutas

exit $?