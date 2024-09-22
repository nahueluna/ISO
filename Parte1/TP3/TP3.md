# Trabajo Práctico 3

## Shell Scripting

### 1. ¿Qué es el Shell Scripting? ¿A qué tipos de tareas están orientadas los script? ¿Los scripts deben compilarse? ¿Por qué?

El Shell es el intérprete de comandos dentro de los SO, siendo una interfaz de texto en forma de terminal que permite la comunicación del usuario con el sistema operativo.
Por su parte, los Script son pequeños programas que desempeñan una función específica y, por lo general, acotada. Estos no nece
Los Script realizados en el Shell, llamados Shell Scripts, no necesitan ser compilados, la Shell los interpreta línea a línea. Por lo tanto, un Script es un archivo de automatización de tareas.
El Shell Scripting es la técnica de diseñar y crear un Script para un Shell. Estos manejan un tipo de lenguaje de programación que generalmente es interpretado. Estos no traducen su código fuente (no se compilan), sino que permanecen en forma de texto y es el Shell que interpreta comando por comando cuando se ejecuta, lo que implica un mayor costo de procesamiento.
El Shell Scripting es principalmente utilizado para:
- Automatización de tareas repetitivas y rutinarias
- Desarrollar aplicaciones interactivas
- Desarrollar aplicaciones con interfaz gráfica (con el comando zenity, por
ejemplo)

### 2. Investigar la funcionalidad de los comandos echo y read. ¿Como se indican los comentarios dentro de un script? ¿Cómo se declaran y se hace referencia a variables dentro de un script?**

`echo` imprime en pantalla una linea de texto indicada, mientras `read` permite leer por teclado lo introducido en la entrada estandar y guardarlo en una variable.
Los comentarios se indican precediendolos con "#"
Las variables se declaran con la forma `<nombre_variable> = <valor>` y luego se hace referencia a ellas mediante la sintaxis `$<nombre_variable>`.

### 3. Script mostrar.sh

**(d)** Las backquotes en el comando `whoami` indican que lo introducido entre ellas será interpretado y ejecutado como comando por el Shell y se reemplazará por la salida estándar producida. En este caso, se ejecuta `whoami` y su resultado es introducido a la cadena de texto "Su usuario es: " para ser impreso en pantalla. La sintaxis de backquotes puede ser reemplazado por "$()".

### 4. Parametrización: ¿Cómo se acceden a los parámetros enviados al script al momento de su invocación? ¿Qué información contienen las variables "$#", "$*", "$?" y "$HOME" dentro de un script?

Para acceder a los parámetros de un script se utilizan las variables posicionales: `$x`, donde x es el número de argumento (Ej.: $1, $s2, $3).
`$#` indica la cantidad de argumentos pasados al script. `$*` representa todos los argumentos como un solo string. `$?` indica el código de salida del último comando ejecutado (útil para manejo de errores), representado 0 una ejecución correcta.
`$HOME` indica la ruta del directorio home/ del usuario que ejecuta el script.

### 5. ¿Cual es la funcionalidad de comando exit? ¿Qué valores recibe como parámetro y cual es su significado?

El comando `exit` permite finalizar la ejecución de un script o salir de una terminal de manera eficiente. Su sintaxis es `exit [valor]`, donde valor es un entero entre 0 y 255. Por defecto es 0 (indica que la ejecución finalizó sin errores), pero puede utilizarse otro valor para indicar errores o condiciones especiales.

### 6. El comando expr permite la evaluación de expresiones. Su sintaxis es: expr arg1 op arg2, donde arg1 y arg2 representan argumentos y op la operación de la expresión. Investigar que tipo de operaciones se pueden utilizar.

Los tipos de operaciones aceptadas son:
- ARG1 | ARG2: or
- ARG1 & ARG2: and
- ARG1 < ARG2
- ARG1 <= ARG2
- ARG1 = ARG2
- ARG1 != ARG2
- ARG1 >= ARG2
- ARG1 > ARG2
- ARG1 + ARG2
- ARG1 - ARG2
- ARG1 * ARG2
- ARG1 / ARG2
- ARG1 % ARG2
- STRING : REGEXP o match STRING REGEXP: evalúa si STRING coindice con patrón definido en REGEXP. Si hay coincidencia, devuelve la longitud de la parte coincidente, sino 0.
- substr STRING POS LENGTH: obtener substring a partir de posicion de una determinada longitud
- index STRING CHARS: índice donde se encuentra CHARS en STRING
- length STRING
- \+ TOKEN: interpreta TOKEN como string
- ( EXPRESSION ): valor de una expresion

### 7. El comando “test expresión” permite evaluar expresiones y generar un valor de retorno, true o false. Este comando puede ser reemplazado por el uso de corchetes de la siguiente manera [ expresión ]. Investigar que tipo de expresiones pueden ser usadas con el comando test. Tenga en cuenta operaciones para: evaluación de archivos, evaluación de cadenas de caracteres y evaluaciones numéricas.

**Evaluación de cadenas**
- `-n STRING` verifica si la cadena no está vacía
- `-z STRING` Verifica si la cadena está vacía
- `STRING1 = STRING2` verifica si las cadenas son iguales
- `STRING1 != STRING2` verifica si las cadenas son distintas

**Evaluación de enteros**
- `INTEGER1 -eq INTEGER2` verifica si los numeros son iguales
- `INTEGER1 -ge INTEGER2` verifica si INTEGER1 >= INTEGER2
- `INTEGER1 -gt INTEGER2` verifica si INTEGER1 > INTEGER2
- `INTEGER1 -le INTEGER2` verifica si INTEGER1 <= INTEGER2
- `INTEGER1 -lt INTEGER2` verifica si INTEGER1 < INTEGER2
- `INTEGER1 -ne INTEGER2` verifica si los numeros son distintos

**Evaluación de archivos**
- `FILE -ef FILE2` verifica si los archivos tienen el mismo número de dispositivo e inodo
- `FILE1 -nt FILE2` verifica si FILE1 es más nuevo (fecha de modificación) que FILE2
- `FILE1 -ot FILE2` verifica si FILE1 es más viejo que FILE2
- `-b FILE` verifica si FILE existe y es block special (maneja datos en bloques, normalmente para comunicarse con unidades de almacenamiento)
- `-c FILE` verifica si FILE existe y es character special
- `-d FILE` verifica si existe y es directorio
- `-e FILE` verifica si el archivo existe
- `-f FILE` verifica si existe y es un archivo regular
- `-h FILE` verifica si existe y es un symbolic link
- `-N FILE` verifica si existe y fue modificado desde que se leyó por última vez
- `-O FILE` verifica si existe y el usuario que ejecuta el comando es el propietario
- `-r FILE` verifica si existe y el usuario tiene acceso de lectura
- `-s FILE` verifica si existe y tiene un tamaño mayor a 0
- `-w FILE` verifica si existe y tiene acceso de escritura
- `-x FILE` verifica si existe y tiene acceso de ejecución o búsqueda

### 8. Estructuras de control. Investigue la sintaxis de las siguientes estructuras de control incluidas en shell scripting: if, case, while, for, select.

- if:
```bash
if [ condicion ]; then
    # código
elif [ condicion ]; then
    # código
else
    # código
fi
```

- case:
```bash
case variable in
    patron1)
        # código
        ;;
    patron2)
        # código
        ;;
    *)
        # código
        ;;
esac
```

- while:
```bash
while [ condicion ]; do
    # código
done
```

-for: 
```bash
for variable in lista; do
    # código
done

for((i=1; i<=x; i++)); do
    # código
done
```

- select:
```bash
select variable in valor1, valor2, valor3; do
    # código
    break
done
```

### 9. ¿Qué acciones realizan las sentencias break y continue dentro de un bucle? ¿Qué parámetros reciben?

`break [n]` termina el bucle inmediatamente y la ejecución continúa en la línea siguiente después del bucle. Puede indicarse la cantidad de niveles de bucle del que salir. Por defecto sale del más interno.
`continue [n]` salta a la siguiente iteración del bucle, omitiendo las instrucciones restantes de la iteración actual. Puede recibir un número opcional que indica los niveles de bucle a continuar (EJ.: `continue 1` salta a la siguiente iteración del bucle más interno mientras `continue 2` continuaría a la siguiente iteración del bucle externo al más interno, el de segundo nivel)

### 10. ¿Qué tipo de variables existen? ¿Es shell script fuertemente tipado? ¿Se pueden definir arreglos? ¿Cómo?

Se tienen variables escalares (permiten almacenar un solo valor), como pueden ser numéricos o strings.
También se tienen las variables de entorno que posee información con respecto al entorno de ejecución ($HOME es un ejemplo).
Otras variables útiles con información referente al script son $0, $$, $?, $n, $*, $@ y $# (algunos ya mencionados).
También se tienen arrays, que pueden ser definidos e inicializados de la siguiente forma:

```bash
arreglo_a = ( )  # creación vacía
arreglo_b = ( 1 2 3 4 )    # inicialización

arreglo_b[0] = 5    # asignar valor a posición

echo ${arreglo_b[1]}    # acceso a posición

echo ${arreglo_b[*]}    # acceso a todos los valores del arreglo

${#arreglo_a[*]}    # tamaño del arreglo

unset arreglo_b[0] # borrado de un elemento
```

Shell Scripting es débilmente tipado, pues no se necesita indicar el tipo de una variable al momento de crearla. Además, las variables pueden almacenar distintos tipos de datos en diferentes momentos sin necesidad de conversiones explícitas.

### 11. ¿Pueden definirse funciones dentro de un script? ¿Cómo? ¿Cómo se maneja el pasaje de parámetros de una función a la otra?

Las funciones dentro de los scripts permiten modularizar comportamientos. Pueden ser declarados de dos formas:
```
function nombre { block }
nombre() { block }
```

Con la sentencia `return` se retorna un valor entre 0 y 255. El valor de retorno puede ser evaluado con "$?".
Los argumentos se reciben en las variables $1, $2, etc. Para manejar el pasaje de parámetros, se usan dichas variables en el cuerpo de la función y luego en la invocación se pasan los argumentos necesarios.
