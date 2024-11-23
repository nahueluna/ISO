# Trabajo Práctico 4

## 1. Responda en forma sintética sobre los siguientes conceptos:

### (a) Programa y Proceso.

Un proceso, también llamado tarea o job, es un programa en ejecución. Este es dinámico y posee program counter. Su ciclo de vida comprende desde que se lo ejecuta hasta que termina. Se entiende al proceso como una abstracción del programa. Este contiene información que no posee el programa, que le permite ejecutarse (tal como el espacio de memoria asignado).
Según su historial de ejecución se pueden clasificar en CPU Bound (su ejecución comprende únicamente el uso de la CPU) o I/O Bound (mayormente ligados a las operaciones de entrada/salida).
Cada proceso posee una PCB, una estructura que almacena información sobre el mismo. Es lo primero que se crea al crear el proceso (cuando se realiza un fork), y lo último que se desaloca cuando este finaliza.
Los procesos transitan por distintos estados durante su ciclo de vida, tales como New, Ready, Running, entre otros.

Por otro lado, el programa es el componente estático el cual el proceso ejecuta. Este no tiene program counter y existe desde que se edita hasta que se borra. Es la información que reside en memoria persistente.

### (b) Defina Tiempo de retorno (TR) y Tiempo de espera (TE) para un Job.

En cuanto al tiempo de los procesos, se pueden encontrar dos principales conceptos:
- Tiempo de retorno: tiempo que transcurre desde que el proceso llega al sistema hasta que completa su ejecución.
- Tiempo de espera: tiempo que el proceso se encuentra en el sistema esperando, es decir, tiempo que pasa sin ejecutarse (entendido como TR - Tcpu).

### (c) Defina Tiempo Promedio de Retorno (TPR) y Tiempo promedio de espera (TPE) para un lote de JOBS.

El tiempo promedio de retorno (TPR) para un lote de JOBS es el promedio de cada uno de los tiempos de retorno individuales de cada proceso.
Por otro lado, el tiempo promedio de espera (TPE) es el promedio de cada uno de los tiempos de espera de los procesos que conforman el lote. 

### (d) ¿Qué es el Quantum?

El quantum es un intervalo de tiempo definido en el cual un proceso puede hacer uso de la CPU antes de ser interrumpido. Garantiza que todos los procesos tengan un acceso equitativo a la CPU. Es fundamental para el funcionamiento de algoritmos de planificación como el Round Robin, aunque no es exclusivo de él.

### (e) ¿Qué significa que un algoritmo de scheduling sea apropiativo o no apropiativo (Preemptive o Non-Preemptive)?

Los algoritmos de planificación (scheduling) de procesos pueden ser apropiativos (preemptive) o no apropiativos (non-preemptive). Un algoritmo es apropiativo cuando permite que un proceso en ejecución (Running), que no ha finalizado, sea interrumpido por otro y envíado a la cola de Ready, para volver a competir por el uso de la CPU. Bajo estos algoritmos, los procesos no monopolizan la CPU, pero hay un mayor overhead (mayor cantidad de context switch).
Por otro lado, los algoritmos no apropiativos son aquellos en los cuales los procesos se ejecutan hasta terminar o bloquearse (por ejemplo, a la espera de una operación I/O). Un proceso no podrá interrumpir a otro para quitarle la CPU.

### (f) ¿Qué tareas realizan?:
##### i. Short Term Scheduler
##### ii. Long Term Scheduler
##### iii. Medium Term Scheduler

Los schedulers son componentes funcionales de los sistemas operativos que se encargan de administrar la ejecución de los procesos mediante el traspaso de un estado a otro.
El **Long Term Scheduler** se encarga de admitir nuevos procesos a memoria, lo que implica el cambio de estado de los procesos de New a Ready. Controla el grado de multiprogramación.
El **Medium Term Scheduler** realiza el swapping entre el disco y la memoria cuando el SO lo determina. Usualmente sucede cuando se quiere disminuir el grado de multiprogramación. Esto significa que los procesos pasan del estado de Ready (cargados en memoria, compitiendo por el uso de la CPU), a un Ready en suspensión (pues están en memoria secundaria, esperando para volver a ser cargados).
El **Short Term Scheduler** determina que proceso pasará a ejecutarse, es decir, que proceso pasará de estado de Ready a Running.

### (g) ¿Qué tareas realiza el Dispatcher?

El Dispatcher es otro de los módulos de planificación que integran el Kernel. Este se encarga de realizar el context switch y transferir el control de la CPU al proceso seleccionado por el Short Term Scheduler. Debe asegurarse de efectuar el cambio a modo usuario antes de saltar a la instrucción del proceso que se ejecutará.
Guarda el estado del proceso saliente en su PCB, restaura el estado del proceso entrante, realiza el cambio de modo y asigna la CPU al job a ejecutarse. Además, administra aquellas interrupciones que pueden implicar un context switch, como interrupciones de clock o bloqueos por E/S.

___

## 2. Procesos:

### (a) Investigue y detalle para que sirve cada uno de los siguientes comandos:

- `top`: permite visualizar dinámicamente y en tiempo real los procesos ejecutandose en el sistema, así como cierta información sobre ellos.
- `htop`: similar a `top`, pero permite desplazar los procesos visualizados, así como interactuar con ellos. Permite además otros formatos de visualización, tal como en formato de arbol.
- `ps`: muestra en el display los procesos activos en el sistema, de forma estática (no se actualiza en tiempo real). Por defecto muestra aquellos procesos asociados al usuario actual y a la terminal desde la cual se invoca el comando.
- `pstree`: muestra en el display los procesos activos en el sistema, de forma estática, estructurados como árbol según el PID de los procesos.
- `kill`: envía una señal a un proceso. Por defecto dicha señal corresponde a la terminación del mismo.
- `pgrep`: busca aquellos procesos que actualmente estén activos y lista los PIDs de aquellos que coinciden con el criterio indicado como parámetro (nombre del proceso, usuario que lo inició, etc).
- `pkill`: este comando enviará la señal especificada (por defecto SIGTERM) a cada proceso que coincida con el criterio indicado (similar a `pgrep`, pero en vez de listarlos, les envía una señal).
- `killall`: envía una señal (por defecto SIGTERM) a todos los procesos que coincidan con el nombre indicado. Pueden utilizarse parámetros para extender el envío de la señal a aquellos procesos que integran el grupo del indicado, entre otras opciones.
- `renice`: modifica la prioridad de planificación de los procesos indicados (especificando su PID, GID, UID, etc).
- `xkill`: fuerza la terminación de conexión con el cliente de un programa, especificando el ID del recurso, o seleccionandolo de forma interactiva.
- `atop`: comando que permite el monitoreo avanzado del sistema y sus procesos. Provee un monitor interactivo que muestra la carga del sistema a nivel procesos (tiempo de la CPU en para procesos del sistema y procesos de usuario, cantidad total de procesos, cantidad de procesos finalizados, etc.).

### (d) Comunicación entre procesos:

##### i. Investigue la forma de comunicación entre procesos a través de pipes.

El método más básico de para la comunicación entre procesos es mediante una tubería (pipe). Esta permite enviar los datos de un proceso a otro a través de un canal. Un proceso escribe datos en un extremo y el otro los lee desde el otro extremo.
Los pipes son:
- Unidireccionales: solo puede enviar datos en una dirección (de escritura a lectura).
- Comunicación entre procesos relacionados: normalmente son utilizados entre procesos con un ancestro en común o que tienen una relación jerárquica (entre padre e hijo).
La comunicación se establece mediante operaciones de archivos, tal como read, write, close.

##### ii. ¿Cómo se crea un pipe en C?.

Los pipes se crean mediante la función `pipe()`. Para su uso básico, se genera un pipe, luego un proceso hijo con `fork()` y entonces estos se comunican mediante funciones estándar de lectura/escritura.
La creación del pipe devuelve 0 en caso de éxito, -1 en caso de error.

##### iii. ¿Qué parametro es necesario para la creación de un pipe?. Explique para que se utiliza.

Se indica el parámetro `int pipefd[2]`, el cual es un arreglo de dos enteros que representa los extremos del pipe. `pipefd[0]` es el extremo del cual se leen los datos, mientras `pipefd[1]` es el extremo en el cual se escriben los datos (el nombre del arreglo es ilustrativo). 

##### iv. ¿Qué tipo de comunicación es posible con pipes?

Como se mencionó anteriormente, los pipes corresponden a una comunicación unidireccional entre el proceso productor (escritor) y el proceso consumidor (lector).
Los pioes son anónimos, utilizados entre procesos con relación y creados en tiempo de ejecución por el SO (no tienen un nombre en el FS). Existen pipes con nombre denominados FIFO, los cuales también son unidireccionales pero permiten que cualquier proceso con acceso al archivo FIFO pueda comunicarse con otro proceso (no necesitan estar relacionados).

### (e) ¿Cuál es la información mínima que el SO debe tener sobre un proceso? ¿En que estructura de datos asociada almacena dicha información?

El SO necesita mantener cierta información sobre cada proceso para administrarlo, tal como:
- Identificador del proceso (PID, PPID, UID/GID)
- Estado del proceso (running, ready, waiting, etc)
- Contexto de la CPU (program counter, registros de la CPU)
- Prioridad del proceso (utilizado por los schedulers para determinar cuando se ejecutará)
- Información de memroia (espacio de direcciones, páginas asignadas)
- Información de tiempo (tiempo de CPU utilizado, tiempo de retorno y de espera)

Toda esta información se guarda en la PCB (Process Control Block). El kernel utiliza el PCB para realizar un context switch, con el fin de guardar el contexto del proceso saliente y cargar el del proceso entrante. Además, en esta estructura se indica el estado del proceso, lo que determina donde se encola.

### (f) ¿Qué significa que un proceso sea “CPU Bound” y “I/O Bound”?

Un proceso es CPU Bound cuando solo ejecuta ráfagas de CPU (en su ejecución solamente utiliza la CPU).
Por otro lado, es I/O Bound cuando ejecuta tanto ráfagas de CPU como de E/S (para atender operaciones E/S debe abandonar la CPU).

### (g) ¿Cuáles son los estados posibles por los que puede atravesar un proceso?

De forma simplificada, los estados posibles de un proceso son:
- **New**
- **Ready**
- **Running**
- **Blocked** o **Waiting**
- **Suspend**
- **Terminated** o **Exit**

### (h) Explique mediante un diagrama las posibles transiciones entre los estados.

Cuando un proceso es creado, este se encuentra en estado **New**. Allí se crea la PCB y las estructuras asociadas necesarias, quedando el proceso en espera de ser cargado.
Cuando es admitido, pasa al estado **Ready**. En este, el espacio de direcciones del proceso es cargado en memoria de forma suficiente como para ejecutarse. En este estado, el proceso pasa a competir por la CPU. Cuando es seleccionado por el Short Term Scheduler, el proceso es cargado en la CPU por el Dispatcher (gestiona el context switch) y el proceso pasa a estado de **Running**. Mientras se está ejecutando, el proceso puede ser expulsado del procesador (ya sea porque otro proceso se apropia de este o porque su tiempo terminó) y vuelve al estado de **Ready**. También, mientras se está ejecutando, puede ejecutar una operación de E/S que lo obligue a esperar por dicho evento, por lo que pasa a estado de **Blocked** y otro proceso es cargado en la CPU. De este estado puede pasar a **Suspend** (es swappeado a memoria secundaria, normalmente para liberar espacio) para luego ser activado y competir por la CPU, o bien que el evento ocurra y pasar directamente a estado de **Ready**. Finalmente, la tercer alternativa es que, mientras se está ejecutando, el proceso termine su tarea, por lo que pasaría a estado **Terminated** o **Exit**, abandonando la CPU, para luego eliminar todas sus estructuras asociadas (como la PCB).

### (i) ¿Que scheduler de los mencionados en 1 f se encarga de las transiciones?

El Long Term Scheduler es el encargado de la transición entre **New** y **Ready** (admitir los procesos creados para que sean cargados en memoria).
El Short Term Scheduler se ocupa de la transición entre los estados **Ready** y **Running**. Selecciona cuál de los procesos cargados en memoria se ejecutará.
El Medium Term Scheduler se encarga de la transición hacia **Suspend** (no necesariamente desde **Blocked**). Este Scheduler se encarga de reducir el grado de multiprogramación liberando espacio memoria mediante el swapping de procesos hacia memoria secundaria.

## 3. Para los siguientes algoritmos de scheduling:
- FCFS (Fisrt Coome First Served)
- SJF (Shortest Job First)
- Round Robin
- Prioridades

### (a) Explique su funcionamiento mediante un ejemplo.

Se tiene
Job 1, llegada 0, CPU 9, prioridad 3
Job 2, llegada 1, CPU 5, prioridad 2
Job 3, llegada 2, CPU 3, prioridad 1
Job 4, llegada 3, CPU 7, prioridad 2

- FCFS:

Job 1 se ejecutará durante 9 ciclos. Luego lo hará Job 2 durante 5 ciclos, seguido de Job 3 durante 3 ciclos. Finalmente Job 4 se ejecutará 7 ciclos.
Para este algoritmo no apropiativo, no importa la prioridad, sino la columna que indica la llegada, pues ese es el orden en el que se ejecutan.
Algoritmo no apropiativo, por ello los procesos CPU bound terminan en su primera selección para ingresar a la CPU.

- SJF:

Se ejecuta Job 3 durante 3 ciclos, luego lo hace Job 2 durante 5 ciclos. Sigue Job 4 con 7 ciclos. Finalmente Job 1 con 9 ciclos. Este algoritmo no apropiativo ejecuta primero el proceso más corto (que demande menos ciclos de CPU).

- Round Robin:

Algoritmo apropiativo basado en un reloj. Existe un Quatum que determina el intervalo de tiempo que debe ejecutarse cada proceso. Existe su alternativa con Quantum fijo o variable.
Implementado con una cola circular. 
Sin embargo, de forma simplificada, consideremos un Q variable, donde el contador se inicializa en dicho valor cada vez que un proceso ingresa a la CPU.
De esta forma, los Jobs 1, 2, 3 y 4 se ejecutarán Q unidades de tiempo cada uno, en el orden en el que llegaron, volviendose a encolar hasta que finalicen su ejecución.

- Prioridades:

Primero se ejecutará Job 3, luego irá Job 2. Seguidamente se ejecutará Job 4 y finalmente lo hará Job 1. Este orden se basa en la prioridad que se le ha asignado a cada proceso. En caso de igual prioridad se ha desempatado mediante el PID menor entre ambos candidatos.
Utiliza una cola por cada prioridad. Puede ser apropiativo o no.

### (b) ¿Alguno de ellos requiere algún parámetro para su funcionamiento?

El algoritmo de Round Robin requiere la asignación de un valor Q que determine el intervalo de tiempo que se ejecutará cada proceso. Su valor se puede considerar un parámetro para el algoritmo.
El algoritmo por prioridades necesitará que cada proceso tenga asignada una prioridad, aunque este es un atributo del propio proceso.
Por su parte, SJF requerirá conocer el tiempo de ejecución promedio de cada proceso, para determinar cuál es el más corto. 

### (c) Cual es el mas adecuado según los tipos de procesos y/o SO.

- FCFS: adecuado para sistemas en los que no se requiere un tiempo de respuesta rápido (sistemas con procesos batch). Los procesos CPU Bound terminarán en su primera ejecución, mientras que los I/O Bound no.

- SJF: ideal para sistemas en lo que se monitorea los tiempos de ejecución de los procesos. Beneficia procesos cortos. Procesos largos podrían sufrir inanición.

- Round Robin: adecuado para sistemas interactivos y multitarea, pues brinda tiempos de respuesta equitativos y aceptables para todos los procesos. Ideal para procesos interactivos los cuales requieren una atención rápida.

- Prioridades: útil para sistemas con procesos considerablemente más críticos que otros. Procesos con alta prioridad son beneficiados.  

### (d) Cite ventajas y desventajas de su uso.

- FCFS: su implementación es simple y justa, ya que los procesos se ejecutan en el orden en el que llegan (en principio beneficia a los CPU Bound). Sin embargo, al ser no apropiativo, los procesos largos pueden retrasar a los cortos. Además, presenta bajo rendimiento en sistemas interactivos debido a tiempos de espera prolongados.

- SJF: minimiza tiempo de espera y retorno. Óptimo para sistemas con gran cantidad de procesos cortos. Sin embargo, es complicado de implementar en sistemas en tiempo real debido a la complejidad que supone estimar los tiempos de ejecución. Además, puede provocar inanición de procesos largos.

- Round Robin: es equitativo y presenta buen tiempo de respuesta para procesos interactivos. Sin embargo, un Quantum pequeño puede producir overhead por context switch, mientras un Quantum grande produce tiempos de espera extensos.

- Prioridades: permite la rápida atención de procesos críticos,además de su facilidad para combinarlo con otros algoritmos. Sin embargo, puede provocar inanición de procesos con baja prioridad (existen soluciones que implica la modificación de la prioridad de los procesos).

## 4. Para el algoritmo Round Robin, existen 2 variantes: Timer Fijo y Timer Variable

### (a) ¿Qué significan estas 2 variantes?

Round Robin con Timer Fijo implica que el "contador" que determina el tiempo que se ejecuta cada proceso se inicializa en el valor Q determinado cada ve que llega a 0. Esto implica que, si un proceso no utiliza la totalidad del Quantum asignado (porque finaliza o se bloquea), entonces el siguiente proceso se ejecutará con el tiempo restante del Quantum del primer proceso. Puede verse como un Quantum compartido entre procesos.
Round Robin con Timer Variable implica que el "contador" se inicializa en Q cada vez que un proceso es asignado a la CPU. Por lo tanto, cada uno se ejecutará la misma cantidad de tiempo (hasta terminar o bloquearse).

### (b) Explique mediante un ejemplo sus diferencias.

Se tiene
Job 1, 3 ráfagas de CPU
Job 2, 5 ráfagas de CPU
Job 3, 2 ráfagas de CPU
Q = 5

Con Timer Fijo:
Job 1 ejecuta sus 3 ráfagas de CPU y finaliza. Para este momento, Q = 2
Ingresa a la CPU Job 2, se ejecuta el restante de Q = 2 hasta Q = 0. Luego de eso, ingresa Job 3, Job 2 se vuelve a encolar y contador vuelve a Q = 5. Job 3 se ejecuta desde Q = 5 hasta Q = 3. Finalmente, Job 2 utiliza los 3 ciclos restantes para terminar su ejecución. 

Con Timer Variable:
Job 1 se ejecuta hasta finalizar, desde Q = 5 hasta Q = 2. Luego ingresa Job 2 y el contador vuelve a Q = 5. Job 2 se ejecuta hasta terminar.
Finalmente, ingresa Job 3, el contador se inicializa en Q = 5. Job 3 se ejecuta hasta finalizar.

### (c) En cada variante ¿Dónde debería residir la información del Quantum?

Un Timer Fijo implica que el Quantum es un parámetro global del sistema, por lo que se almacenará en la estructura de da datos que gestiona la planificación de procesos (un Scheduler).
Un Timer Variable implica que el Quantum es propio de cada proceso (aunque podría ser de mismo valor, cada uno es independiente del otro). Por lo tanto, puede almacenarse en la PCB de cada proceso.

**Aclaración**:
x Quantums != x ciclos de reloj (Quantum denota unidad de tiempo del SO, que probablemente abarcan gran cantidad de ciclos de clock. Cada ciclo de clock representa el tiempo que tarda la CPU en completar una instrucción básica)

## 6.

### (e) ¿Para el algoritmo Round Robin, en que casos utilizaría un valor de quantum alto y que ventajas y desventajas obtendría?

Un Quantum alto resulta beneficioso para sistemas que priorizan la eficiencia sobre la responsividad, normalmente en sistemas con poca cantidad de procesos interactivos. Además, resulta útil en sistemas con procesos cuyos tiempos son largos.
Con un Quantum alto se reduce el overhead por context switch y se maximiza el uso de la CPU. Sin embargo, los procesos cortos podrían esperar largos períodos para ser ejecutados. Además, no es ideal para mantener una velocidad de respuesta óptima para procesos interactivos.

## 7. Una variante al algoritmo SJF es el algoritmo SJF apropiativo o SRTF (Shortest Remaining Time First)

### (b) ¿Nota alguna ventaja frente a otros algoritmos?

El algoritmo SRTF presenta un tiempo de retorno promedio (TRP) y un tiempo de espera promedio (TEP) significativamente reducido en comparación con los demás algoritmos de planificación, probados sobre un mismo lote.
SRTF es la versión apropiativa de SJF. Tanto SRTF como SJF toman el proceso con la siguiente ráfaga de CPU más corta. La diferencia está en que SJF es no apropiativo y SRTF es apropiativo.

## 8.

### (c) ¿Nota alguna ventaja frente a otros algoritmos? ¿Bajo que circunstancias lo utilizaría y ante que situaciones considera que la implementación de prioridades podría no ser de mayor relevancia?

En la implementación se observa como los procesos más críticos (de mayor prioridad) son atendidos rápidamente, con un tiempo de espera reducido. Considero que el algoritmo resulta beneficioso en sistemas donde existen procesos significativamente más prioritarios, que requieren de una atención inmediata.
En sistemas que no presentan estas características (no hay procesos mucho más críticos que otros, sistemas homogéneos) podría no ser tan relevante su implementación. 
Además, los procesos con baja prioridad pueden sufrir de inanición con respecto a los de alta prioridad. Asimismo, se debe considerar el overhead producido por la asignación de prioridades y la asignación de procesos en base a estas, especialmente en entornos con gran cantidad de procesos.

## 9. Inanición (Starvation)

### (a) ¿Qué significa?

La inanición sucede cuando un proceso se encuentra en tiempo de espera indefinidamente, esperando ser ejecutado y, debido a la aparición de otro procesos (según el criterio del algoritmo), es desplazado de su turno para ocupar la CPU.

### (b) ¿Cuál/es de los algoritmos vistos puede provocarla?

De los algoritmos mencionados, la planificación por Prioridades (sin prioridad dinámica), el SJF y el SRTF pueden provocar inanición.

### (c) ¿Existe alguna técnica que evite la inanición para el/los algoritmos mencionados en b?

En al caso del algoritmo de prioridades, la inanición puede solucionarse mediante aging (incrementar la prioridad de los procesos que llevan mucho tiempo sin ejecutarse) o penalty (reducir la prioridad de procesos que se han estado ejecutando constantemente debido a su alta prioridad).
En el caso de SJF y SRTF, puede pensarse en un sistema híbrido con algoritmos Round Robin o por Prioridades, para solucionar el problema de inanición. Además, puede introducirse un tiempo límite máximo que puede pasar un proceso sin ejecutarse, para forzar su ejecución.

## 11. Algunos algoritmos pueden presentar ciertas desventajas cuando en el sistema se cuenta con procesos ligados a CPU y procesos ligados a entrada salida. Analice las mismas para los siguientes algoritmos:

### (a) Round Robin

Los procesos I/O bound suelen bloquearse antes de consumir completamente su Quantum, lo que hace que no se aproveche enteramente el intervalo de tiempo del proceso, favoreciendo el incremento del overhead por context switch.
Esto lleva a replantear el tamaño del Quantum. Sin embargo, un Quantum pequeño afecta a los procesos CPU bound, ya que son expulsados de la CPU antes de realizar un progreso significativo en la ejecución de sus instrucciones, además de aumentar el overhead por context switch.
Además, se debe considerar que aquellos procesos I/O bound que abandonan la CPU para atender el evento de Entrada/Salida, luego son encolados al final de la cola circular del RR. Esto implica que pasan mucho tiempo esperando la CPU, por cada vez que deben atender un evento E/S.

### (b) SRTF (Shortest Remaining Time First)

Los procesos CPU bound suelen tener ráfagas de CPU más largas que los I/O bound, por lo que este algoritmo tenderá a priorizar la ejecución de estos últimos. Esto podría provocar inanción de procesos ligados a la CPU.
La ejecución continua de procesos ligados a E/S resulta ineficiente, pues estos abandonan la CPU y pasan mucho tiempo esperando.

## 13. Suponga que un SO utiliza un algoritmo de VRR con Timer Variable para planificar sus procesos. Para ello, el quantum es representado por un contador, que es decrementado en 1 unidad cada vez que ocurre una interrupción de reloj. ¿Bajo este esquema, puede suceder que el quantum de un proceso nunca llegue a 0 (cero)? Justifique su respuesta.

No, bajo este esquema es imposible que eso suceda. Las interrupciones de reloj se realizan por Hardware, por lo que ocurrirán independientemente del proceso o la planificación. Esto implica que el contador se reducirá de forma obligada. Por otro lado, podría ocurrir que el proceso sea constantemente llamado para atender un evento de E/S. Sin embargo, con un VRR, el proceso será encolado en una queue auxiliar, para luego ser ejecutado con su Quantum restante.
La única forma de que el Quantum no llegue nunca a 0 es que este sea reiniciado (modificado dinámicamente) constantemente, pero este no es el caso planteado.

## 14.

### (a) Suponga un proceso cuyas ráfagas de CPU reales tienen como duración: 6, 4, 6, 4, 13, 13, 13 Calcule que valores se obtendrían como estimación para las ráfagas de CPU del proceso si se utiliza la formula 1, con un valor inicial estimado de S1 =10.

Dada la fórmula:

> $S_{n+1} = \frac{1}{n}T_n + \frac{n - 1}{n}S_n$

Donde:
$T_n$ = duración de la ráfaga de CPU i-ésima del proceso
$S_{n+1}$ = estimación de duración de la próxima ráfaga de CPU
$S_n$ = estimación previa de la duración de las ráfagas de CPU. Representa un historial
$n$ = número de ráfaga

Suponiendo $S_1 = 10$, se calcula cada estimación como:
$S_2 = 6$
$S_3 = 5$
$S_4 = 5.33$
$S_5 = 5$
$S_6 = 6.6$
$S_7 = 7.67$
$S_8 = 8.44$

### (b) Analice para que valores de α se tienen en cuenta los casos mas recientes.

Tomando la fórmula:

> $S_{n+1} = \alpha T_n + (1 - \alpha)S_n$
> 
> Con $0 < \alpha < 1$

Con $\alpha$ cercano a 0 (valores pequeños), se tiene más en cuenta el historial $S_n$ (valores antiguos).
Con $\alpha$ cercano a 1 (valores grandes), se tiene menos en cuenta el historial $S_n$ y se ponderan los valores recientes $T_n$. Esto significa que es más sensible a cambios recientes y se adapta más rápido.

### (c) Para la situación planteada en (a) calcule que valores se obtendrían si se utiliza la formula 2 con α = 0, 2; α = 0, 5 y α = 0, 8

Con $\alpha = 0.2$
$S_1 = 10$
$S_2 = 9.2$
$S_3 = 8.16$
$S_4 = 7.72$
$S_5 = 6.98$
$S_6 = 8.18$
$S_7 = 9.14$
Las estimaciones cambian lentamente porque dan mayor peso al historial

Con $\alpha = 0.5$
$S_1 = 10$
$S_2 = 8$
$S_3 = 6$
$S_4 = 6$
$S_5 = 5$
$S_6 = 9$
$S_7 = 11$
Enfoque balanceado entre historial y ráfagas recientes

Con $\alpha = 0.8$
$S_1 = 10$
$S_2 = 6.8$
$S_3 = 4.56$
$S_4 = 5.71$
$S_5 = 4.34$
$S_6 = 11.26$
$S_7 = 12.65$
Las estimaciones cambian rápidamente porque se da mayor peso a la última ráfaga de CPU

### (d) Para todas las estimaciones realizadas en a y c ¿Cuál es la que mas se asemeja a las ráfagas de CPU reales del proceso?

Debido a que las ráfagas de CPU del proceso planteado poseen valores significativamente cambiantes entre una y otra, el enfoque de la fórmula 2, con un $\alpha = 0.8$ es el que se ha adaptado mejor a los distintos valores de ráfaga, para estimar la duración de la siguiente.

## 15. Colas Multinivel

### (a) Suponga que se tienen dos tipos de procesos: Interactivos y Batch. Cada uno de estos procesos se coloca en una cola según su tipo. ¿Qué algoritmo de los vistos utilizaría para administrar cada una de estas colas?.

En base a los algoritmos vistos, resulta beneficiosa la utilización de Round Robin de Tiempo Variable para los procesos interactivos, pues proveee una atención equitativa, justa y relativamente rápida para cada proceso.
Por otro lado, los procesos batch se caracterizan por no requerir interacción, por lo que no necesitan de una velocidad de respuesta elevada. Para esta cola, podría utilizarse un algoritmo FCFS.

### (b) Para el caso de las dos colas vistas en a: ¿Qué algoritmo utilizaría para planificarlas?

Para la planificación de las colas, utilizaría un algoritmo de Prioridades, donde la cola de procesos interactivos sea de mayor prioridad que la cola de procesos batch. Sin embargo, para evitar inanición, si la cola de procesos batch pasa mucho tiempo sin ejecutar ninguno de sus procesos, aumentará su prioridad temporalmente.

## 18. 

Para el caso planteado, tendría 3 colas:

1. Cola 1: procesos nuevos o con bajo tiempo de ejecución. Mayor prioridad.
2. Cola 2: procesos con tiempo acumulado medio. Prioridad media.
3. Cola 3: procesos con tiempo de ejecución alto. Prioridad baja.

La cola 1 será planificada mediante RR TV.
La cola 2 será planificada también con RR TV.
La cola 3 será planificada con FCFS.

Las colas son administradas por un algoritmo de planificación por Prioridades, con envejecimiento. Si un proceso transcurre un tiempo determinado sin ejecutarse, se encolará en la siguiente cola de mayor prioridad.
Para determinar que un proceso se ha ejecutado por largo tiempo se considera cuantas veces se ha ejecutado su Quantum completo. Al cumplir determinada cantidad de veces en los que se ha ejecutado en la totalidad de su Quantum, es bajado a una cola de menor prioridad.

## 19. 

### (a) Analizando la jerarquía descripta para las bandas de prioridades: ¿Que tipo de actividad considera que tendrá más prioridad? ¿Por qué piensa que el scheduler prioriza estas actividades?

Considero que los procesos de usuario son los prioritarios ya que, tal como se describió al sistema, estaba pensado para entornos interactivos. Por lo tanto, se le debe dar prioridad a las tareas que involucren al usuario (procesos interactivos), debido a la naturaleza del sistema.
Es por ello que el scheduler ubica a estos procesos en la cola de mayor prioridad.

### (b) Para el caso de los procesos de usuarios, y analizando las funciones antes descriptas: ¿Qué tipo de procesos se encarga de penalizar? (o equivalentemente se favorecen). Justifique

Dadas las fórmulas para el cálculo de la prioridad y el tiempo medio de la CPU. Se observa que a medida que el tiempo medio de CPU crece, la prioridad también lo hace. Siendo que un menor número indica una prioridad más alta, se puede concluir que se penalizaba a los procesos de usuario con tiempo medio de CPU elevado, favoreciendo a los más cortos.

### (c) La utilización de RR dentro de cada cola: ¿Verdaderamente favorece al sistema de Tiempo Compartido? Justifique.

Si. El algoritmo de Round Robin se encarga de distribuir el tiempo de ejecución de cada proceso de manera equitativa mediante la asignación de un intervalo de tiempo determinado para cada uno (Quantum). Si se considera que el sistema era de tiempo compartido, entonces este algoritmo favorece dicha repartición de tiempo de ejecución.

## 20. A cuáles de los siguientes tipos de trabajos: (a) cortos acotados por CPU, (b) cortos acotados por E/S, (c) largos acotados por CPU, (d) largos acotados por E/S, benefician las siguientes estrategias de administración:

### (a) Prioridad determinada estáticamente con el método del más corto primero (SJF).

Beneficia a procesos cortos. Principalmente cortos acotados por E/S, pues sus ráfagas de CPU son más cortas.

### (b) Prioridad dinámica inversamente proporcional al tiempo transcurrido desde la última operación de E/S.

Beneficia procesos acotados por E/S. Principalmente a los procesos largos de este estilo, pues probablemente tendrán más operaciones E/S que uno corto, haciendo que el tiempo desde su última operación de este tipo sea menor y, por lo tanto, incrementando su prioridad.

## 21. Explicar porqué si el quantum "q" en Round-Robin se incrementa sin límite, el método se aproxima a FIFO.

El algoritmo de Round Robin es apropiativo, expulsando a un proceso de la CPU cuando finaliza su Quantum y encolandolo al final de la cola circular.
Si el Quantum se incrementa sin límite, los procesos finalizarán su tarea en su primer ejecución, por lo que no serán expulsados. Esto significa que tomarán la CPU en el orden en el que llegaron, finalizarán su tarea y abandonarán la CPU, tal como funciona un algoritmo FIFO.

## 22.

### (a) ¿Con cuál/es de estas clasificaciones asocia a las PCs de escritorio habituales?

En PCs de escritorio habituales, los procesadores que la componen suelen ser homogénemos y entran en la clasificación de multiprocesador fuertemente acoplado, pues los núcleos de la CPU trabajan con una misma memoria principal y bajo el mismo SO.

### (b) ¿Qué significa que la asignación de procesos se realice de manera simétrica?

Implica que no hay procesadores dedicados a tareas específicas, sino que todos pueden ejecutar cualquier tipo de proceso.
A su vez, cada uno administra su propia cola de procesos con su algoritmo de planificación, y la carga de procesamiento es distribuida para evitar sobrecargas.

### (c) ¿Qué significa que se trabaje bajo un esquema Maestro/esclavo?

En este esquema, existe un procesador maestro que actúa como principal. Gestiona la asignación de procesos, administración de interrupciones y planificación global del sistema. Suele ejecutar mayormente tareas del sistema.
El procesador esclavo ejecuta los procesos asignados por el procesador maestro, pero no toman decisiones de planificación.
Es un enforque más simple, ya que la lógica de planificación está centralizada en un procesador, pero puede ser ineficiente ante sobrecargas de trabajo y no aprovecha totalmente el multiprocesamiento.

## 23. Asumiendo el caso de procesadores homogéneos:

### (a) ¿Cuál sería el método de planificación más sencillo para asignar CPUs a los procesos?

El método más sencillo para determinar en que CPU ejecutar un proceso es la asignación estática con FCFS. De esta forma, se crea un cola global y los procesos se van asignando a los procesadores disponibles de forma ordenada y fija. Una vez asignados a una CPU, permanecen en esta hasta finalizar su trabajo o ser bloquearse (no son asignados a otro dinámicamente).
Los métodos de planificación para sistemas multiprocesador pueden tener similitudes con los algoritmos de planificación en sistemas monoprocesador. Sin embargo, se deben adaptar para tener en cuenta el balance de la carga, la localidad de memoria (aprovechar los datos ya cargados en la caché de un procesador anteriormente utilizado) y la migración de procesos (definir en tiempo de ejecución si reasignar un proceso a otra CPU).

### (b) Cite ventajas y desventajas del método escogido

Entre las ventajas encontramos la simplicidad de implementación, pues no requiere cálculos adicionales ni monitoreo de parámetros de los procesos.
Sin embargo, como desventaja podemos considerar que es poco flexible, no balancea la carga de trabajo de los procesadores (algunos procesadores pueden estar sobreexigidos y otros subutilizados). Además, ignora la afinidad de procesos a determinadas CPUs (donde se hayan ejecutado previamente, para reducir costos de acceso a caché).

## 24. Indique brevemente a que hacen referencia los siguientes conceptos:

### (a) Huella de un proceso en un procesador

Se define huella como el estado que va dejando un proceso en la caché de un procesador. Durante su ejecución, se carga información del proceso en la caché de la CPU que lo ejecuta para reducir los tiempos de espera. Esto es relevante a la hora de determinar que procesador elegir para un determinado trabajo, pues podría reducir los tiempos de acceso de la caché (considerando que ya posee información del proceso).

### (b) Afinidad con un procesador

Define la preferencia de un procesa para ejecutarse en un procesador específico. Puede deberse a razones de rendimiento (el tipo de proceso es ejecutado de forma más óptima por un procesador dedicado) o puede estar relacionado al concepto de huella.

### (c) ¿Por qué podría ser mejor en algunos casos que un proceso se ejecute en el mismo procesador?

Tal como detalla el concepto de huella, ejecutar un proceso en un mismo procesador puede ser beneficioso para reutilizar la información ya cargada en la caché de dicho procesador. Además, reduce el overhead por migración de un proceso a otra CPU (transferir datos) y evita problemas de coherencia de caché.

### (d) ¿Puede el usuario en Windows cambiar la afinidad de un proceso? ¿y en GNU/Linux?

En ambos SOs se puede cambiar la afinidad de un proceso.
En Windows se realiza mediante el administrador de tareas, mientras que en GNU/Linux se hace a través de comandos como `taskset` (ej.: `taskset -cp 0-2 1234` asigna al proceso de PID 1234 a los procesador 0, 1 y 2).

### (e) Investigue el concepto de balanceo de carga (load balancing).

El balanceo de cargas es una técnica que busca la distribución de procesos de manera equitativa entre los distintos procesadores, para maximizar la utilización de recursos. Un sistema con balanceo de carga evita que algunos procesos estén sobrecargados mientras otros infrautilizados.
El balanceo puede ser estático (tareas se asignan de forma fija) o dinámico (las tareas pueden migrar a otro procesador durante la ejecución).

### (f) Compare los conceptos de afinidad y balanceo de carga y como uno afecta al otro.

La afinidad prioriza el rendimiento de procesos inviduales, asignando su ejecución a procesadores en los cuales ya se hayan ejecutado anteriormente.
El balanceo de carga aboga por la optimización de los recursos del sistema para evitar la saturación de algunos procesadores.
Mantener un sistema balanceado en cargas puede, en algunos casos, romper la afinidad. Por otro lado, una afinidad pura puede desbalancear las cargas.
Los sistemas modernos suelen combinar ambas estrategias de forma equilibrada, priorizando afinidad pero realizando balanceos de carga ocasionales.

## 25. 

### (d) ¿Cuál de las dos alternativas planteadas es mas performante?

En términos de tiempo de retorno y tiempo de espera, la segunda alternativa (los procesos tienen afinidad pero si el procesador está ocupado toman otro) es más performante, ya que se reducen los tiempos de espera para obtener la CPU. Sin embargo, se deben considerar otras cuestiones como la huella del proceso en la memoria caché del procesador, lo cual no se contempla en el ejercicio.