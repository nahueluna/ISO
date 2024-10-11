#!/bin/bash

# Arreglo con usuarios del sistema del grupo "users"
# -b n retorna elemento en posición n o informa error
# -l devuelve longitud del arreglo
# -i imprime elementos del arreglo en pantalla

arreglo=()

obtener_usuarios()
{
    for user in $(grep -w "users" /etc/group | cut -d: -f4 | tr ',' '\n');
    do
        if [ $? -ne 0 ]; then
            return 2
        fi
        arreglo+=($user)
    done

    return 0
}

usuario_en_posicion()
{
    if [ $# -ne 1 ]; then
        echo "No se ha indicado una posición" >&2
        return 1
    fi

    if expr $1 + 0 >/dev/null 2>&1; then
        if [[ $1 -ge 0 && $1 -lt ${#arreglo[@]} ]] 2>/dev/null; then
            echo "${arreglo[$1]}"
            return 0
        else
            echo "La posición indicada no es válida"
            return 2
        fi
    else
        echo "El valor ingresado no es numérico"
        return 2
    fi
}

obtener_longitud_arreglo()
{
    echo "${#arreglo[@]}"
    return 0
}

imprimir_usuarios()
{
    echo "${arreglo[@]}"
    return 0
}

### MAIN

if [ $# -gt 2 ]; then
    echo "Cantidad de parámetros especificados no válida" >&2
    exit 1
fi


obtener_usuarios

if [ $? -ne 0 ]; then
    echo "Ocurrió un error obteniendo los usuarios" >&2
    exit 2
else
    case "$1" in
        "-b")
            usuario_en_posicion $2
        ;;
        "-l")
            obtener_longitud_arreglo
        ;;
        "-i")
            imprimir_usuarios
        ;;
        "")
            exit 0
        ;;
        *)
            echo "Parámetro no válido" >&2
            exit 1
        ;;
    esac

    exit $?
fi