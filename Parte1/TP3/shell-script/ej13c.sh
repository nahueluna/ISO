#!/bin/bash
#Informa si un archivo existe e indica su tipo. Sino lo crea.

if [ $# -ne 1 ]; then
    echo "No se ha indicado un archivo"
else
    path=$(find $HOME -name "$1")

    if [ "$path" != "" ]; then
        echo "El archivo $1 es de tipo: $(file $path | cut -d : -f2)"
    else
        echo "El archivo no existe. Se creará como directorio..."
        mkdir -p tmp/$1
        echo "Directorio creado en ./tmp/"
    fi

fi