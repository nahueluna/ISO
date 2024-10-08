#!/bin/bash
# Menú con opciones para listar contenido, indicar ubicación e
# informar usuarios conectados

select action in Listar DondeEstoy QuienEsta Exit
do
    case $action in
        "Listar") 
            echo "Contenido del directorio:"
            ls
        ;;
        "DondeEstoy")
            echo "Ubicación:"
            pwd
        ;;
        "QuienEsta")
            echo "Usuarios conectados al sistema:"
            who
        ;;
        "Exit")
            exit 0
        ;;
        *)
            echo "Opción no válida"
        ;;
        esac
done