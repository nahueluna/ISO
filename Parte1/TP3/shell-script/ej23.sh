#!/bin/bash

# Imprime pares y cuenta impares de un arreglo numérico

arreglo=(1 2 3 4 5 6 7 8 27 34 99 102)

# Recibe elementos del arreglo
procesar_numeros()
{
    if [ $# -eq 0 ]; then
        echo "No se han recibido parámetros" >&2
        return 1
    fi
    
    local numeros=("$@")

    cantImpares=0
    for num in ${numeros[@]};
    do
        if ((num % 2 == 0)); then
            echo "Número par: $num"
        else
            (( cantImpares++ ))
        fi
    done

    echo "Cantidad de impares: $cantImpares"
    return 0
}

procesar_numeros ${arreglo[@]}