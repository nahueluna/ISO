#!/bin/bash

# Realice un script que mueva todos los programas del directorio actual (archivos ejecutables)
# hacia el subdirectorio “bin” del directorio HOME del usuario actualmente logueado. El script
# debe imprimir en pantalla los nombres de los que mueve, e indicar cuántos ha movido, o
# que no ha movido ninguno. Si el directorio “bin” no existe,deberá ser creado.

destino="$HOME/bin/"

if ! [ -d "$destino" ]; then
    echo "Directorio bin no existe"
    echo "Creando directorio..."
    mkdir "$destino"
fi

cantMovidos=0

IFS=$'\n'

for file in $(find -maxdepth 1 -type f -executable);
do
    echo "$file"
    mv "$file" "$destino"
    (( cantMovidos++ ))
done

echo "Cantidad de archivos movidos: $cantMovidos"

unset IFS

exit 0