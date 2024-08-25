# Trabajo Práctico 1

## **1. Características de GNU/Linux**

### (a) Mencione y explique las características más relevantes de GNU/Linux

GNU/Linux es un sistema operativo basado en Unix, gratuito y de libre distribución. Es de código abierto y posee diversas distribuciones.

Es un software libre, los cuales se caracterizan por:
- Posibilidad de ser usados, copiados, estudiados, modificados y redistribuidos
- Generalmente gratis (no es requisito excluyente)
- Común que se distribuya con su código fuente

Su principal cualidad es que no puede restringirse su libertad de uso

Posee otras características tales como:
- Es multitarea
- Es multiuso y multiprocesador
- Es altamente portable *(programa desarrollado en un sistema Unix-like puede ser recompilado y ejecutado sin problemas en otro)*
- Posee diversos intérpretes de comandos
- Permite manejo de usuarios y permisos
- Todo es un archivo *(incluso dispositivos)*
- Cada directorio puede estar en distintas particiones
- Es *case sensitive*
- Es código abierto

### (b) Mencione otros sistemas operativos y compárelos con GNU/Linux en cuanto a los puntos mencionados en el inciso *a*.

Los puntos mencionados que caracterizan GNU/Linux contrastan con otros SO como Windows. Analizando este último, queda en evidencia que no es un software libre ni cumple las 4 libertades que GNU pregona.
Windows se corresponde con un software propietario, los cuales:
- Generalmente tienen costo
- No se los puede distribuir libremente
- Generalmente no se permite su modificación
- Normalmente no se los distribuye con su código fuente
- La corrección de fallas queda a cargo del propietario

### (c) ¿Qué es **GNU**?

GNU es un proyecto iniciado por Richard Stallman con el fin de crear un sistema Unix que fuera libre.
El nombre GNU es una definición recursiva de GNU No Es Unix.
Se ampara bajo el marco regulatorio GPL *(General Public License)*, el cual declara que todo software publicado bajo este es libre y protegido teniendo en cuenta 4 libertades.

Las 4 libertades que GNU establece son:
- Libertad de usar el programa
- Libertad de estudiar su funcionamiento
- Libertad de distribuir sus copias
- Libertad de mejorar sus programas

### (d) Indique una breve historia sobre la evolución del proyecto GNU

En 1983, inicia el proyecto GNU por parte de Richard Stallman, el cual requeriría la creación del marco regulatorio GPL.
En 1985, Stallman crea la FSF *(Free Software Foundation)* para financiar el proyecto.
En 1990, GNU ya contaba con un editor de textos, un compilador y gran cantidad de bibliotecas. Faltaba un componente de vital importancia: el kernel.
Si bien se desarrollaron algunos como TRIX y GNU Hurd, estos no prosperaron.
En 1991, Linus Torvalds comenzó el desarrollo del kernel Linux. En 1992, se decide combinar con GNU para dar lugar a GNU/Linux, siendo una unión entre los productos, idea y marco regulatorio de GNU con el kernel de Linux.

### (e) Explique es es la multitarea, e indique si GNU/Linux hace uso de ella.

La multitarea es la característica algunos sistemas operativos que permite que varios procesos o aplicaciones se ejecuten aparentemente al mismo tiempo, compartiendo uno o más procesadores.
Estos SO son capaces de dar servicio a más de un proceso a la vez para permitir la ejecución de múltiples programas.
Esta noción de varios programas ejecutándose en simultáneo puede darse realmente en sistemas multiprocesador (se utilizan varios núcleos de la CPU al mismo tiempo) o aparentarla mediante el fraccionamiento de tiempo para que cada proceso ocupe la CPU durante unos instantes.

GNU/Linux es un sistema multitarea y multiprocesador, por lo que hace uso de esta cualidad.

### (f) ¿Qué es **POSIX**?

POSIX *(Portable Operating System Interface, y X de Unix)* es una norma de la IEEE que define una interfaz estándar del sistema operativo y el entorno, incluyendo un intérprete de comandos (shell) y programas de utilidades comunes para promover la portabilidad de las aplicaciones a nivel código fuente.

___

## **2. Distribuciones de GNU/Linux**

### (a) ¿Qué es una distribución de GNU/Linux? Nombre al menos 4 distribuciones de GNU/Linux y cite diferencias básicas entre ellas.

Una distribución de GNU/Linux es una colección organizada de software que incluye el kernel de Linux, junto con bibliotecas y herramientas del sistema, software adicional, escritorios gráficos y otros elementos. Todo esto conforma un paquete que denominados distribución.
Cada una tiene su propio enfoque y filosofía en cuanto a experiencia de usuario, estabilidad y seguridad.
Por lo tanto, su elemento en común es el kernel de Linux, mientras que sus demás elementos adicionales los diferencian.
Existen varias distribuciones, algunas de ellas son:
- Arch Linux
- Debian
- Fedora
- Linux Mint

Pueden nombrarse algunas diferencias principales entre distros:
1. Objetivo del usuario: algunas se enfocan en usuarios principiantes (ej.: Mint), mientras otras se diseñan para expertos y desarrolladores (ej.: Arch).
2. Entorno de escritorio: la GUI de cada distro Linux puede variar en cuanto a los entornos por defecto. Aun así, existen muchos entornos de escritorio que pueden utilizarse en varias distro por igual.
3. Gestión de paquetes: en cada distro puede variar la forma en la que los paquetes se instalan y administran. Por ejemplo, Dabian usa apt y Arch Linux usa pacman.
4. Lanzamientos y actualizaciones: algunas distros como Fedora reciben actualizaciones regulares, mientras otras como Debian tienen un enfoque de estabilidad y ciclos de lanzamiento más largos.

### (b) ¿En qué se diferencia una distribución de otra?

Las principales diferencias entre las distintas distribuciones fueron listadas en el punto anterior.

### (c) ¿Qué es Debian? Acceda al sitio e indique cuáles son los objetivos del proyecto y una breve cronología del mismo

El proyecto Debian es una asociación de personas las cuales han creado un sistema operativo libre de nombre *Debian*.
Los objetivos del proyecto son diversos. Principalmente, es el desarrollo y distribución de software libre. En él participan distintos actores con diferentes motivos, tales como aprender sobre el desarrollo de software, brindar software libre a la comunidad o investigar el comportamiento del mismo.
Debian comenzó en 1993 gracias a Ian Murdock, como una distribución que siguiera la línea de Linux y GNU en cuanto al software libre. Estaba pensado para ser creado, mantenido y soportado de forma cuidadosa y concienzuda.

___

## **3. Estructura de GNU/Linux**

### (a) Nombre cuales son los 3 componentes fundamentales de GNU/Linux.
Los 3 componentes fundamentales de GNU/Linux son:
- Kernel: el núcleo llamado Linux, encargado de administrar el hardware, tal como CPU, memoria y dispositivos E/S.
- File System: define la forma en la que se organizan los archivos del sistema
- Entorno de usuario: implica todas las herramientas aplicaciones y utilidades mediante los cuales el usuario se comunica con el sistema. La interacción del usaurio puede darse mediante una línea de comandos (CLI) o una interfaz gráfica (GUI) 

### (b) Mencione y explique la estructura básica del Sistema Operativo GNU/Linux.

La estructura básica de un SO es el kernel. Este ejecuta programas y gestiona dispositivos del hardware. Se encarga de que tanto hardware como software puedan operar juntos. Administra principalmente la CPU, memoria y dispositivos E/S.
En un sentido estricto, es el sistema operativo en si.
El kernel de Linux es un núcleo *monolítico híbrido*. 
Es monolítico porque todos sus componentes y funciones (gestión de procesos, administración de memeoria y control de dispositivos) se encuentran integrados en el mismo espacio de memoria.
Es híbrido porque incluye funcionalidad que no es propia de núcleos monolíticos, tales como la capacidad de cargar y descargar funcionalidades mediante módulos en tiempo de ejecución, dandole la modularidad y flexibilidad de núcleos microkernel. Permite que módulos y controladores intractúen sin que todo el código esté integrado en el núcleo principal.

___

## **4. Kernel**

### (a) ¿Qué es? Indique una breve reseña histórica acerca de la evolución del Kernel de GNU/Linux.

Se llama kernel al núcleo de un sistema operativo. Es la "porción de código" con menor nivel de abstracción del hardware, y se encarga de administrar el mismo.
En abril de 1991, mientras estudiaba ciencias de la computación en la Universidad de Helsinki, Linus Torvalds comenzó a trabajar en lo que se convertiría en el núcleo Linux. Ese mismo año desarrolló el kernel Linux y comenzó a distribuirlo bajo la licencia GPL. Varios programadores se unieron en su desarrollo y, en 1992, el kernel de Linux fue combinado con el sistema GNU para formar el SO libre GNU/Linux.

### (b) ¿Cuáles son sus funciones principales?

Como se ha explicado anteriormente, el kernel es la capa lógica más cercana al hardware. Por lo tanto, su principal función es la gestión de los dispositivos de este mediante la ejecución de procesos. Se encarga de que software y hardware puedan trabajar en sintonía. Administra principalmente CPU, memoria y dispositivos E/S.

### (c) ¿Cuál es la versión actual? ¿Como se definía el esquema de versionado del Kernel en versiones anteriores a la 2.4? ¿Qué cambio en el versionado se impuso a partir de la versión 2.6?

La versión actual estable del Kernel de Linux es la 6.10.6.
Antes de la versión 2.4, el versionado seguía el esquema **A.B.C**, donde:
- **A** representaba la versión principal del kernel.
- **B** representaba una versión secundaria. Antes de la 2.6, los números pares indicaban versión estable y los impares versiones de desarrollo.
- **C** representaba versiones de parche o revisiones

Luego pasaría a utilizarse el versionado **A.B.C.D**, donde:
- **A** es la versión principal
- **B** es la versión de mayor revisión
- **C** es la versión de menor revisión (utilizada cuando se introducen nuevos drivers o características)
- **D** indicaba la corrección de un error grave, sin agregar funcionalidad

### (d) ¿Es posible tener más de un Kernel de GNU/Linux instalado en la misma máquina?

Si, es posible tener más de un Kernel de GNU/Linux instalado en una misma máquina. Cada uno se instala de forma independiente en su propia ubicación del sistema de archivos asociado a su propia imagen.
Luego se utiliza un gestor de arranque (bootloader) para seleccionar el kernel que se quiere utilizar. El gestor de arranque más utiliza es GRUB (GRand Unified Bootloader). Este detecta los distintos kernel instalados y, a traves de una pantalla de selección, permite elegir uno de ellos.

### (e) ¿Dónde se encuentra ubicado dentro del File System?

El kernel es el encargado de administrar el sistema de archivos, por lo que no es parte de este como tal, pero se encuentra ubicado en el directorio `/boot`. Los archivos que representan el kernel (como `vmlinuz`) suelen encontrase en este directorio, junto con archivos de configuración. Aunque es un componente separado del File System, reside en él. Durante el arranque del sistema, se carga la imagen del kernel desde `/boot`y se lo transfiere a memoria principal. Luego el kernel inicia el proceso de arranque del sistema, montando el File System root (`/`).

### (f) ¿El Kernel de GNU/Linux es monolítico? Justifique.

En la actualidad el Kernel de GNU/Linux es monolítico híbrido.
Los controladores de dispositivos y las extensiones del núcleo normalmente se ejecutan en un espacio privilegiado, cualidad propia de los núcleos monolíticos. Sin embargo, a diferencia de los monolíticos tradicionales, los controladores de dispositivos y las extensiones al SO se pueden cargar y descargar fácilmente como módulos, mientras el sistema continúa funcionando. Además, los controladores pueden ser detenidos momentáneamente por actividades más importantes.
Esto permite manejar correctamente interrupciones por hardware. Son estas cualidades lo que lo hacen híbrido.

___

## **5. Intérprete de comandos (Shell)**

### (a) ¿Qué es?

El shell, o intérprete de comandos, es un programa que actúa como interfaz para comunicar al usuario con el SO mediante una ventana que espera comandos textuales ingresados por el usuario, los interpreta y entrega al SO para su ejecución. Se interactúa mediante texto, sin interfaz gráfica.

### (b) ¿Cuáles son sus funciones?

Como se mencionó anteriormente, la función del shell es proveer un medio de comunicación entre el usuario y el SO. Mediante comandos de texto específicos, el usuario envía órdenes que son interpretadas y ejecutadas por el sistema operativo. Es la forma más básica de comunicación.

### (c) Mencione al menos 3 intérpretes de comandos que posee GNU/Linux y compárelos entre ellos.

Los distintos intérpretes de comandos se diferencian entre sí por su sintaxis de comandos y la interacción con el usuario.
Dentro de GNU/Linux hay 3 principales familias de intérpretes de comandos:
- Korn-Shell (ksh): estándar SYSV, maneja historial de comandos. Basado en sh.
- Bourne-Shell (sh): disponible en todas las versiones Unix, es el más básico.
- C-Shell (csh): sintaxis similar al lenguaje C, basa su nombre en este.

### (d) ¿Dónde se ubican (path) los comandos propios y externos al Shell?

Cuando el shell recibe una orden lo primero que hace es verificar si está dentro de sus órdenes internas, luego mira el alias de comandos, y después busca el comando en cada ubicación indicada en la variable PATH.
Los comandos propios del sistema suelen estar en `/bin` (ej.: `ls`) o `/sbin` (ej.: `reboot`).
Comandos externos al shell, instalados por el usuario o paquetes suelen ubicarse en `/usr/bin` (`nano`, `git`) y `/usr/sbin`.
Otras rutas pueden ser `/usr/local/bin` y `/usr/local/sbin`.
Las rutas consultadas por el shell pueden ser consultadas con `echo $PATH`.

### (e) ¿Por qué considera que el Shell no es parte del Kernel de GNU/Linux?

El shell no forma parte del kernel básico del SO, sino que se comunica con el mismo. Es decir, el kernel es el componente más cercano al hardware, que lo administra. Por otro lado, el shell, que no pertenece al kernel, brinda una interfaz para la interacción entre este y el usuario. Recibe la orden del usuario y la interpreta a una forma en la que el kernel pueda ejecutarla.

### (f) ¿Es posible definir un intérprete de comandos distinto para cada usuario? ¿Desde dónde se define? ¿Cualquier usuario puede realizar dicha tarea?

El shell es iniciado por el proceso de "login". Cada usuario tiene asigando un shell, la cual se inicia cada vez que un usuario se loguea. 
El shell de cada usuario se encuentra definido en `/etc/passwd`. Cualquier usuario puede cambiar su shell por los permitidos por el sistema.
Solo el root puede modificar el shell de otros usuarios.

___

## **6. Sistema de Archivos (File System)**

### (a) ¿Qué es?

Es la forma en que dentro de un sistema de cómputo se organizan y administran los archivos. Esto comprende:
- Métodos de acceso (como se acceden los datos contenido en el archivo)
- Manejo de archivos (como actúan los mecanismos para almacenar, referenciar, compartir y proteger archivos)
- Manejo de memoria secundaria (Como se administra el espacio para los archivos en memoria secundaria)
- Mecanismos de integridad (con qué métodos se garantiza la incorruptibilidad del archivo)

Los File System más comunes utilizan dispositivos de almacenamiento que permiten acceso a los datos como una cadena de bloques de un mismo tamaño (sector, usualmente 512 bytes).
Generalmente un sistema de archivos tiene directorios que asocian nombres de archivos con archivos. La estructura de directorios puede ser plana o jerárquica ("en árbol").
En sistemas jerárquicos, se declara la ubicación precisa de un archivo con una cadena de texto llamada "ruta" (path), constituida por la sucesión de nombres de directorios desde la raíz hasta el archivo en cuestión. Se encuentran ordenas jerárquicamente separados por un carácter especial (`/`).

### (b) Mencione sistemas de archivos soportados por GNU/Linux

Los File System más utilizas hoy en dia en GNU/Linux:
- ext3 (third extended filesystem): sistema de archivos con registro por diario. Utiliza un árbol AVL como estructura.
- ext4
- ReiserFS: sistema de archivos de propósito general
- XFS: sistema de archivos de 64 bits

### (c) ¿Es posible visualizar particiones del tipo **FAT** y **NTFS** en GNU/Linux?

Si, es posible. GNU/Linux tiene soporte de estos mediante herramientas y controladores específicos. Las particiones FAT son compatibles de forma nativa con GNU/Linux. Las particiones NTFS pueden ser montadas utilizando el controlador `ntfs-3g`.
A través de comandos como `sudo fdisk -l`, `sudo blkid` y `lsblk` es posible visualizar las particiones y, en algunas, crear y eliminarlas.

### (d) ¿Cuál es la estructura básica de los File System en GNU/Linux? Mencione los directorios más importantes e indique que tipo de información se encuentra en ellos. ¿A qué hace referencia la sigla **FHS**?

La estructura básica de los File System de GNU/Linux es jerárquica, estructurada en ramas o como árbol. El directorio principal `/` (root directory) es la raíz y punto de partida del sistema de archivos.
Bajo este se encuentran otros directorios importantes tales como:
- `/bin`: residen los binarios o ejecutables, programas esenciales del sistema
- `/dev`: controladores del dispositivo, para acceder a los dispositivos del sistema (ej.: memoria secundaria)
- `/etc`: contiene archivos de configuración del sistema
- `/sbin`: contiene programas esenciales del sistema que utilizará el administrador
- `/home`: contiene directorios home de los usuarios (como archivos personales)
- `lib`: contiene imágenes de librerias compartidas (código que comparten muchos programas)
- `/proc`: sistema de ficheros virtual. Hace referencia a procesos que corren en el sistema
- `/root`: directorio del superusuario
- `/tmp`: ficheros temporales generados por programas
- `/usr`: contiene subdirectorios con múltiples archivos, como programas útiles y archivos de configuración
- `/var`: contiene directorios que cambian de tamaño con frecuencia

En el momento de la instalación, GNU/Linux crea esta estructura de directorios básica, definida por la Filesystem Hierarchy Standard Group llamada Filesystem Hierarchy Standard (FHS). FHS define los directorios principales y sus contenidos. Se diseñó para estandarizar el sistema de archivos de las distribuciones GNU/Linux.
