#!/bin/bash
# Se solicitan 2 numeros y se imprime multiplicación, suma,
# resta y mayor de ambos.

echo "Ingrese dos numeros: "
read num1 num2
echo "$num1 + $num2 = $(expr $num1 + $num2)"
echo "$num1 - $num2 = $(expr $num1 - $num2)"
echo "$num1 * $num2 = $(expr $num1 \* $num2)"

if [ "$num1" -gt "$num2" ]; then
    echo "$num1 es mayor"
else
    echo "$num2 es mayor"
fi