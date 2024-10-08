#!/bin/bash
#Calculadora de operaciones básicas

if [ $# -ne 3 ]; then
    echo "No se han indicado los parámetros necesarios"
else 
    case $1 in
        "+")
            echo "$2 + $3 = $(expr $2 + $3)"
        ;;
        "-")
            echo "$2 - $3 = $(expr $2 - $3)"
        ;;
        "*")
            echo "$2 * $3 = $(expr $2 \* $3)"
        ;;
        "%")
            echo "$2 % $3 = $(expr $2 \% $3)"
        ;;
        *)
            echo "El operador especificado no es válido." 
            echo "Recuerde indicarlo antes de los números."
            exit 1
        ;;
    esac
fi