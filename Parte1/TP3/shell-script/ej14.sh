#!/bin/bash
# Renombra archivos de directorio pasado por parámetro

if [ $# -ne 3 ]; then
    echo "La cantidad de argumentos recibidos no es válida"
else
    if [ ! -d "$1" ]; then
        echo "No se ha indicando un directorio válido"
        exit 1
    else
        case "$2" in
            -a)
                for archivo in "$1"/*; 
                do
                    nombre_actual=$(basename "$archivo")
                    nombre_nuevo="$1/$nombre_actual$3"
                    mv "$archivo" "$nombre_nuevo"
                    echo "$nombre_actual -> $nombre_nuevo"
                done
            ;;
            -b)
                for archivo in "$1"/*; 
                do
                    nombre_actual=$(basename "$archivo")
                    nombre_nuevo="$1/$3$nombre_actual"
                    mv "$archivo" "$nombre_nuevo"
                    echo "$nombre_actual -> $nombre_nuevo"
                done
            ;;

            *)
                echo "La opción ingresada no es válida."
                echo "Solo -a y -b son admitidas."
                exit 2
            ;;
        esac
    fi
fi