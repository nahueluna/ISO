#!/bin/bash

# Imprime nombres de archivos en directorio actual
# intercambiando mayúsculas con minúsculas y eliminando letra "a"

for archivo in $(ls);
do
    name=$(echo "$archivo" | tr -d 'aA')

    echo "$name" |  tr '[:upper:][:lower:]' '[:lower:][:upper:]'
done