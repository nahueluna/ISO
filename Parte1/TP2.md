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