#!/bin/bash
# Recibe extensión e imprime reporte con username y archivos con
# dicha extensión

if [ $# -ne 1 ]; then
    echo "No se ha recibido el parámetro correspondiente" >&2
    exit 1
fi

echo -n > tmp/reporte.txt

for linea in $(cat "/etc/passwd" | cut -d: -f 1,6);
do
    user=$(echo $linea | cut -d: -f1)
    home=$(echo $linea | cut -d: -f2)

    if [ -d $home ]; then
        echo "$user $(find $home -name "*.$1" 2> "/dev/null" | wc -l)" >> "tmp/reporte.txt" 
    fi
done