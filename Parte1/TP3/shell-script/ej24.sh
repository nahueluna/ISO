#!/bin/bash

# Sumar elementos de ambos vectores en una misma posición
# Precondición: ambos vectores tienen igual tamaño

vector1=(1 80 65 35 2)
vector2=(5 98 3 41 8)

sumar_vectores()
{
    for ((i=0; i < ${#vector1[@]}; i++))
    do
        num=$((${vector1[i]} + ${vector2[i]}))

        echo "La suma de los elementos de la posición $i de los vectores es $num"
    done

    return 0
}

sumar_vectores