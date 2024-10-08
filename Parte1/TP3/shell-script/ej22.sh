#!/bin/bash

# Imprime producto de cada elemento del arreglo

num=(10 3 5 7 9 3 5 4)

# Recibe arreglo como parámetro
productoria()
{
    local resultado=1
    
    for val in ${num[@]};
    do
        resultado=$(($resultado * $val))
    done

    echo "$resultado"
}

productoria