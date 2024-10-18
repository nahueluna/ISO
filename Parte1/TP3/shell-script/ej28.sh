#!/bin/bash

# Realice un script que reciba como parámetro el nombre de un directorio. Deberá validar que
# el mismo exista y de no existir causar la terminación del script con código de error 4. Si el
# directorio existe deberá contar por separado la cantidad de archivos que en él se encuentran
# para los cuales el usuario que ejecuta el script tiene permiso de lectura y escritura, e informar
# dichos valores en pantalla. En caso de encontrar subdirectorios, no deberán procesarse, y
# tampoco deberán ser tenidos en cuenta para la suma a informar.

if [ $# -ne 1 ]; then
    echo "No se han recibido parámetros" >&2
    exit 1
fi

if ! [ -d "$1" ]; then
    echo "El parámetro recibido no es un directorio" >&2
    exit 4
else
    # Modifica el separador de campo interno para que separe los elementos
    # por salto de línea, no por espacios (para archivos con espacios en su nombres) 
    IFS=$'\n'
    
    files=($(find "$1" -maxdepth 1 -type f ))
    filesNumber=0

    for file in ${files[@]};
    do
        if [[ -r $file && -w $file ]]; then
            (( filesNumber++ ))
        fi
    done

    # Se resetea el IFS por defecto
    unset IFS

    echo "Cantidad de archivos con permisos de lectura y escritura: $filesNumber"
    exit 0
fi