#!/bin/bash

# Implementar estructura de pila

pila=()

push()
{
    if [ $# -ne 1 ]; then
        echo "No se ha indicado valor a guardar"
        return 1
    fi
    
    pila+=($1)

    return 0
}

pop()
{    
    local pos=$((${#pila[@]}-1))
    unset pila[pos]
    
    return 0
}

length()
{
    echo "${#pila[@]}"
    return 0
}

print()
{
    echo "${pila[*]}"
}

select operacion in "push" "pop" "length" "print" "Exit"
do
    case $operacion in
        "push")
            read -p "Ingrese valor a pushear: " var
            push $var
        ;;
        "pop")
            pop
        ;;
        "length")
            length
        ;;
        "print")
            print
        ;;
        "Exit")
            exit 0
        ;;
        *)
            echo "Opción inválida"
        ;;
        esac
done