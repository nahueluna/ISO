#!/bin/bash

# Guarda en arreglo todos los archivos .doc de /home
# Posee funciones para: 
# - ver archivo en el arreglo por nombre (si no está retorna código 5)
# - ver cantidad de archivos .doc en /home
# - borrar física o lógicamente el archivo

buscarArchivo()
{
    if [ $# -ne 1 ]; then
        return 1
    fi

    position=-1

    for (( i=0; i < ${#files[@]}; i++ ))
    do
        fileName=$(basename "${files[$i]}")

        if [[ "$fileName" == "$1" ]]; then
            position=$i
            break
        fi
    done

    echo "$position"

    if [ $position -ne -1 ]; then
        return 0
    else
        return 5
    fi
}

verArchivo()
{
    if [ $# -ne 1 ]; then
        echo "No se ha recibido un parámetro" >&2
        return 1
    fi

    pos=$(buscarArchivo $1)

    if [ $pos -ne -1 ]; then
        echo "${files[$pos]}"
        return 0
    else
        echo "Archivo no encontrado" >&2
        return 5
    fi
}

cantidadArchivos()
{
    echo "Cantidad de archivos .doc: ${#files[@]}"
}

borrarArchivo()
{
    if [ $# -ne 1 ]; then
        echo "No se ha recibido un parámetro" >&2
        return 1
    fi

    pos=$(buscarArchivo $1)

    if [ $pos -ne -1 ]; then
        echo "¿Desea eliminar el archivo lógicamente?"

        select answer in "Yes" "No"; do
            case $answer in
                "Yes")
                    unset files[$pos]
                    break
                ;;

                "No")
                    rm -f ${files[$pos]}
                    unset files[$pos]
                    break
                ;;

                *)
                    echo "Opción inválida"
                ;;
            esac
        done

    else
        echo "Archivo no encontrado" >&2
        return 10
    fi
}

files=()

IFS=$'\n'

for file in $(find /home -type f -name "*.doc");
do
    files+=("$file")
done

unset IFS

exit $?