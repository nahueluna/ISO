#!/bin/bash
# Comentarios acerca de lo que hace el script
# Siempre comento mis scripts, si no hoy lo hago
# y mañana ya no me acuerdo de lo que quise hacer
echo "Introduzca su nombre y apellido:"
read nombre apellido
echo "Ingrese un directorio: "
read ruta
echo "Fecha y hora actual:"
date
echo "Su apellido y nombre es:"
echo "$apellido $nombre"
echo "Su usuario es: `whoami`"
echo "Su directorio actual es: `pwd`" 
echo "Su directorio personal es: $HOME"
echo -e "El contenido del directorio $ruta es: \n$(ls $ruta)"
echo -e "Su espacio libre en disco es: \n$(df)"