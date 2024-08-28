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

___

## **7. Particiones**

### (a) Definición. Tipos de particiones. Ventajas y desventajas.

Una partición en un disco es una división lógica del espacio de almacenamiento físico. Permite organizar y administrar los datos y programas del disco. Cada partición tiene su propio sistema de archivos y es tratado como un dispositivo de almacenamiento separado.
Los tipos de particiones son:
- Partición primaria: división básica del disco. Puede contener un SO. Su información se almacena en el MBR
- Partición extendida: sirve para contener unidades lógicas en su interior. No se define un FS (File System) explícitamente sobre ella.
- Partición lógica: ocupa totalidad o parte de la extendida y se le define un FS

A su vez, según su función, se pueden tener particiones de arranque (boot), de datos y de intercambio (swap).

Entre sus ventajas se pueden mencionar la organización, facilidad para crear copias de seguridad, tener múltiples FS, facilidad para instalar múltiples SO, entre otros.
Los inconvenientes pueden estar dados por la reducción del almacenamiento (muchas particiones pueden generar insuficiencia de espacio en cada una), pérdida de datos (aunque estén dividadas lógicamente, pertenecen al mismo disco físico) y dificultad en el manejo de particiones para principiantes.

### (b) ¿Cómo se identifican las particiones en GNU/Linux? (Considere discos IDE, SCSI y SATA).

En GNU/Linux, todo se considera un archivo. Los dispositivos externos están identificados con el directorio `/dev/`, incluyendo en ese grupo a los dispositivos de almacenamiento secundario.
Las particiones se identifican mediante nombres según el tipo de controlador y posición del dispositivo en el sistema.
Los discos IDE se identifican con el prefijo `hd`. `hda` indica el primer disco, mientras `hdb` el segundo. Por otro lado, las particiones se indican con un número. `hda1` es la primer partición del primer disco IDE.
Tanto los discos SCSI como SATA se identifican con `sd`. Siguiendo la misma lógica que los IDE, la letra corresponde al número de disco y el valor numérico a la partición. `sda1` indicaría la primer partición del primer disco.

### (c) ¿Cuántas particiones son necesarias como mínimo para instalar GNU/Linux? Nómbrelas indicando tipo de partición, identificación, tipo de File System y punto de montaje.

Para instalar GNU/Linux, es necesario como mínimo la partición primaria `/` (root directory), aunque es recomendable tener otras dos: `boot` (arranque) y `swap` (intercambio).
- `/`: partición primaria. Suele usarse ext4 como FS (también puede ser ext3, ext2, btrfs, xfs). Su punto es montaje es `/`(root).
- `swap`: puede ser primaria o lógica. No tiene FS como tal, es un tipo especial de partición. No tiene punto de montaje convencional, se utiliza como área de intercambio.
- `boot`: primaria o lógica. Suele utilizar ext4 como FS. Su punto de montaje es `/boot`.

### (d) Ejemplifique diversos casos de particionamiento dependiendo del tipo de tarea que se deba realizar en su SO.

Para un usuario común, le bastaría con tener las dos particiones mínimas recomendadas (`/` y `swap`).
Si se quisiera, también se podría particionar el sector de arranque y los archivos personales, dejando las siguientes particiones: `/`, `swap`, `/boot` y `/home`.
Para un servidor web, podrían requerirse otras particiones, tales como: `/`, `/boot`, `swap`, `/home` (archivos de configuración y datos del usuario) y `/var` (archivos de logs y contenido web).
Para un sistema que será utilizado por múltiples usuarios, podría ser necesario: `/`, `swap`, `/boot`, `/home` (datos de los usuarios), `/tmp` (archivos temporales).

La cantidad y tipo de particiones dependerá del uso del sistema y el conocimiento del/los usuario/s.

### (e) ¿Qué tipo de software para particionar existe? Menciónelos y compare.

Existen múltiples softwares para particionar discos. Se dividen principalmente en destructivos y no destructivos.
- Destructivos: permiten crear y eliminar particiones (ej.: **fdisk**).
- No destructivos: permiten crear, eliminar y modificar particiones (ej.: **fips**, **gparted**).

___

## **8. Arranque (bootstrap) de un Sistema Operativo**

### (a) ¿Qué es el **BIOS**? ¿Qué tarea realiza?

BIOS es acrónimo de Basic Input/Output System. Se trata de un software integrado en un chip de la placa base que ejecuta una serie de procesos para gestionar el arranque del computador, activar servicios esenciales, gestionar ciertas funciones y comprobar el hardware (que funcione correctamente). Verifica que se cumplan los estándares mínimos para gestionar el arranque y delegar el control al sistema operativo.

### (b) ¿Qué es UEFI? ¿Cuál es su función?

UEFI (Unified Extensible Firmware Interface) es un estándar de interfaz de firmware que actúa como intermediario entre el hardware y el sistema operativo. Es el sucesor del BIOS.
- Posee una interfaz gráfica más intuitiva 
- Soporta mayor cantidad de particiones utilizando el esquema GPT (GUID Partition Table), ampliando el límite de 4 particiones primarias que permitía el MBR.
- Permite un arranque más seguro debido a Secure Boot, que valida la firma digital de un sistema operativo antes de cargarlo
- Almacena datos de arranque en la partición EFI

Reemplaza al BIOS en sus tareas como gestión del proceso de arranque, configuración del sistema y protección del sistema.

### (c) ¿Qué es el MBR? ¿Que es el MBC?

Se llama MBR (Master Boot Record) al sector reservado del disco (cilindro 0, cabeza 0, sector 1) de tamaño 512 bytes.
Se encarga del proceso de arranque y gestiona las particiones de los discos. Los primeros 446 corresponden al MBC (Master Boot Code), seguido de 64 bytes con la tabla de particiones (admite hasta 4 primarias o 3 primarias y una extendida). Los últimos 2 bytes contienen la firma del MBR.

El MBC es una parte del MBR, siendo el código de arranque encargado de cargar el SO. El BIOS lee el MBC, lo lleva a memoria y lo ejecuta. Puede darse la carga del SO o un gestor de arranque.
El MBC verifica la tabla de particiones para identificar la partición de arranque, carga su sector de arranque (Partition Boot Sector) y se tranfiere el control al código de arranque de la partición booteable para iniciar el SO

Actualmente está siendo reemplazado por UEFI con el esquema de particiones GPT, debido a las limitantes del esquema MBR.

### (d) ¿A qué hacen referencia las siglas GPT? ¿Qué sustituye? Indique cuál es su formato.

GPT hace referencia a GUID Partition Table. Se sustituye la tabla de particiones de 64 bytes del MBR, para superar sus limitaciones en cuanto a cantidad de particiones. Utiliza modo de direccionamiento lógico LBA (Logical Block Adressing) en lugar de Cylinder-Header-Sector. La cabecera de GPT se encuentra en LBA1, haciendo de nexo con la tabla de particiones que se encuentra en los sectores adyacentes. Se encuentra al principio y final del disco por redundancia.

### (e) ¿Cuál es la funcionalidad de un “Gestor de Arranque”? ¿Qué tipos existen? ¿Dónde se instalan? Cite gestores de arranque conocidos.

La finalidad de un gestor de arranque es la de cargar la imagen del kernel seleccionado en memoria. Permite gestionar el arranque de los kernel que se tengan en las distintas particiones del disco. Se ejecuta luego del código del BIOS.
Existen dos modos de instalación:
- En el MBR (puede utilizar MBR gap (espacio de sectores adyacentes)).
- En el sector de arranque de la partición raíz o activa (Volume Boot Record).

El BIOS y UEFI también actúan como gestores de arranque. Los gestores de arranque pueden ser del tipo MBR o UEFI.

Algunos gestores de arranque conocidos son: GRUB, LILO, GAG.

### (f) ¿Cuáles son los pasos que se suceden desde que se prende una computadora hasta que el Sistema Operativo es cargado (proceso de bootstrap)?

El bootstrap es el proceso de inicio de una máquina y carga del sistema operativo. En sistemas con BIOS, este es el encargado de iniciar la carga del sistema operativo a través del MBC. 
Primero el BIOS (o UEFI) verifica el correcto funcionamiento del hardware (proceso POST). Luego, se busca el dispositivo de arranque primario. En sistemas basados en BIOS, se carga el programa de booteo desde el MBR. El gestor de arranque lanzado desde el MBC carga el Kernel, pasando luego el control al proceso init que inicia servicios esenciales y la interfaz de usuario.
Este proceso de arranque se ve como una serie de pequeños programas de ejecución encadenada. El proceso de arranque basado en BIOS tiene como última acción leer el MBC del MBR.

### (g) Analice el proceso de arranque en GNU/Linux y describa sus principales pasos.

Los pasos del proceso de arranque fueron mencionados en el inciso anterior. En resumen, estos son:
- Inicialización del BIOS/UEFI: se realiza el Power-On Self Test (POST) para verificar el hardware. Luego se busca y carga el gestor de arranque desde el sector de arranque (MBR o GPT).
- Carga del bootloader: el gestor de arranque más común en GNU/Linux es GRUB. Este permite elegir el kernel a cargar.
- Carga del Kernel de Linux: se carga el kernel en memoria y comienza a ejecutrase. Se inicializan controladores y se monta el Root File System.
- Inicialización del sistema: proceso gestionado por `systemd`. Arranca y gestiona los servicios del sistema.
- Montaje del sistema de archivos e inicio de servicios.
- Inicio del entorno de usuario: se carga la GUI o CUI del sistema.
- Sesión de usuario: se cargan configuraciones específicas del usuario.

### (h) ¿Cuáles son los pasos que se suceden en el proceso de parada (shutdown) de GNU/Linux?

Se compone de una serie de pasos:
- Inicio del proceso de apagado: se envía señal al sistema para comenzar proceso de apagado (generalmente mediante comando)
- Bloqueo de nuevas conexiones y procesos: se impide la ejecución de nuevas tareas
- Detención de servicios: `systemd` comienza a detener los servicios en ejecución en orden inverso al que se iniciaron. Se liberan recursos y los servicios de detienen de forma controlada.
- Desmontaje del File System: se desmontan sistemas de archivos excepto el sistema raíz. Los datos se sincronizan para evitar pérdidas.
- Sincronización de buffers y cierre del sistema de archivos raíz: se escriben los datos pendientes de los buffes y se desmonta el sistema raíz, finalizando acceso al almacenamiento.
- Apagado del hardware: una vez desmontado el FS y detenidos los servicios, se envía señal para apagar alimentación de la máquina.

## (i) ¿Es posible tener en una PC GNU/Linux y otro Sistema Operativo instalado? Justifique.

Si, es posible. En base a todo lo explicado anteriormente, es posible particionar el disco de forma que se almacenen dos SO distintos en diferentes particiones. Cuando inicia el proceso de arranque, pasando la etapa POST y la carga del gestor por parte del BIOS/UEFI, se da paso al bootloader (típicamente GRUB). Allí se permite seleccionar el kernel, para que este sea cargado en memoria y comienzo su proceso de inicialización anteriormente descrito.

___

## **9. Archivos**

### (a) ¿Cómo se identifican los archivos en GNU/Linux?

En GNU/Linux, los archivos se identifican mediante su nombre y ubicación en el FS. Hay varios conceptos relevantes sobre los mismos:
- Ruta del archivo (absoluta o relativa)
- Identificación mediante comandos (`ls` lista archivos y directorios, `file` indica el tipo, `stat` brinda información detallada)
- Inodos (identificadores que describen a los archivos)

### (b) Investigue el funcionamiento de los editores **vi** y **mcedit**, y los comandos **cat** y **more**.

**Vi** es un editor de texto desarrollado para sistemas Unix. Posee interfaz visual y capacidad de mostrar la visualización completa del texto en pantalla. No posee herramientas visuales para anticipar apariencia impresa ni funciones avanzadas de formateo, pero es versatil en la manipulación de texto. Una de sus versiones mejoradas es **Vim**.

**Mcedit** es el editor de archivos interno de GNU Midnight Commander (siendo este un gestor de ficheros para sistemas Unix, un shell con interfaz completa en modo texto).

`cat` es abreviatura de concatenar, el comando es utilizado para manipular archivo. Es útil para combinar archivos, crear nuevos o mostrar el contenido de archivos existentes. Posee múltiples parámetros y opciones para realizar las funciones antes descritas.
`more` es un comando que permite mostrar el resultado de la ejecución de un comando en la terminal de forma paginada. Permite visualizar la información de a páginas y se combina con múltiples comandos para lograr esta visualización.

### (c) Cree un archivo llamado “prueba.exe” en su directorio personal usando el vi. El mismo debe contener su número de alumno y su nombre.

El editor de texto se abre con `vi <nombre archivo>` para abrir un archivo existente o crearlo. Presionando "i" dentro del editor se ingresa al modo inserción.
Finalmente, presionando ":" se ingresa al modo final de línea, donde "w" permite escribir los cambios y "q" salir.

### (d) Investigue el funcionamiento del comando file. Pruébelo con diferentes archivos. ¿Qué diferencia nota?

El comando `file <fichero>` muestra el tipo de un fichero.
Diferencia entre distintos tipos y directorios. Para algunos revela más información (se probó con archivo ".gpg" y brinda información sobre su certificación y fecha de creación).

___

## **10. Indique qué comando es necesario utilizar para realizar cada una de las siguientes acciones. Investigue su funcionamiento y parámetros más importantes.**

### (a, b) Cree carpeta ISO2024 y acceda

`mkdir` crea un directorio.
`cd <path>` permite acceder a un directorio en el path especificado.

### (c, d, e, f) Cree dos archivos iso2024-1 e iso2024-2, liste contenido del directorio, visualice la ruta y busque archivos que contengan cadena "iso*"

`touch <nombre_archivo>` para crear archivo.
`ls <path>` para listar archivos en la ruta especificada (sin path lista en el directorio actual).
`pwd` muestra ruta en la que se está situado.
`find <directory_path> <search_parameter>` permite buscar archivos. `<directory_path>` puede ser la ruta del directorio o un "." para buscar en el directorio actual. `<search_parameter>` puede ser un nombre (`-name`), tipo (`-type`), tamaño (`-size`), etc. Si no se quiere buscar nombre exacto, sino coincidencia con una cadena se utiliza `find <directory_path> -name "<string>*"`. Pueden utilizarse otros parámetros para modificar la búsqueda o visualización de resultados en terminal.

### (g, h, i, j) Informar espacio libre en disco, verificar usuarios conectados al sistema, ingresar Nombre y Apellido en archivo iso2024-1, mostrar en pantalla últimas lineas de un archivo.

`df` muestra información sobre particiones montadas
`who` muestra información de los usuarios conectados al sistema
`tail <archivo>` muestra las últimas lineas de un archivo (10 por defecto).

___

## **(11, 12). Investigue su funcionamiento y parámetros más importantes. Indique en que directorios se almacenan los comandos mencionados.**

- `shutdown`
Apaga la máquina. `shutdown [OPTIONS] [TIME] [MESSAGE]` donde `[OPTIONS]` puede ser halt, power-off o reboot. `[TIME]` indica cuando se hará (ej.: now) y `[MESSAGE]` indica el mensaje a mostrar.
Ubicado en `/usr/sbin/shutdown`.
- `reboot`
Reinicia la máquina. `reboot [OPTIONS]`, donde `[OPTIONS]` permite controlar cuestiones del comando (ej.: --force fuerza el reinicio).
Ubicado en `/usr/sbin/reboot`.
- `halt`
Detiene el sistema. `halt [OPTIONS]`
Ubicado en `/usr/sbin/halt`.
- `locate`
Busca en el FS por ficheros y directorios cuyo nombre coincida con un patrón dado. `locate [OPTION] PATTERN`
Ubicado en `/usr/bin/locate`.
- `uname`
Imprime información del sistema. `uname [OPTION]` permite elegir toda la información(-a), nombre del kernel (-s), etc.
Ubicado en `/usr/bin/uname`.
- `dmesg`
Imprime el buffer de mensajes del kernel, generados durante el arranque del sistema y depuración de aplicaciones. `dmesg [OPTIONS]`.
Ubicado en `/usr/bin/dmesg`.
- `lspci`
Lista todos los dispositivos PCI (periféricos). `lspci [OPTIONS]` (principalmente modos para mostrar la información en pantalla).
Ubicado en `/usr/bin/lspci`.
- `at`
Permite programar comandos para que sea ejecutados en una fecha y hora especificada. `at [time] [date/day]`.
Ubicado en `/usr/bin/at`.
- `netstat`
Muestra información relacionada con la red y diagnostica errores de la misma. `netstat [OPTIONS]`.
Ubicado en `/usr/bin/netstat`.
- `mount`
Monta un filesystem. Tiene varias formas (parámetros):
    - `mount` muestra los dispositivos montados
    - `mount -a [OPTIONS]` realiza una operación con todos los elementos mencionados
    - `mount [OPTIONS] <source> <directory>`

    Ubicado en `/usr/bin/mount`.
- `head`
Muestra la primera parte (10 lineas) de un fichero. `head [OPTION]... [FILE]...`.
Ubicado en `/usr/bin/head`
- `losetup`
Setea y controla loop devices (dispositivo virtual que permite que se acceda a un fichero como un dispositivo de bloques (ej.: disco duro)).
Asocia loop devices con archivos regulares o dispositivos de bloques. Los loop devices se suelen utilizar para almacenar imágenes ISO de discos. Montar un archivo que contiene un FS en un loop device hace que se pueda acceder a los archivos del sistema de ficheros.
`losetup [OPTIONS] [<loopdev>]`.
Ubicado en `/usr/sbin/losetup`.
- `write`
Envía un mensaje a otro usuario. Permite comunicarse con otros usuarios, copiando líneas de su terminal a la de ellos.
`write [OPTIONS] <user> [<ttyname>]` (ttyname terminal del usuario receptor).
Ubicado en `/usr/bin/write`.
- `mkfs`
Crea un filesystem Linux en un dispositivo, usualmente una partición.
`mkfs [OPTIONS] [-t type] [fs-options] device [size]`, siendo `device` el nombre del dispositivo, `size` el número de bloques que usará el filesystem, `-t` indica el tipo de filesystem a construir, `fs-options` comprende las opciones del filesystem específico que se pasarán al constructor del FS.
Ubicado en `/usr/sbin/mkfs`.
- `fdisk`
Permite manipular la tabla de particiones de disco (crear y eliminar particiones, es destructivo).
`fdisk [OPTIONS] device`.
Ubicado en `/usr/sbin/fdisk`.

___

`which <command>` permite ver la ruta donde se almacena el comando.