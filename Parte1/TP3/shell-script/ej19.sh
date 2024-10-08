#!/bin/bash

# Menú de ejercicios anteriores

select choice in "03 mostrar" "012 evaluar expresiones" "012 calculadora" "013 numeros" "013 archivos" "016 extension" "017 case change" "Salir"
do
    case "$choice" in
        "03 mostrar")
            echo "Muestra información del usuario"
            ./mostrar.sh
        ;;
        "012 evaluar expresiones")
            echo "Operaciones matemáticas básicas"
            read -p "Ingrese dos números: " num1 num2
            ./ej12b.sh $num1 $num2
        ;;
        "012 calculadora")
            echo "Calculadora"
            read -p "Ingrese dos números: " num1 num2
            read -p "Ingrese operador: " op
            ./ej12c.sh $op $num1 $num2
        ;;
        "013 numeros")
            echo "Números del 1 al 100 y sus cuadrados"
            ./ej13a.sh
        ;;
        "013 archivos")
            echo "Opciones para listar contenido, mostrar directorio y usuarios"
            ./ej13b.sh
        ;;
        "016 extension")
            echo "Reporte cantidad de archivos de extensión por user"
            read -p "Ingrese la extensión: " extension
            ./ej16.sh $extension
        ;;
        "017 case change")
            echo "Imprime nombres archivos cambiando mayúsculas por minúsculas y elimina la a"
            ./ej17.sh
        ;;
        "Salir")
            exit 0
        ;;
        *)
            echo "Opción no válida"
        ;;

    esac
done