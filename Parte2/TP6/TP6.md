# Trabajo Práctico 6

## Administración de E/S

### 1. Dispositivos

#### (a) Los dispositivos, según la forma de transferir los datos, se pueden clasificar en 2 tipos:
**- Orientados a bloques**
**- Orientados a flujos**
**Describa las diferencias entre ambos tipos.**

- Dispositivos orientados a bloques:

Los dispositivos de este estilo se caracterizan por transmitir los datos en conjuntos indivisibles llamados bloques. Estos tienen un tamaño fijo, como puede ser 512 bytes. Para realizar operaciones de lectura y escritura, es necesario transferir los datos organizados en bloques.
Poseen acceso aleatorio, garantizando un acceso directo a cualquier bloque.
Estos dispositivos utilizan buffers que almacenan bloques temporalmente. Son óptimos para operaciones masivas de lectura/escritura.
La unidad más pequeña direccionable en un dispositivo orientado a bloques se denomina sector. Un bloque puede estar conformado por uno o más sectores de información.
Son adecuados para sistemas de almacenamiento persistente.

- Dispositivos orientados a flujos

Se destacan por transferir los datos en un flujo constante de bytes o caracteres. Su tipo de acceso es secuencial, permitiendo leer o escribir únicamente en un orden de este tipo.
Suelen tener un buffer para el flujo continuo, pero no almacenan bloques de información como los dispostivos orientados a bloques.
Son adecuados para dispositivos de E/S como teclados o impresoras. Su eficiencia se enfoca en las operaciones interactivas.

### (b) Cite ejemplos de dispositivos de ambos tipos.

Algunos ejemplos de dispositivos orientados a bloques son discos duros (HDD), discos de estado sólido (SSD) y unidades ópticas como CD, DVD, Blu-ray.
Por otro lado, entre los dispositivos orientados a flujos se encuentran los teclados, mouses e impresoras.

### (c) Enuncie las diferencias que existen entre los dispositivos de E/S y que el SO debe considerar.

El principal problema que enfrenta el SO al administrar dispositivos E/S es la heterogeneidad de los mismos. Algunas diferencias entre estos dispositivos son: 
- Unidad de transferencia : por bloque o caracter
- Forma de acceso: secuencial o aleatorio
- Tipo de acceso: compartido o exclusivo 
- Velocidad de transferencia de los datos
- Direccionalidad de los datos: unidireccional o bidireccional
- Requerimientos de sincronización: considera dispositivos lentos que operan en tiempo real mientras otros que pueden operar de forma asincrónica

### 2. Técnicas de E/S. Describa como trabajan las siguientes técnicas de E/S
- **E/S programada**
- **E/S dirigida por interrupciones**
- **DMA (Acceso Directo a Memoria)**

- E/S programada

En esta técnica de E/S, la CPU controla directamente el intercambio de datos entre el dispositivo externo y la memoria principal, mediante instrucciones I/O específicas.
La CPU ejecuta un bucle de espera (polling) para verificar el estado del dispositivo. Si este está listo, la CPU inicia la operación. Una vez completada, la CPU regresa a sus tareas principales.
Es la alternativa más simple en cuanto a implementación, pero es ineficiente pues la CPU debe esperar la respuesta del dispositivo externo, tiempo en el cual permanece ociosa.

- E/S dirigida por interrupciones

En este método, el dispositivo externo notifica a la CPU cuando está listo para realizar la operación, mediante una interrupción. La CPU puede realizar otras tareas mientras espera por dicha interrupción.
En cuanto a su funcionamiento, el proceso comienza cuando la CPU inicia una operación E/S, y luego reanuda sus tareas. Cuando el dispositivo está listo o la operación finalizó, notifica a la CPU mediante una interrupción. En ese momento, esta ejecuta el controlador de interrupción para manejar la E/S y luego continúa con sus tareas principales.
Es más eficiente que la anterior alternativa, ya que permite que la CPU realice trabajo útil mientras espera por la finalización de la operación E/S. Sin embargo, interrupciones frecuentes pueden causar sobrecargas.

- DMA (Direct Memory Access)
El DMA es un dispositivo que apoya a la CPU en la atención de operaciones E/S. Este permite que el dispositivo externo tranfiera datos a la memoria sin intervención de la CPU.
Ante una operación E/S, la CPU configura el DMA con las direcciones de origen y destino en la memoria, la cantidad de datos a transferir y el dispositivo externo involucrado. El DMA realiza la transferencia y, una vez completada, notifica a la CPU mediante una interrupción.
Eficiente para grandes volúmenes de datos, y permite liberar a la CPU de responsabilidades para administrar la E/S. Sin embargo, el DMA requiere utilizar el bus de datos, por lo que la podría aumentar la latencia de acceso a este para la CPU durante la realización de una operación I/O.

### 3. La tecnica de E/S programa puede trabajar de dos formas:
- **E/S mapeada**
- **E/S aislada**
**Indique como trabajan estas 2 técnicas.**

- E/S mapeada

La técnica de Memory mapped I/O concibe una correspondencia en memoria, en la que tanto dispostivos como la memoria principal comparten un espacio de direcciones. Por lo tanto, las operaciones de E/S utilizan instrucciones de escritura y lectura en memoria.

- E/S aislada

El método de Isolated I/O posee un espacio de direcciones separado entre la memoria principal y los dispositivos. Se utilizan puertos de E/S y se tiene un conjunto limitado de instrucciones especiales para gestionar las operaciones I/O. El espacio de direcciones dedicado a los puertos E/S es menor que en la técnica de MMIO, donde residen en las mismas direcciones.

### 4. Enuncie las metas que debe perseguir un SO para la administración de la entrada salida.

El Sistema Operativo tiene la responsabilidad de controlar los dispostivos de E/S mediante la generación de comandos (para la utilización de estos), el manejo de interrupciones y el manejo de errores.
Como se mencionó anteriormente, surgen problemas debido a la heterogeneidad de los dispositivos. Por ellos, el SO tiene como objetivo manejar los dispositivos E/S de manera uniforme y estandarizada. A su vez, debe proveer una capa de abstracción para el manejo de alto nivel de los dispositivos, con operaciones comunes (como read, write, open, close), ocultando detalles del dispositivo en rutinas de niveles más bajos.
Esto con el fin de proveer al usuario programador una interfaz uniforme y con determinado nivel de abstracción de los distintos dispositivos que se manejan.
En términos de eficiencia, los dispositivos I/O pueden resultar considerablemente lentos en comparación con la memoria y la CPU. El SO debe brindar alternativas para el manejo de estas cuestiones. El uso de multiprogramación, por ejemplo, permite que mientras un proceso se bloquea por una operación E/S, otro se ejecute (considerando el uso de DMA).
El SO también debe gestionar la planificación, organizando los requerimientos de los dispostivos.

### 5. Drivers

#### (a) ¿Qué son?

Los drivers o controladores son programas de software especializados que actúan como intermediarios entre el SO y los dispositivos externos. Su función principal es permitir que el SO se comunique de manera efectiva con los dispositivos E/S. No son parte del código del Kernel pero se cargan como módulos en el espacio de direcciones del mismo. Los fabricantes de Hardware implementan el driver en función de una API especificada por el SO, para que este pueda comunicarse de forma genérica mediante una interfaz, utilizando un set de comandos estándar (los utiliza para todos los dispositivos), que serán traducidos por el controlador para realizar tareas específicas sobre el dispositivo E/S.
Facilitan la portabilidad, ya que los fabricantes solo deben proporcionar un driver para integrar su dispositivo con múltiples sistemas operativos.

#### (b) ¿Qué funciones mínimas deben proveer?

Debe proveer funciones mínimas de:
- Inicialización: configurar y preparar el dispositivo para ser usado.
- Gestión de operaciones E/S: ejecutan operaciones de lectura, escritura o transmisión de datos entre el dispositivo y la memoria principal.
- Manejo de interrupciones: detectan y responden a las señales de interrupción generadas por el dispositivo para indicar finalización de tareas o errores.
- Control y configuración: permiten al SO cambiar parámetros del dispositivo
- Detección y corrección de errores: supervisan el estado del dispositivo e informan errores al SO.
- Acceso y manipulación de buffers de E/S
- Interfaz con el SO: debe proporcionar una interfaz estándar para que el SO interactúe con él. Esto puede incluir la implementación de funciones específicar para abrir, cerrar, leer o escribir un dispositivo.

#### (c) ¿Quién determina cuales deben ser estas funciones?

Las funciones mínimas que debe tener un driver para poder interactuar correctamente con el sistema, tal como se mencionó anteriormente, son principalmente determinadas por el SO a través de una API de controladores.
Existen casos en los que las especificaciones del fabricante del Hardware define ciertas funciones que deben ser soportadas para garantizar la compatibilidad con el dispositivo.

### 6. Realice un grafico que marque la relación entre el Subsistema de E/S, los drivers, los controladores de dispositivos y los dispositivos.

![alt text](img/grafico6.png)

### 7, 8. Describa mediante un ejemplo los pasos mínimos que se suceden desde que un proceso genera un requerimiento de E/S hasta que el mismo llega al dispositivo.

Para detallar el procedimiento de la llegada de un requerimiento E/S, consideremos la lectura sobre un archivo en un disco.
1. Determinar el dispositivo que almacena los datos

Implica la interpretación del nombre del archivo. El SO identifca el archivo solicitado a través del filesystem. El nombre del archivo se traduce en un identificador único (descriptor) que informa sobre su ubicación (como en que partición o dispositivo está).
A partir de esto, el SO identifica en qué dispositivo están contenidos los datos (HDD, SSD, etc.).

2. Traducir el nombre del archivo en la representación del dispositivo

El SO utiliza el file system para traducir el nombre del archivo en un su inodo **(*)**. Este contiene información sobre la ubicación física de los datos, así como de los permisos, tamaño, entre otros atributos.
Con esta información, el SO localiza qué bloques del dispositivo contienen los datos del archivo.

3. Traducir requerimiento abstracto en bloques de disco

El file system traduce la solicitud de leer una cantidad abstracta de datos en bloques físicos específicos del dispositivo. Esto incluye determinar el número de bloque inicial, el tamaño del bloque, y cuantos bloques deben ser leídos.
En esta etapa ocurre la planificación de E/S para optimizar el orden en que se leen los bloques.

4. Realizar lectura física de los bloques en la memoria

El SO envía una solicitud al driver del disco, indicando que bloques deben leerse. El driver traduce este requerimiento en comandos que el dispositivo comprenda. En este punto, se realiza la transferencia de datos desde el dispositivo a la memoria principal (de forma directa si es manejada por DMA).
Luego, el controlador puede realizar verificaciones de integridad.

5. Marcar los datos como disponibles y desbloquear el proceso

El SO registra que los datos han sido leídos y están disponivles. Luego, mediante los schedulers desbloquea el proceso que se encontraba en estado de espera, indicándole que que puede acceder a los datos.

6. Retornar el control al proceso

El SO informa al proceso que la operación E/S finalizó. Si falló, recibe además un código de error. Luego de esto, el proceso está listo para ejecutarse.

___

**(*)** La traducción del nombre de un archivo en la representación del dispositivo se realiza mediante el análisis del path absoluto. Consta de varios pasos:

1. Interpretación del path absoluto

El path absoluto es una cadena de texto que describe la ubicación completa del archivo desde la raíz del sistema de archivos.

2. Consulta de las estructuras de datos del sistema de archivos

El SO usa estructuras internas, como tablas de inodos, para localizar cada componente del path.
El SO accede al descriptor del directorio raíz, que está predefinido y apunta al bloque físico donde está almacenado.
A partir de este, el sistema busca el siguiente segmento del path. Una vez localizado, el Kernel obtiene su descriptor e identifica donde se encuentra almacenado físicamente. Esto se repite para cada segmento hasta llegar al archivo objetivo.

3. Identificación del dispositivo de almacenamiento

El path absoluto especifica indirectamente a qué dispositivo pertenece el archivo. Esto sucede porque los file systems se montan en puntos específicos del árbol del sistema de archivos. Durante el análisis del path, el SO detecta si el segmento (del path) corresponde a un punto de montaje. Si es así, redirige la búsqueda al file system montado en ese punto.
Además, cada file system está asociado con un dispositivo o partición. Al resolver el path, el SO puede determinar que el archivo pertenece a un dispositivo específico.

4. Traducción al dispositivo físico

Una vez localizado el archivo, el SO identifica los bloques físicos donde está almacenado el archivo dentro del file system correspondiente. Además, Usa la información del punto de montaje para determinar que dispositivo físico contiene los bloques.
___

### 9. Enuncie que servicios provee el SO para la administración de E/S.

Algunos servicios que provee el SO para la administración de E/S son:

- Buffering: almacenamiento de los datos en memoria mientras se transfiere. Soluciona problemas de velocidad entre los dispositivos y problemas de tamaño y/o forma de los datos entre ellos. Esto último se debe a que el Kernel recibe la información, la organiza y la envía. Los datos no son envíados de forma "cruda" como se reciben.

- Caching: mantener en memoria copia de los datos de reciente acceso para mejorar la performance. Se mantienen en memoria principal, para evitar hacer E/S continuamente.

- Spooling: administrar la cola de requerimientos de un dispositivo. Hay dispositivos de acceso exclusivo que no pueden atender distintos requerimientos al mismo tiempo. Por ejemplo, una impresora. Entonces, los dispositivos no envían datos a imprimir, sino que los envían a una cola de impresión, y de allí se coordinan para enviarse a imprimir. 
Para gestionar esto, el spooling es un mecanismo para coordinar el acceso concurrente al dispositivo, para aquellos que no admiten acceso de este tipo.

### 10. Describa en forma sintética, cómo es la organización física de un disco, puede utilizar gráficos para mayor claridad.

![alt text](img/grafico10_1.png)

Se compone de platos, que son los discos magnéticos que almacenan datos. Cada plato tiene caras útiles (1 o 2 por plato). Las caras son cada una de las superficies del plato, que pueden almacenar datos. Posee un brazo con cabezal de lectura/escritura por superficie.
Los discos giran. Su velocidad se mide en rpm.

![alt text](img/grafico10_2.png)

La cara de un disco tiene pistas (tracks), que son cada una de las circunferencias del plato. Las pistas, a su vez, tienen sectores, que son al mínima unidad direccionable de un disco. Tienen un tamaño definido, típicamente 512 bytes.
Las unidades de disco se direccionan como un arreglo de bloques lógicos, que suelen ser la unidad de transferencia más chica. Puede corresponderse con un sector.
Un cilindro es un conjunto de pistas alineadas verticalmente a través de todas las caras de todos los platos (alineadas verticalmente refiere que están en una misma posición del brazo). Así, el cilindro N se corresponde con todas las n-ésimas pistas de todas las caras.

### 11. La velocidad promedio para la obtención de datos de un disco esta dada por la suma de los siguientes tiempos:
- **Seek Time**
- **Latency Time**
- **Transfer Time**

**De una definición para estos tres tiempos.**

- Seek Time:

El seek time o posicionamiento, es el tiempo que tarde en posicionarse el cabezal del brazo del disco sobre el cilindro donde se encuentra el dato a transferir. De los tiempos de obtención de datos de un disco, es el parámetro que más influye en el incremento del tiempo de acceso.

- Latency Time:

La latencia es el tiempo que sucede desde que la cabeza se posiciona en el cilindro hasta que el sector en cuestión pasa por debajo de la misma.

- Transfer Time:

Describe el tiempo de transferencia de los datos del sector (bloque) del disco a memoria principal.

### 12. Suponga un disco con las siguientes características:
**- 7 platos con 2 caras utilizables cada uno.**
**- 1100 cilindros**
**- 300 sectores por pista, donde cada sector de es 512 bytes.**
**- Seek Time de 10 ms**
**- 9000 RPM**
**- Velocidad de Transferencia de 10 MiB/s (Mebibytes por segundos).**

#### (a) Calcule la capacidad total del disco.

Dado que los cilindros son conjuntos de pistas alineadas verticalmente entre todas las caras, el hecho de que hayan 1100 cilindros implica que hay 1100 pistas por cada cara.

> $Capacidad\ del\ disco = 7\ platos \times 2\ caras\ por\ plato \times 1100\ pistas\ por\ cara \times 300\ sectores\ por\ pista \times 512\ bytes\ por\ sector = 2255.859375MiB$

#### (b) ¿Cuantos sectores ocuparía un archivo de tamaño de 3 MiB(Mebibytes)?

> $3MiB = 3 \times 2²⁰ = 3145728B$
> $\frac{3145728B}{512\ B/sector} = 6144\ sectores$

#### (c) Calcule el tiempo de transferencia real de un archivo de 15 MiB(Mebibytes) grabado en el disco de manera secuencial (todos sus bloques almacenados de manera consecutiva)

Tiempo de acceso en almacenamiento secuencial:
> $seek + latency + (tiempo\ transferencia\ bloque \times cantidad\ de\ bloques)$

Si no se conoce el tiempo de latencia, se considera igual a lo que tarde el disco en dar media vuelta. Se obtiene con regla de 3 simples. Considere que 1 minuto = 60s = 60000ms
> $9000\ vueltas \Rightarrow 60000ms$
>
> $0.5\ vueltas \Rightarrow x = 3.3ms$

Tiempo de transferencia del bloque: sabemos que la velocidad de transferencia es de 10MiB/s. Queremos saber cuanto tarda en transferir un bloque de, en este caso, 512B
> $10Mib = 10485760B$

> $10485760 \Rightarrow 1000ms$
>
> $512B \Rightarrow x = 0.048828125ms$

*OJO: Si la velocidad de transferencia estuviera en Mib (Mebibits) y los sectores en Bytes, se deberían unificar las unidades (por ejemplo, a bits) antes de operar.*

Cantidad de bloques de un archivo de 15MiB:
> $15Mib = 15728640B$
>
> $\frac{15728640B}{512B} = 30720$

Una vez calculados todos los datos, se procede con la fórmula del tiempo de acceso.
Datos:
- Seek Time = 10ms
- Latency Time = 3.3ms
- Tiempo transferencia bloque = 0.048828125ms
- Cantidad de bloques = 30720

Tiempo de acceso:
> $10ms + 3.3ms (0.048828125ms \times 30720) = 1513.3ms = 1.5133s$

#### (d) Calcule el tiempo de transferencia real de un archivo de 16 MiB(Mebibytes) grabado en el disco de manera aleatoria.

Tiempo de acceso en almacenamiento aleatorio:
> $(seek + latency + tiempo\ transferencia\ bloque) \times cantidad\ de\ bloques$

Cantidad de bloques para archivo de 16Mib:
> $16Mib = 16777216B$
>
> $\frac{16777216B}{512B} = 32768$

Datos:
- Seek Time = 10ms
- Latency Time = 3.3ms
- Tiempo transferencia bloque = 0.048828125ms
- Cantidad de bloques = 32768

Tiempo de acceso:
> $(10ms + 3.3ms + 0.048828125ms) \times 32768 = 437414.4ms = 437.4144s$


### 13. 

Head con movimiento en 200 tracks (0 a 199). Está en el track 83, anteriormente atendió un requerimiento en el track 75.
Cola de requerimientos es: 86, 147, 91, 177, 94, 150, 102, 175, 130, 32, 120, 58, 66, 115.

#### (a) FCFS (First Come, First Served)

![alt text](img/fcfs13.jpg)

#### (b) SSTF (Shortest Seek Time First)

![alt text](img/sstf13.jpg)

#### (c) Scan

![alt text](img/scan13.jpg)

#### (d) Look

![alt text](img/look13.jpg)

#### (e) C-Scan (Circular Scan)

![alt text](img/c_scan13.jpg)

#### (f) C-Look (Circular Look)

![alt text](img/c_look13.jpg)

### 14. ¿Alguno de los algoritmos analizados en el ejercicio anterior pueden causar inanición de requerimientos?

SSTF podría provocar inanición en caso de que continuen llegando requerimientos cercanos al cilindro en el que el cabezal se encuentra en un determinado momento. Mientras continuen llegando requerimientos cercanos, aquellos más lejanos se mantendrán esperando de forma indefinida.
Por otro lado, FCFS no podría generar inanición porque los requerimientos se atienden en el orden en el que llegan. Los demás algoritmos barren en forma secuencial los tracks, por lo que tampoco podrían provocar inanición.
Esto considerando requerimientos que no sean PF, es decir, que el movimiento del cabezal no depedan de atender una prioridad de ese estilo.

### 15.

Head con movimiento de 300 tracks (numerados de 0 a 299). Se encuentra en la pista 143 atendiendo un requerimiento. Anteriormente atendió otro en la pista 125 (izquierda a derecha)
La cola de requerimientos es: 126, 147, 81, 277, 94, 150, 212, 175, 140, 225, 280, 50, 99, 118, 22, 55; y después de 30 movimientos se incorporan los requerimientos de las pistas 75, 115, 220 y 266.

#### (a) FCFS (First Come, First Served)

![alt text](img/fcfs15.jpg)

#### (b) SSTF (Shortest Seek Time First)

![alt text](img/sstf15.jpg)

#### (c) Scan

![alt text](img/scan15.jpg)

#### (d) Look

![alt text](img/look15.jpg)

#### (e) C-Scan (Circular Scan)

![alt text](img/c_scan15.jpg)

#### (f) C-Look (Circular Look)

![alt text](img/c_look15.jpg)

### 16. 

Head con movimiento de 300 tracks (numerados de 0 a 299). Está en la pista 140 atendiendo un requerimiento, anteriormente atendió un requerimiento en la pista 135.
La cola de requerimientos es: 99, 110, 42, 25, 186, 270, 50, 99, 147PF , 81, 257, 94, 133, 212, 175, 130; y después de 30 movimientos se incorporan los requerimientos de las pistas 85, 15PF , 202 y 288; y después de otros 40 movimientos más se incorporan los requerimientos de las pistas 75, 149PF , 285, 201 y 59

#### (a) FCFS (First Come, First Served)

![alt text](img/fcfs16.jpg)

#### (b) SSTF (Shortest Seek Time First)

![alt text](img/sstf16.jpg)

#### (c) Scan

![alt text](img/scan16.jpg)

#### (d) Look

![alt text](img/look16.jpg)

#### (e) C-Scan (Circular Scan)

![alt text](img/c_scan16.jpg)

#### (f) C-Look (Circular Look)

![alt text](img/c_look16.jpg)

### 17. Dados los siguientes métodos de administración de espacio de un archivo:
- **Asignación contigua**
- **Asignación enlazada**
- **Asignación indexada**

#### (a) Describa como trabaja cada uno.

- Asignación contigua

Los datos de un archivo se ubican de forma continua, sabiéndose a priori cuanto ocuparán. Su FAT (File Allocation Table, estructura que mantiene información sobre la ubicación de los archivos) almacena bloque de inicio (bloque refiere a unidad de trabajo, podría ser clúster) y longitud. Un archivo puede ser leído en una operación. Puede producirse fragmentación externa (solucionable con compactación). Un archivo podría no tener espacio para crecer. Debido a sus características, requiere una preasignación.

- Asignación enlazada

Las unidades del archivo están disjuntas y encadenadas como una lista enlazada. Hay asignación dinámica. La lectura del archivo es compleja. Si se pierde un bloque, se pierden todos los siguientes (debido a la pérdida de los enlaces). Se tiene FAT con bloque de inicio y tamaño del archivo. Permite al archivo crecer. No hay fragmentación externa, sin embargo, se puede compactar para reducir tiempo de posicionamiento del cabezal. Esto debido a que el acceso secuencial de los bloques requiere accesos a diferentes partes del disco.

- Asignación indexada

La FAT tiene puntero al bloque índice (index node, i-node). Este tiene la dirección de los bloques que componen el archivo. Asignación en base a bloques individuales. No produce fragmentación externa, pero puede producir interna. No requiere un acceso secuencial (su acceso aleatorio es veloz), aunque si puede realizar lecturas secuenciales. El tamaño del archivo se ve limitado por el tamaño del índice.
Posee dos variantes: asignación por secciones y asignación indexada por niveles de indirección.

#### (b) Cite ventajas y desventajas de cada uno.

Las ventajas y desventajas fueron mencionadas en el punto anterior.

### 18. Gestión de espacio libre. Dados los siguientes métodos de gestión de espacio libre en un disco:
- **Tabla de bits**
- **Lista Ligada**
- **Agrupamiento**
- **Recuento**


#### (a) Describa como trabajan estos métodos.

- Tabla de bits

Tabla (vector) con 1 bit por cada bloque de disco. Se indica por cada uno 0 si está libre, 1 si está ocupado. Está en disco, forma parte de la metainformación. Para buscar bloques se debería cargar la tabla en memoria.
Es fácil encontrar un bloque o grupo de bloques libres, pero puede tener un tamaño significativamente grande en memoria.

- Lista ligada (bloques encadenados)

Cadena de bloques libres como lista enlazada. Se tiene un puntero al primer bloque libre. Cada bloque libre tiene puntero al siguiente. Es ineficiente para buscar bloques libres, pues requiere de muchas operaciones E/S para obtener un grupo libre. Además, si se pierde el enlace de un bloque, se pierden todos los siguientes.

- Agrupamiento (indexación)

Variante de lista ligada. El primer bloque libre contiene las direcciones de N bloques libres. Las N-1 primeras direcciones son bloques libres. La N-ésima dirección referencia a otro bloque con N direcciones de bloques libres.

- Recuento

Variante de indexación. Considera las situaciones de que varios bloques contiguos pueden ser solicitados o liberados a la vez (espcialmente en asignación contigua). En lugar de tener N direcciones libres (índice), se tiene la dirección del primer bloque libre y los N bloques libres contiguos a este. Una estructura con entradas clave valor (nro bloque, N siguientes bloques libres).
Busca achicar estructuras, pero es complejo de mantener. 

#### (b) Cite ventajas y desventajas de cada uno.

Las ventajas y desventajas de cada métodos fueron mencionadas en el punto anterior.

### 19. Gestión de archivos en UNIX.
**El sistema de archivos de UNIX utiliza una versión modificada del esquema de Asignación Indexada para la administración de espacio de los archivos.**
**Cada archivo o directorio esta representado por una estructura que mantiene, entre otra información, las direcciones de los bloques que contienen los datos del archivo: el I-NODO.**
**Cada I-NODO contiene 13 direcciones a los bloques de datos, organizadas de la siguiente manera:**
- **10 de direccionamiento directo**
- **1 de direccionamiento indirecto simple**
- **1 de direccionamiento indirecto doble**
- **1 de direccionamiento indirecto triple**

#### (a) Realice un grafico que describa la estructura del I-NODO y de los bloques de datos. Cada bloque es de 1 Kib(Kibibits). Si cada dirección para referenciar un bloque es de 32 bits:

![alt text](img/grafico19.png)

##### i. ¿Cuántas referencias (direcciones) a bloque pueden contener un bloque de disco?

- Tamaño de cada bloque: 1Kib
- Tamaño de cada inodo: $Cantidad\ de\ direcciones \times Tamaño\ dirección = 13 \times 32bits = 416bits$

> $\frac{1024bits}{416bits} = 2$ inodos por bloque

Si la pregunta está orientada a direcciones en cada bloque de disco, entonces se considera el tamaño de cada bloque (1024 bits) y el tamaño de cada dirección (32 bits):

> $\frac{1024bits}{32bits} = 32$ direcciones por cada bloque

##### ii. ¿Cuál sería el tamaño máximo de un archivo?

Para el tamaño máximo se deben considerar todos los bloques que puede direccionar cada inodo.

- 10 punteros a bloques de datos (direccionamiento directo): Cada uno apunta a un bloque de datos de 1Kib. Por lo tanto, $10 \times 1Kib = 10Kib$

- 1 puntero de direccionamiento indirecto simple: apunta a un bloque con 32 direcciones, cada una apuntando a un bloque de datos de 1Kib: $1 \times 32 \times 1Kib = 32Kib$

- 1 puntero de direccionamiento indirecto doble: apunta a bloque que tiene 32 direcciones. Cada una apunta a un bloque que a su vez tiene 32 direcciones, apuntando a un bloque de datos de 1Kib: $1 \times 32 \times 32 \times 1Kib = 1024Kib$

- 1 puntero de direccionamiento indirecto triple: apunta a bloque que tiene 32 direcciones. Cada dirección apunta a un bloque que tiene 32 direcciones. A su vez, cada una de estas direcciones apuntan a bloque con otras 32 direcciones que referencian a un bloque de datos de 1Kib cada una: $1 \times 32 \times 32 \times 32 \times 1Kib = 32768Kib$

La suma de todos los tamaños que pueden ser referenciados por cada puntero del inodo indican el tamaño máximo de archivo:

> $10Kib + 32Kib + 1024Kib + 32768Kib = 33834Kib = 33.041015625Mib = 4.130126953MiB$

### 20. Analice las siguientes fórmulas necesarias para localizar un I-NODO en la lista de inodos:

> $nro\ bloque = \frac{nro\ de\ inodo - 1}{nro\ de\ inodos\ por\ bloque} + bloque\ de\ comienzo\ de\ la\ lista\ de\ inodos$
>
> $Desplazamiento\ del\ inodo\ en\ el\ bloque = ((nro\ de\ inodo - 1) \mod (nro\ de\ inodos\ por\ bloque)) \times medida\ de\ inodo\ del\ disco$

#### (a) Según la primer fórmula, asumiendo que el bloque 2 está en el comienzo de la lista de inodos y que hay 8 inodos por bloque: calcule donde se encuentra el inodo 8 y el 9. ¿Dónde estarían para bloque de disco de 16 inodos?

Para bloque de 8 inodos:
- Inodo 8

> $nro\ bloque = \frac{8 - 1}{8} + 2 = 2$

- Inodo 9:

> $nro\ bloque = \frac{9 - 1}{8} + 2 = 3$

Para bloque de 16 inodos:
- Inodo 8

> $nro\ bloque = \frac{8 - 1}{16} + 2 = 2$

- Inodo 9:

> $nro\ bloque = \frac{9 - 1}{16} + 2 = 2$

Para bloques de disco de 16 inodos, ambos estarían en el bloque 2.

#### (b) De acuerdo a la segunda fórmula, si cada inodo del disco ocupa 64 bytes y hay 8 inodos por bloque de disco, el inodo 8 comienza en el desplazamiento 448 del bloque de disco. ¿Dónde empieza el 6? Si fueran inodos de 128 bytes y 24 inodos por bloque: ¿dónde empezaría el inodo 8?

Para inodos de 64 bytes, con 8 por bloque:
- Inodo 6

> $Desplazamiento\ del\ inodo\ en\ el\ bloque = ((6 - 1) \mod (8)) \times 64bytes = 320bytes$

Para inodos de 128 bytes, con 24 inodos por bloque:
- Inodo 8

> $Desplazamiento\ del\ inodo\ en\ el\ bloque = ((8 - 1) \mod (24)) \times 128bytes = 896bytes$

___

## Laboratorio de E/S

### 20. Instale e investigue para que sirve el siguiente programa hdparm
`sudo apt-get install hdparm`

hdparm es uno de los programas de línea de comandos para Linux utilizado para manejar dispositivos de disco y discos duros. Permite obtener estadísticas del disco duro, modificar intervalores de escritura, configuración del DMA, etc. También puede establecer parámetros relacionados con las memorias caché de la unidad, el modo suspensión, la administración de energía, entre otros.

### 21. Ahora ejecute el siguiente comando:
`sudo hdparm -I /dev/sda`

- ¿Cuando cilindros, cabezas y sectores tiene su disco?

Disculpá no tengo disco.

- ¿Que pasa si ejecuta esto en un disco de estado sólido?

Los valores de cilindros, cabezas y sectores no tienen relevancia, ya que los SSD no usan la geometría de disco físico como los HDD. Estos traducen la ubicación de datos en bloques y páginas de memoria flash internamente, por lo que los valores CHS son simulados o no aparecen.

### 23. Ahora ejecute el siguiente comando varias veces(al menos 5), de manera tal de poder calcular el promedio de resultados obtenidos
`sudo hdparm /dev/sda`

El comando mide el rendimiento básico del dispositivo, como el tiempo para realizar operaciones de lectura de datos. Estos valores reflejan la velocidad de acceso a datos, incluyendo lecturas desde caché y desde disco directamente.

### 24. Ahora ejecutelo de la siguiente manera:
`hdparm -t --direct --offset 500 /dev/sda`

Mide el rendimiento del disco con los parámetros
- `-t`: realiza pruebas de lectura cronometradas (time-read)
- `--direct`: omite la caché del sistema operativo, leyendo directamente de disco
- `--offset`: especifica el punto de inicio de la prueba (en bloques)

Los resultados darán el rendimiento de lectura cronometrado en una ubicación específica del disco.

### 25. ¿Para que sirven los parámetros?:

- `direct`

Fuerza a las operaciones de lectura/escritura a omitir la caché del SO. Implica que la lectura se haga directamente desde el dispositivo físico. Resulta útil para medir el rendimiento real del dispositivo sin interferencias del SO. 

- `offset`

Inicia un desplazamiento de bloques desde el inicio del disco. Permite probar el rendimiento en diferentes regiones del disco. Es útil porque el rendimiento de los discos puede variar dependiendo de si los datos están cerca del inicio, en el medio o al final del disco.

### 26. Compare los tiempos promedios obtenidos con los parámetros direct y offset y sin ellos(Recuerde comparar tiempos promedio y no ejecuciones aisladas)

- Con `direct` y `offset`

La caché del SO no se utiliza, por lo que los tiempos reflejan el acceso directo al hardware. En discos mecánicos (HDD) será más lento debido al Seek Time y la latencia rotacional. En discos mecánicos, leer desde el centro puede ser más lento debido al tiempo para reposicionar las cabezas, por lo que offset también tiene un impacto en el tiempo de las operaciones.

- Sin parámetros

Las pruebas estándar serán más rápidas porque usan la caché del SO para acelearar las lecturas.

### 27. ¿Con que concepto de la teoría asocia el parámetro direct?

El parámetro `--direct` está asociado con el concepto de E/S directa. Omite la caché del SO, enviando las solicitudes de E/S directamente al dispositivo físico. Esto se relaciona con los conceptos de DMA (pues permite al hardware transferir datos directamente al dispositivo sin pasar por la CPU) y a E/S sin almacenamiento intermedio (reduce la latencia introducida por el almacenamiento en caché)

Con caché del SO se hace referencia al servicio de caching que permite almacenar en memoria principal una copia de datos obtenidos de E/S, de acceso reciente. 

### 28. Ejecute el siguiente comando: 
`ls /sys/block/`

El comando lista las entradas del directorio especificado, que contiene información sobre los dispositivos de bloques del sistema. Cada entrada corresponde a un dispositivo de bloque presente en el sistema (discos físicos, dispositivos virtuales y particiones).

### 29. A que le parece que corresponde cada entrada del directorio anterior?

Como se mencionó anteriormente, cada entrada corresponde a los dispositivos de bloques reconocidos por el kernel, tal como sda (discos conectados a través de SATA), nvme0n1 (dispositivos NVMe), loop (dispositivos de bucle utilizados para montar archivos como si fueran sistemas de archivos).

### 30. Ejecute el siguiente comando(ajuste el dispositivo de disco según su equipo): 
`cat /sys/block/sda/queue/scheduler`

El comando muestra la lista de planificadores de E/S disponibles para el dispositivo de bloque, y cuál está en uso actualmente (indicado por []).

### 31. Investigue el resultado del comando anterior. ¿Que quiere decir cada item del resultado?, investigue cada uno de ellos y asocielo con conceptos de la teoría y de esta práctica. ¿Cual es la diferencia entre los siguientes conceptos?

Como se mencionó anteriormente, cada item del resultado indica planificadores de E/S para el dispositivo

- noop (No Operation)

Procesa las solicitudes en el orden en el que llega. Ideal para dispositivos veloces con tiempos de acceso constantes. Asociado a FCFS. Su principal ventaja es su simpleza, que implica un bajo consumo de CPU.

- deadline

Mantiene dos colas: una ordenada por sector y otra por tiempo de llegada. Puede dar prioridad a las solicitudes más antiguas luego de un tiempo límite para evitar inanición. Implica una planificación por plazos. Se relaciona con SSTF en el sentido de que priorizan las solicitudes más cercanas

- cfq (Completely Fair Queuing)

Divide el tiempo de acceso al disco equitativamente entre los procesos. Es bueno para sistemas multiusuario o multitarea.
Se puede relacionar con SCAN y LOOK en el sentido de que intentan ser equitativos con todos los requerimientos.

- Anticipatory IO

Intenta anticipar solicitudes futuras basándose en el patrón de acceso. Relacionado con C-SCAN y C-LOOK en el sentido de que son eficientes en accesos secuenciales y previenen starvation.

### 32. Como root, ejecute el siguiente comando
`sudo echo "noop" > /sys/block/sda/queue/scheduler`

**¿Cual es el efecto de esto?**
**Ayuda: vuelva a ejecutar**
`cat /sys/block/sda/queue/scheduler`

El primer comando cambia el planificador de E/S del dispositivo a noop. Ejecutando nuevamente el segundo, puede observarse el cambio. En dispositivos HDD puede reducir el rendimiento debido a la falta de reordenamiento, mientras en SSD y NVMe puede aumentarlo al quitar reordenamientos innecesarios.

### 33. Ahora ejecute el siguiente programa al menos 5 veces, de manera tal de poder calcular el promedio del resultado obtenido
`hdparm -t --direct --offset 500 /dev/sda`

Los resultados de la medición cambiarán, debido a que se modificó el planificador E/S

### 34. Ahora del mismo modo repita el paso con las demas opciones obtenidas en el ejercicio 29 y compare los resultados ¿Cual le parece que debería ser mas óptimo? ¿Por qué?

noop es el más rápido para SSD/NVMe debido a su sencillez.
deadline es balanceado entre rendimiento y latencia.
cfq es ideal para cargas multiusuario, pero puede ser lento en SSD.
En definitiva, el planificador óptimo depende del dispositivo
noop y deadline son beneficiosos para SSD/NVMe, mientras también deadline o cfq lo son para HDD porque mejoran el acceso a datos en discos con partes móviles.

___

## Anotaciones

### Algoritmos de planificación en un HDD

Objetivo: minimizar el movimiento de la cabeza
Como: ordenando lógicamente los requerimientos pendientes (que estan en la cola) al disco, considerando el número de cilindro de cada requerimiento. En cualquier momento se pueden encolar nuevos requerimientos

Todos los algoritmos de planificación dan prioridad a la atención de PF. Es decir, atenderán estos antes de continuar con otros requerimientos. El orden de atención de los PF dependerá del algoritmo utilizado.
Si el head del disco se dirigía a una pista para un requerimiento cuando llega otro de mayor prioridad (PF), termina de atender ese antes de atender el otro, no corta el movimiento que ya se había realizado hasta el requerimiento original.

Los requerimietos indican número de cilindro, no de pista. Se indica pista en la explicación porque, en una evaluando en una sola cara, el número de cilindro se corresponde con ese número de pista.

- FCFS

Atiende los requerimientos en el orden en el que llegaron a la cola. Los nuevos requerimientos se van encolando después de los que ya estaban. Se da prioridad a PF, que se atienden primero en el orden en el que llegan (aunque un PF llegue un lote posterior al que ya estaba, se atiende ese antes que los demás requerimientos no PF del lote original).
Requerimientos repetidos los atiendo tantas veces como aparezcan. En los demás algoritmos se atienden de forma consecutiva (de una sola vez, siempre y cuando la repetición del requerimiento haya llegado para el instante que se pasa por ahí)

- SSTF (Shortest Seek Time First)

Atiende el requerimiento que suponga el menor movimiento de cabezal, es decir, aquel que se encuentra más cerca de donde está el cabezal actualmente. Se priorizan PF, ordenando sus atenciones por el que se encuentre más cerca de la posición actual. Ante llegas de lotes de requerimientos posteriores, estos se agregan a la cola, y se aplica la misma lógica: la atención se realiza considerando los tracks más cercanos, sin importar su orden en la cola.

- SCAN

Barre el disco en una dirección atendiendo los requerimientos pendientes en esa ruta hasta llegar a la última pista del disco y cambia la dirección. Es importante saber en que pista se está y de que pista se viene para determinar el sentido en el que el cabezal barre el disco.
Comienza desde la pista en la que se está, barre hasta llegar al límite, cambia su dirección y comienza a barrer hasta llegar al último requerimiento o finalizar las pistas en esa dirección (si llegaron más, cambiaría nuevamente el sentido y aplicaría la misma lógica de funcionamiento).
Ante PFs, atiende estos primero respetando la lógica del algoritmo (priorizando los PF, si debe atentar contra la lógica por atender un PF sobre un requerimiento común, lo hará) y continúa con el sentido que quedó luego de atender los últimos dos requerimientos (como mínimo el último fue PF para el caso planteado), barriendo en esa dirección. Con el fin de atender los PF, podría no llegar hasta la pista final y cambiar su dirección antes, ante un requerimiento que esté en dirección opuesta.

- LOOK

Similar al SCAN, barre el disco en una dirección. Pero no llega hasta la última pista, sino hasta el último requerimiento, antes de cambiar su dirección. Es importante saber en que pista se está y de que pista se viene para determinar el sentido en el que el cabezal barre el disco.
Ante PFs, actúa igual que SCAN, pero no llega hasta la última pista, sino hasta el último requerimiento en ese sentido.

- C-SCAN (Circular SCAN)

Se comporta igual que el SCAN pero restringe la atención en un solo sentido (no cambia de dirección). Al llegar a la última pista del disco en el sentido actual, realiza un "salto" y vuelve a la pista del otro extremo, para continuar barriendo en el mismo sentido. El salto no se cuenta en la suma de movimientos. Se debe saber en que pista se está y de cuál se venía para empezar a diagramar, pues solo así se conoce el sentido que tiene el cabezal.
Ante PF, se atienden estos primero (podría llevar a no respetar el sentido propuesto por el algoritmo, pero en cuanto sea posible se atenderán los PF siguiendo la lógica que plantea el algoritmo). Luego de atenderse, continúa en el sentido original que tenía al comienzo.
Con el fin de atender los PF, podría no llegar hasta la pista final y cambiar su dirección, ante un requerimiento que esté en dirección opuesta. Aunque luego de este retomará su sentido original.

- C-LOOK (Circular LOOK)

Similar al LOOK pero restringe la atención en un solo sentido y, al llegar al último requerimiento en esa dirección, realiza un "salto" para comenzar a barrer desde el otro extremo, en la misma dirección. Similar a C-SCAN pero respetando lo establecido por LOOK (no barrer hasta última pista, sino hasta último requerimiento).
Ante PF, aplica lo mismo que en C-SCAN, con la diferencia de no llegar hasta la última pista, sino hasta el último requerimiento.