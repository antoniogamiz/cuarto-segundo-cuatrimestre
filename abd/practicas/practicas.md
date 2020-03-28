# Administración de bases de datos


## Clase de antes

Apuntes Carmen

## Clase 04/03/2020

### Gestión de red

`Net` proporciona tres funciones ccbásicas:

- Operaciones de conexión
- Operaciones de transporte de datos
- Operaciones de excepción

Tiene que haber un `listener` levantado a nivel de sistema operativo. Una app que quiera conectarse contra la instancia, tiene que contactar en primer lugar con el `listener`. El `listener` levanta un proceso dedicado y a partir de ese momento la comunicación se redirige a ese proceso. 

Para configurar el `listener` usamos un fichero específico de parámetros, `listener.ora`. En las aplicaciones que se conectan también debería haber un fichero de configuración con los parámetros de uso o conexión a la base de datos. Lo básico para nosotros como sysadmins, es que el fichero `listener.ora` esté preparado.

### Fichero listener.ora

Cuando se inicia un listener mediante la utilidad (lnsrctl), éste crea automáticamente un fichero `listener.ora` configurado con los siguientes valores por defecto:

- Nombre listener: `LISTENER`
- Puerto: `1521`
- Protocolos: TCP/IP e IPC
- Nombre SID: BD por defecto
- Nombe Host: nombre del host por defecto

Un listener solo da servicio a una instancia de la base de datos.

### lsnrctl

La utilidad de control del listener es la herramienta para gestionar el listener. Se pueden ejecutar comandos de control desde la línea de comandos o desde el prompt de `lsnrctl`.

~~~bash
lsnrctl start
lsnrctl stop
~~~

El modificador `SET` se usa para cambiar parámetros del listener en el entorno del `lsnrctl`:

~~~bash
set trc_lavel ADMIN
~~~

`SHOW` para visualizar.

~~~bash
show trc_level ADMIN
~~~

El fichero `listener.ora` se puede configurar para más de un listener.

### Configuración de Net Básico del lado del cliente

- Establecer una conexión desde el lado del cliente de Net usando el método "host naming". Ese método no precisa configuración, aunque se deben satisfacer algunos requisitos. 

En el lado del cliente se establece en `sqlnet.ora`. En el servidor, en `listener.ora`. Conexión:

~~~bash
sqlplus system/ABD3oradba@pclab:1521/pclab.oradba
~~~

- Configurar los ficheros Net del lado del cliente y conectar usando el método de denominación local (local-naming). Precisa configuración usando la herramienta gráfica Net Manager.

Aquí usamos `sqlnet.ora` y `tsnames.ora` en el cliente y `listener.ora` en el servidor.

- Utilizar Net Manager para definir preferencias en el lado del cliente.

# Presentación 3

Cuando a Oracle le llega una petición SQL, ya que va a disco, se trae un bloque entero por eficiencia.

Si hay un update, primero se vuelca a memoria, y luego a disco. Si mientras ese volcado llega una petición que usa esas filas, se le devuelve de memoria. 

Los dos usuarios administradores de la base de datos son `sys` y `system`. Son creados automáticamente y son asignados al rol `SYSDBA`.

- `SYS`: propietario de los datos del diccionario de la BD.
- `SYSTEM`: propietario de tablas internas adicionales usadas por herramientas oracle.

### Fichero password

~~~bash
orapwd file=$ORACLE_HOME/dbs/orapworadba entries=5
~~~

Más variables importantes: `ORACLE_SID` (nombre de la base de datos), `ORACLE_BASE` (sitio donde empieza la instalación del software oracle).

Output de `ORACLE_BASE`: dos ultimos números la versión de oracle (`ORACLE_HOME`, lo de antes `ORABLE_BASE`. 
