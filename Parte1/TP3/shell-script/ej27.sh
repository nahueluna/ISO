#!/bin/bash

# Realiza funciones de arreglos: inicializar, agregar, eliminar,
# longitud, imprimir, inicializar con valores

inicializar()
{
    arreglo_vacio=()
}

agregar_elem()
{
    if [ $# -ne 1 ]; then
        echo "Cantidad de parámetros inválida" >&2
        return 1
    fi
    
    arreglo_vacio+=($1)
}

eliminar_elem()
{
    if [ $# -ne 1 ]; then
        echo "Cantidad de parámetros inválida" >&2
        return 1
    fi

    # Comprueba si es un número, pues si no lo es falla
    if expr $1 + 0 >/dev/null 2>&1; then
        if [[ $1 -ge 0 && $1 -lt ${#arreglo_vacio[@]} ]]; then
            unset arreglo_vacio[$1]
            return 0
        fi
    fi

    return 2
}

longitud()
{
    echo "${#arreglo_vacio[@]}"
}

imprimir()
{
    echo "${arreglo_vacio[@]}"
}

inicializar_con_valores()
{
    if [ $# -ne 2 ]; then
        echo "Cantidad de parámetros inválida" >&2
        return 1
    fi

    arreglo_con_valores=()

    for i in $(seq 0 $(($1 - 1)));
    do
        arreglo_con_valores+=($2)
    done

    return 0
}