# Trabajo Práctico 2

## **1. Editor de textos**

### (a) Nombre al menos 3 editores de texto que puede utilizar desde la línea de comandos.

Algunos de los editores de texto más conocidos que pueden ser utilizados en CLI son:
- Nano
- Vi (y su versión avanzada Vim)
- Emacs (el primer editor de texto de GNU)

### (b) ¿En qué se diferencia un editor de texto de los comandos cat, more o less? Enumere los modos de operación que posee el editor de textos vi.

Los comandos mencionados permiten mostrar en el shell el contenido de un archivo de texto. Por otro lado, como su nombre lo sugiere, los editores de texto permiten la modificación del contenido del archivo de una forma amigable y dinámica. Estos poseen shortcuts y funcionalidades para agilizar el proceso.
El editor de texto Vi tiene los siguientes modos de operación:
- Modo Insert (INS o I): permite insertar y eliminar caracteres.
- Modo visual (V): permite visualizar y navegar por el documento.
- Modo de órdenes (ESC): permite ejecutar comandos sobre el archivo, tal como escribir el contenido o salir.

#### (c) Nombre los comandos más comunes que se le pueden enviar al editor de textos vi.

Algunos de los comandos más comunes en Vi son:
- `w`: escribir cambios
- `q` o `q!`: salir
- `dd`: eliminar línea
- `y`: copiar
- `p`: pegar
- `u`: deshacer
- `/frase`: buscar "frase" en el archivo 

## **2. Proceso de Arranque SystemV**

### (a) Enumere los pasos del proceso de inicio de un sistema GNU/Linux, desde que se prende la PC hasta que se logra obtener el login en el sistema.

El proceso de arranque del mediante el sistema de inicio System V consta de una serie de pasos ordenados que cumplir dicha tarea. Los principales son:
1. Se comienza a ejecutar el código del BIOS.
2. BIOS ejecuta POST (Power-On Self-Test), que se asegura que el hardware funcione correctamente.
3. BIOS lee sector de arranque (MBR).
4. Se carga el gestor de arranque (MBC).
5. Bootloader carga Kernel y el `initrd`
6. Se monta `initrd`, sistema de archivos raíz que monta componentes del sistema.
7. Kernel ejecuta proceso `init` (proceso padre) y desmonta `initrd`.
8. Se lee `/etc/inittab`.
9. Se ejecutan scripts de runlevel 1.
10. El final del runlevel 1 indica que se debe ir al runlevel por defecto.
11. Se ejecutan los scripts apuntados por el runlevel por defecto.
12. El sistema se encuentra listo para ser usado.

### (b) Proceso INIT. ¿Quién lo ejecuta? ¿Cuál es su objetivo?

El proceso `init` es el encargado de cargar todas los subprocesos necesarios para el correcto funcionamiento del SO. No tiene padre y es el padre de todos los procesos. Se encuentra en `/sbin/init` y su PID es 1. Encargado de montar los filesystems y hacer disponibles los demás dispositivos.
Es el propio Kernel quien ejecuta el proceso `init`.

### (c) Runlevels. ¿Qué son? ¿Cuál es su objetivo?

Los runlevels indican el modo de arranque de Linux. Estos definen que procesos se ejecutarán al iniciarse el SO. El proceso de arranque se divide en niveles, los cuales definen mediante la ejecución de scripts en `etc/init.d` que procesos se levantarán y bajarán. Los runleves están definidos en `/etc/inittab`.

### (d) ¿A qué hace referencia cada nivel de ejecución según el estándar? ¿Dónde se define qué Runlevel ejecutar al iniciar el sistema operativo? ¿Todas las distribuciones respetan estos estándares?

El estándar describe 7 niveles:
- 0: halt
- 1: singleuser mode
- 2: multiuser mode sin servicios de red
- 3: full multiuser mode console (multiusuario sin GUI)
- 4: sin uso
- 5: X11 (multiusuario completo con GUI)
- 6: reboot

Como se mencionó anteriormente, los runlevels se encuentran definidos en `/etc/inittab`. Los scripts que ejecutan estos están en `/etc/init.d`, y se accede a ellos mediante `/etc/rcX.d`, donde X indica el nivel (0..6). Aquí se encuentran los links a los archivos, con un formato específico.
No todas las distribuciones respetan este estándar. RHEL, Fedora y CentOS utilizan el estándar mientras que Debian no diferencia entre nivel 2 y 5.
Los runlevels fueron reemplazados por otras herramientas para la inicialización del sistema en distribuciones que no utilizan SystemV

### (e) Archivo /etc/inittab. ¿Cuál es su finalidad? ¿Qué tipo de información se almacena en el? ¿Cuál es la estructura de la información que en él se almacena?

En `/etc/inittab` se encuentran definidos los runlevels. Por lo tanto, se encarga de controlar el proceso de inicialización.
El proceso `init` busca en `/etc/inittab` para definir el nivel de ejecución del sistema durante el arranque.
Los niveles de ejecución se encuentran en el formato *id:runlevel:acción:proceso* donde:
- **id**: indentifica entrada en inittab.
- **runlevel**: el/los niveles de ejecución en los que se realiza la acción.
- **acción**: describe la acción a realizar
    - wait
    - initdefault
    - off
    - boot
- **proceso**: el proceso exacto que será ejecutado.

### (f) Suponga que se encuentra en el runlevel <X>. Indique qué comando(s) ejecutaría para cambiar al runlevel <Y>. ¿Este cambio es permanente? ¿Por qué?

En sistema que utilizan SystemV, es posible cambiar de runlevel con el comando `sudo init X`, siendo X el número de runlevel. Se utiliza sudo para obtener permisos de usuario root. Esto permitirá cambiar el runlevel en la sesión, pero no será permanente, pues al reiniciar el sistema volverá al runlevel predeterminado. Este se encuentra configurado en `/etc/inittab` bajo `initdefault` como acción. Esto puede ser cambiado modificando dicho archivo.

### (g) Scripts RC. ¿Cuál es su finalidad? ¿Dónde se almacenan? Cuando un sistema GNU/Linux arranca o se detiene se ejecutan scripts, indique cómo determina qué script ejecutar ante cada acción. ¿Existe un orden para llamarlos? Justifique.

Los scripts RC ("Run Command") tienen la finalidad de inicializar y detener servicios en diferentes etapas del arranque y apagado del sistema. Definen que servicios y procesos deben iniciarse, detenerse o reiniciarse cuando el sistema cambia de un estado a otro.

En sistemas con SystemV, estos se encuenetran en `/etc/init.d` y se acceden a ellos mediante links en `/etc/rcX.d`, donde X es el número del runlevel. Por lo tanto, la primera ruta contiene los scripts de inicio y apagado de los servicios, mientras la segunda se corresponde a cada runlevel y enlaza a los scripts.
Cuando el sistema cambia de un runlevel a otro, se ejecutan los scripts correspondientes de ese nivel. Dentro de `/etc/rcX.d` estos están identificados con `S` o `K`. El primero indica scripts que deben iniciarse cuando se ingresa al runlevel, mientras el segundo es para scripts que deben detenerse cuando se abandona el runlevel. Luego sigue el órden de ejecución y finalmente el nombre del script, resultando en un formato `S|K <orden> <nombre>`.
Cuando se cambia de runlevel, primero se ejecutan los scripts `K` para detener servicios no necesarios y luego los `S` para levantar aquellos que si (siempre respetando el órden indicado).

## **3. SystemD**

### (a) ¿Qué es systemD?

SystemD es el administrador de servicios y sistemas estandarizado en gran parte de las distribuciones de GNU/Linux. Se compone de un conjunto de daemons (proceso de segundo plano independiente) de administración de sistema, bibliotecas y herramientas diseñados como plataforma de administración y configuración del kernel de GNU/Linux. Se utiliza como sistema de arranque de Linux (reemplaza a `init`, aunque conceptualmente este sea el proceso inicial, es systemd el binario ejecutado).
Se desarrolló para reemplazar a SystemV y Upstart. A diferencia de sistemas anteriores, permite arrancar servicios en paralelo.

### (b) ¿A qué hace referencia el concepto de Unit en SystemD?

En systemd, los units son los componentes básicos que el sistema de inicialización utiliza para gestionar y controlar diferentes aspectos del sistema. Cada unidad representa un tipo específico de recurso o servicio y se define mediante archivos de configuración.
Algunos de los tipos de units son:
- Service: definen servicios que se ejecutan en el sistema, como daemons.
- Socket: definen sockets de red o IPC que pueden ser utilizados para activar servicios.
- Target: agrupan unidades para un objetivo común. Definen niveles de ejecución
- Mount: definen puntos de montaje del FS.

### (c) ¿Para que sirve el comando systemctl en SystemD?

`systemctl` es una utility utilizada para controlar y administrar servicios systemd. Su sintaxis es `systemctl [OPTIONS...] {COMMAND}`
Permite visualizar el estado del sistema en cuanto a units operando, iniciar, detener, habilitar y deshabilitar servicios.

### (d) ¿A qué hace referencia el concepto de target en SystemD?

Systemd opera en base a targets, un tipo especial de unit utilizado para agrupar unidades, definir el modo de ejecución del SO y organizar el arranque y apagado del sistema. Son equivalentes al concepto de Runlevels, y se encargar de codificar información sobre los servicios que se inician en determinadas circunstancias (Ej.: target multi-user.target se corresponde al runlevel 3).
Un target agrupa varias unidades (service, socket, device) que deben estar activadas para lograr un estado operativo determinado. No ejecutan servicios directamente, sino que coordinan y agrupan unidades.
Algunos usos comunes son:
- Cambio de estado del sistema: para cambiar, por ejemplo, de multi-user.target a graphical.target.
- Dependencias entre servicios: agrupa dependencias que se requieren unas a otras para ejecutarse, para asegurar el correcto inicio de un estado específico.
- Manejo de perfiles de arranque: permite controlar qué servicios y unidades se inician en diferentes circunstancias.

### (e) Ejecute el comando pstree. ¿Qué es lo que se puede observar a partir de la ejecución de este comando?

`pstree` muestra los procesos en ejecución estructurados como árbol. Mediante este comando es posible visualizar los procesos padre junto a sus hijos. Posee distintas opciones que permiten gestionar los datos visualizados en el árbol.
En su raíz, se encuentra systemd con un PID 1.

## **(4) Usuarios**

### (a) ¿Qué archivos son utilizados en un sistema GNU/Linux para guardar la información de los usuarios?

En GNU/Linux existen usuarios root (administradores) y los usuarios extándar del sistema.
Existen distintos archivos que guardan información sobre los usuarios. Algunos son:
- `/etc/passwd`: atributos y configuraciones de los usuarios (como username, password, path del home, etc).
- `/etc/group`: grupos del sistema. Todo usuario pertenece a un grupo, lo que permite gestionar permisos del sistema.
- `/etc/shadow`: almacena las contraseñas encriptadas de los usuarios del sistema.

### (b) ¿A qué hacen referencia las siglas UID y GID? ¿Pueden coexistir UIDs iguales en un sistema GNU/Linux? Justifique.

Las siglas UID hacen referencia a User ID, mientras que GID refiere a Group ID.
El UID identifica al usuario dentro del sistema y determinar sus permisos en cuanto a recursos que puede acceder. Por ello, los UIDs son únicos, no pueden repetirse.

### (c) ¿Qué es el usuario root? ¿Puede existir más de un usuario con este perfil en GNU/Linux? ¿Cuál es la UID del root?

El usuario root es el usuario con los privilegios más altos. Posee el control total del sistema y puede realizar cualquier operación, tal como la modificación de cualquier archivo del sistema, instalación y desinstalación de software, la administración de usuarios, y la configuración del hardware.
La UID del usuario root es 0. Estrictamente solo puede haber un usuario root (con UID 0). Pero es posible que múltiples usuarios accedan a los privilegios de un usuario root (con el comando sudo, pero debe pertenecer al grupo sudoers).

### (e) Investigue la funcionalidad y parámetros de los siguientes comandos:
- `useradd`: permite crear un nuevo usuario o actualizar la información default de un nuevo usuario. `useradd [options] LOGIN`.
- `usermod`: modifica una cuenta de usuario (sus archivos de sistema). `usermod [options] LOGIN`.
- `userdel`: elimina una cuenta de usuario y sus archivos relacionados. `userdel [options] LOGIN`.
- `su`: permite ejecutar comandos con un ID de usuario y grupo sustituto. `su [options] [user [argument...]]` permite acceder al perfil del user explicitado (siempre y cuando se ingrese la contraseña) y beneficiarse de sus prestaciones (shell, permisos, etc).
- `groupadd`: crea un nuevo grupo. Pueden indicarse valores especificos. `groupadd [OPTIONS] NEWGROUP`.
- `who`: imprime información acerca de los usuarios que están actualmente autenticados.
- `groupdel`: elimina un grupo. `groupdel [options] GROUP`.
- `passwd`: cambia la contraseña del usuario. Un usuario normal puede modificar solo su contraseña, mientras que el usuario root puede cambiar la de cualquier usuario. `passwd [options] LOGIN`.

## **(5) FileSystem**

### (a) ¿Cómo son definidos los permisos sobre archivos en un sistema GNU/Linux?

En GNU/Linux, los permisos sobre archivos se definen a través de tres atributos claves: lectura(r), escritura (w) y ejecución (x). Estos se aplican a tres tipos de usuario:
- Propietario (usuario que creo el archivo o directorio)
- Grupo (grupo al cual pertenece el archivo o directorio)
- Otros (los demás usuarios del sistema)

### (b) Investigue la funcionalidad y parámetros de los siguientes comandos relacionados con los permisos en GNU/Linux:

- `chmod`: permite modificar los permisos, cambiando los bits del modo del archivo, ya sea de modo simbólico o numérico. 
- `chown`: modifica el propietario y/o grupo de un archivo. Puede cambiarse solo uno de ellos o ambos. Si solo es especificado un grupo actúa como `chgrp`.
- `chgrp`: cambia el grupo al que pertenece el o los archivos especificados.

### (c) Al utilizar el comando chmod generalmente se utiliza una notación octal asociada para definir permisos. ¿Qué significa esto? ¿A qué hace referencia cada valor?

Cada permiso (read, write, execution) posee un valor numérico asociado, representado en formato octal:
- r = 4
- w = 2
- x = 1

Los permisos por cada categoría se suman, pudiendo utilizar `chmod` para modificar los permisos de un archivo de manera numérica.

### (d) ¿Existe la posibilidad de que algún usuario del sistema pueda acceder a determinado archivo para el cual no posee permisos? Nombrelo, y realice las pruebas correspondientes.

El usuario root, como superusuario, puede acceder a cualquier archivo, aunque este no posea expresamente permisos para leerlo, escribirlo o ejecutarlo. Alternativamente, se puede hacer esto mediante el comando sudo.
Existe otra alterantiva mediante el bit SUID o SGID del archivo en cuestión. Este bit permite que este se ejecute con los permisos del propietario o grupo del archivo, en lugar del usuario que está llevando a cabo la acción. Esto permite acceder temporalmente a recursos restringidos.


### (e) Explique los conceptos de “full path name” y “relative path name”. De ejemplos claros de cada uno de ellos.

El path indica la ubicación de archivos o directorios. Este se compone de un nombre y el separador "/". Si comienza desde la raíz, el primer "/" es el root directory.
El full path o path absoluto siempre comienza desde el root directory hasta el directorio o archivo especificado. Ej.: `/home/user/Downloads/test`.
Por otro lado, la relative path o path relativo comienza desde el directorio actual. Ej.: si estoy en `/home/user`, puedo indicar `Downloads/test`.
"." denota el directorio actual en el path, mientras que ".." indica el directorio principal (un nivel superior del actual). Esta notación es útil para indicar paths relativos.

### (f) ¿Con qué comando puede determinar en qué directorio se encuentra actualmente? ¿Existe alguna forma de ingresar a su directorio personal sin necesidad de escribir todo el path completo? ¿Podría utilizar la misma idea para acceder a otros directorios? ¿Cómo? Explique con un ejemplo.

Con el comando `pwd` puede visualizarse el directorio de trabajo actual.
Existen algunas formas de acceder a ciertos directorios sin especificar el path completo:
- `cd ~` o `cd` permite acceder al directorio `/home/`.
- `cd -` permite regresar al path en el que se estaba antes.
- `cd ..` permite ir al directorio padre. Puede encadenarse para subir más niveles (`cd ../..`).
Imagine el siguiente path `/home/nahuel/Documents/ISO2024`.
Puede accederse a `/home/nahuel/` con `cd`. Luego, regresar al path `/home/nahuel/Documents/ISO2024` con `cd -`. Finalmente, puede irse a `/home/nahuel/Documents/` con `cd ..` o regresar a `/home/nahuel/` con `cd ../..`.

## **(6) Procesos**

### (a) ¿Qué es un proceso? ¿A que hacen referencia las siglas PID y PPID? ¿Todos los procesos tienen estos atributos en GNU/Linux? Justifique. Indique qué otros atributos tiene un proceso.

Un proceso es un programa o conjunto de instrucciones que se ejecutan en un sistema operativo. Es dinámico y su ciclo de vida corresponde desde que se solicita ejecutar hasta que termina.
El PID refiere al ID del proceso, mientras PPID identifica al proceso padre del consultado. Todos los procesos en GNU/Linux poseen PID y PPID, excepto por el primer proceso, el cual no posee padre (init).
En ambientes multiusuarios, el proceso puede almacenar desde que terminal y quién lo ejecutó. Si hay estructura de grupos, también indica que grupo lo disparó.
Otros atributos que posee el proceso son: el estado del proceso (running, sleeping, etc.), el PC, el contexto, entre otros.

### (b) Indique qué comandos se podrían utilizar para ver qué procesos están en ejecución en un sistema GNU/Linux.

Hay dos comandos principales:
- `ps`: muestra los procesos en ejecución. Puede combinarse con opciones como `-aux` para visualizar la CPU y RAM utilizada.
- `top`: es un comando que muestra los procesos en ejecución y en reposo, junto con otra información relevante de los mismos y su consumo de CPU y memoria. 

### (c) ¿Qué significa que un proceso se está ejecutando en Background? ¿Y en Foreground?

Un proceso que se ejecuta en **foreground** es aquel que tiene control de la terminal. Mientras el proceso está en ejecución, la terminal queda bloqueada hasta que el proceso termine. Puede detenerse com `Ctrl + C` o suspenderse con `Ctrl + Z`.
Un proceso que se ejecuta en **background** es aquel que no tiene control directo de la terminal, sino que se ejecuta en segundo plano mientras el usuario puede continuar trabajando en la terminal.

### (d) ¿Cómo puedo hacer para ejecutar un proceso en Background? ¿Como puedo hacer para pasar un proceso de background a foreground y viceversa?

Para ejecutar un proceso en background se añade el símbolo "&" al final del comando, lo que hará que se ejecute en segundo plano.
Para pasar un proceso de foreground a background, se presiona `Ctrl + Z` mientras este se ejecuta, lo cual lo suspende. Luego se utiliza el comando `bg` para reanudarlo en background.
Si un proceso está ejecutandose en background y se quiere pasar a foreground se utiliza el comando `fg` (trae el último proceso en segundo plano). Si hay varios, se utiliza el comando `jobs` para ver los procesos en segundo plano y luego `fg %NUMBER`, siendo NUMBER el número del proceso listado.

### (e) Pipe ( | ). ¿Cuál es su finalidad? Cite ejemplos de su utilización.

El "|" permite comunicar dos procesos por medio de un pipe o tubería desde la shell. El pipe conecta el stdout del primer comando con la stdin del segundo, permitiendo anidar tantos comandose como se desee. El ejemplo más básico es `ls | more`, en donde `ls` lista los elementos del directorio actual y `more` permite visualizar la información en a una pantalla completa a la vez. Uniendo estos dos comandos se da otro formato a la visualización de los elementos del directorio, y resulta especialmente útil cuando se tienen muchos elementos.

### (f) Redirección. ¿Qué tipo de redirecciones existen? ¿Cuál es su finalidad? Cite ejemplos de utilización.

La redireción es una técnica utilizada para redirigir la entrada y salida de comandos. Estos interactúan con tres flujos estándar: stdin (fuente de datos de entrada), stdout (resultado del comando) y stderr (error estándar, mensaje de error producido por los comandos).
Los tipos de redirección son:
- Redirección stdout: redirige la salida estándar de un comando a un archivo. > indica una redirección destructiva mientras >> es no destructiva. Ej.: `echo "hola mundo > archivo.txt` sobreescribirá el archivo mientras que `echo "hola mundo" >> archivo.txt` agregará la línea.
- Redirección pipe: redirige salida estándar de un comando a otro.
- Redirección stdin: redirige contenido del archivo a la entrada estándar de un comando. Se utiliza con "<", para pasar contenido de un archivo a un comando (a veces es aconsejable utilizarlo por sobre cat).
- Redirección de stderr: se distingue de la redirección stdout explicitando el ID 2 (2> o 2>>). Permite redireccionar el flujo de datos del error a un archivo. Ej.: `ls ffff 2> error.txt` guardará la información del error en "error.txt".

### (g) Comando kill. ¿Cuál es su funcionalidad? Cite ejemplos.

El comando `kill` envía una señal a un proceso que permite controlar su comportamiento especificando su PID. Tiene la forma `kill [options] <pid> [...]`. Las posibles señales a enviar pueden verse con `kill -l`. Algunas son:
- `SIGTERM` (15): solicita que el proceso termine de manera ordenada. Es la señal default. Ej.: `kill 123` enviaría la señal para finalizar el proceso de PID 123.
- `SIGKILL` (9): fuerza la terminación del proceso.
- `SIGSTOP` (19): pausa el proceso.

### Investigue la funcionalidad y parámetros de los siguientes comandos relacionados con el manejo de procesos en GNU/Linux. Además, compárelos entre ellos:

- `ps`: muestra en pantalla información sobre una selección de los procesos activos. `-A` selecciona todos los procesos, `T` selecciona todos los procesos asociados con el terminal, `r` muestra solo los procesos en ejecución.
- `kill`: envía señal a un proceso, permitiendo controlar su comportamiento. 
- `pstree`: muestra los procesos en ejecución estructurados como árbol, cuya raíz suele ser init. `-p` permite mostrar sus PID.
- `killall`: envía una señal a todos los procesos con un nombre específico, a diferencia de `kill` que requiere el PID. Puede indicarse la señal, que por defecto es la de terminación (`SIGTERM`).
- `top`: muestra los procesos del sistema de forma dinámica, con una vista en tiempo real junto con información del mismo, tal como su PID y consumo de CPU y memoria.
- `nice`: permite ejecutar un programa con una prioridad expecífica (afectará el tiempo de CPU). `nice -n [PRIORITY] [COMMAND]` permite ajustar la prioridad (entre -20, mayor prioridad, y 19, menor prioridad) y el el programa que se ejecuta. Puede ajustarse la prioridad de un proceso en ejecución con `renice`.

## **(7) Otros comandos de Linux (Indique funcionalidad y parámetros):**

### (a) ¿A qué hace referencia el concepto de empaquetar archivos en GNU/Linux?

El concepto de empaquetar refiere a combinar múltiples archivos y directorios en un solo archivo, facilitando su copia, almacenamiento o distribución. No necesariamente implica compresión.
`tar` es la herramienta más utiliza en GNU/Linux para empaquetar, en archivos llamados tarball. Puede hacerse con el comando `tar -cvf <archivo> [ARGUMENTS]`, mientras que `tar -czvf <archivo> [ARGUMENTS]` también los comprime con gzip, obteniendo un archivo `.tar.gz`. `tar -xvf <archivo>` permite desempaquetarlo, mientras `tar -xzvf <archivo>` extrae y descomprime.
Puede utilizarse `zip` y `unzip` para empaquetar comprimiendo y desempaquetar respectivamente.

### (b) Seleccione 4 archivos dentro de algún directorio al que tenga permiso y sume el tamaño de cada uno de estos archivos. Cree un archivo empaquetado conteniendo estos 4 archivos y compare los tamaños de los mismos. ¿Qué característica nota?

Teniendo los archivos "a", "b", "c", "d" y el directorio "e", utilizando el comando `tar -cvf paquete.tar a b c d e/` se obtiene archivo empaquetado `paquete.tar`, el cual presenta un peso considerablemente mayor a los archivos individuales.

### (c) ¿Qué acciones debe llevar a cabo para comprimir 4 archivos en uno solo? Indique la secuencia de comandos ejecutados.

Teniendo los archivos "a", "b", "c", "d" y el directorio "e", utilizando el comando `tar -cvzf comprimido.tar.gz a b c d e/` se obtiene archivo empaquetado comprimido `comprimido.tar.gz`


### (d) ¿Pueden comprimirse un conjunto de archivos utilizando un único comando?

Si, utilizando `tar -cvzf` para gzip, `tar -cvjf` para bzip2 y `zip` para ZIP.

### (e) Investigue la funcionalidad de los siguientes comandos:
- `tar`: utilidad de archivación. Puede combinarse con `-c`, `-v` y `-f` (`tar cvf`) para crear un archivo empaquetado `.tar`.
- `grep`: busca los patrones especificados en cada nombre de archivo indicado e imprime en pantalla cada línea que coincida con dicho patrón. Dicho patrón suele indicarse entre "". 
- `gzip`: permite comprimir y descomprimir archivos.
- `zgrep`: utilizado para buscar un patrón (texto) dentro de archivos comprimidos con formato gzip, sin necesidad de descomprimirlo. Combinación entre `grep` y `gzip`. 
- `wc` (word count): utilizado para contar líneas, palabras y caracteres en archivos o entradas de texto. `wc [OPTIONS] FILE`. Por defecto muestra tres columnas (número de líneas, número de palabras, número de bytes). `-l` para solo líneas, `-w` para palabras y `-c` para bytes (o `-m` para caracteres). Especialmente usado con pipes. 

## **(8)**

Siendo que los comandos se ejecutan desde un usuario no root, no puedo realizar ciertas tareas como modificar el owner de un archivo para el root, modificar los permisos de archivos del sistema (ej.: `/etc/passwd`), modificar la contraseña del root, cambiar el directorio home del root, ir al directorio `/root`, copiar los archivos de `/etc`, entre otros.

## **(9)**

**a)** `sudo kill -9 23`

**b)** `sudo kill -9 1` (no sucede nada)

**c)** `find /home -name *.conf`

**d)** `ps -e > /home/nahuel/procesos`

**e)** `chmod 751 /home/nahuel/xxxx`

**f)** `chmod 650 /home/nahuel/yyyy`

**g)** `rm /tmp/*`

**h)** `sudo chown iso2010 /opt/isodata`

**i)** `pwd >> /home/nahuel/donde`

## **(10) Indique que comando sería necesario ejecutar para realizar cada una de las siguientes acciones:**

**a)** `sudo login root` o `su -`

**b)** `sudo adduser <username> --conf file`

**d)** `mkdir /tmp/cursada2017`

**e)** `cp -r /var/log/* /tmp/cursada2017`

**f)** `chown <username>:<usergroup> <archivo>`

**g)** `sudo chmod -R 723 <archivo>`

**i)** `tty`

**j)** `ps -e`

**k)** `w` o `who`

**l)** `write <usuario>`, a continuación se envía el mensaje y luego se finaliza ingreasando EOF o deteniendo con Ctrl + C

**m)** `sudo shutdown now`

## **(11) Indique qué comando sería necesario ejecutar para realizar cada una de las siguientes acciones:**

**a)** `mkdir <legajo>`

**b)** `vi LEAME`

**c)** `chmod 017`

**d)** `ls /etc > $HOME/leame`

**e)** Puede utilizarse find o locate. Find permite una búsqueda más personalizable, agregando parámetros. Locate efectúa una búsqueda más rápida.

**f)** `find -name *.so > $HOME/<legajo>/ejercicio_f`

## **(12)**

1. crea directorio iso/
2. ingresa al directorio iso/ y crea un archivo f0 con lo obtenido por ps
3. crea archivo f1 con lo obtenido por ls
4. se dirige al directorio root
5. imprime en pantalla el path a su HOME
6. lista archivos del directorio y los redirige a $HOME/iso/ls
7. se dirige al path de su home y crea el directorio f2
8. muestra la información de f2 de forma detallada, ignorando otros archivos (como los que posea dentro)
9. cambia los permisos de f2
10. crea archivo dir
11. se dirige a f2
12. se dirige a $HOME/iso
13. redirige la salida de pwd (ruta del directorio actual) al archivo f3
14. cuenta la cantidad de veces que aparece ps en el comando del mismo nombre y lo guarda en f3 asegurandose de no sobreescribir lo que haya
15. cambia los permisos de f2 y se dirige al directorio anterior
16. busca en el directorio actual archivos que tengan el nombre etc/passwd (debería usar `find . -path "*/etc/passwd"` para buscar archivos passwd en directorio etc/ que esté debajo de cualquier directorio del actual)
17. busca en directorio root archivos que tengan el nombre /etc/passwd
18. crea directorio ejercicio5
19. `cp -r iso/ <directorio_destino>`
20. `cp -r * <directorio_destino>`

## **(14)** Indique qué comando/s es necesario para realizar cada una de las acciones de la siguiente secuencia de pasos (considerando su orden de aparición):

**a)** `mkdir /tmp/logs`

**b)** `cp /var/log/* /tmp/logs`

**c)** `tar -cvf misLogs.tar /tmp/logs`

**d)** `tar -czvf misLogs.tar.gz /tmp/logs`

**e)** `cp misLogs.tar misLogs.tar.gz $HOME/`

**f)** `rm -r /tmp/logs`

**g)** `tar -xvf misLogs.tar -C /path1/ ; tar -xzvf misLogs.tar.gz -C /path2/`