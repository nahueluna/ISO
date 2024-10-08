#!/bin/bash
# Muestra números del 1 al 100 y sus cuadrados

echo "Números del 1 al 100 y sus cuadrados"

for i in $(seq 1 100); 
do
    echo "Número: $i"
    echo "Cuadrado: $(expr $i \* $i)"
    echo
done