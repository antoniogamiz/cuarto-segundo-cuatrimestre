## Clase 20/02/2020

- Diapositiva ASF: Reorganización de fichero

No hace falta considerar el tiempo de escritura necesario para marcar un registro como borrado porque reordenar un fichero significa abrir **OTRO** fichero nuevo.

- Diapositiva ASL: insercion de un registro

El `[+T_w]` es para escribir el registro en el hueco abierto. Los corchetes es para diferenciarlo de los otros.

- Siguiente a la anterior:

Si hay que insertar más de uno, se meten directamente en la zona desordenada. La de abajo que aparece dice el profe que no le prestemos mucha atención que es difícil de entender.

Hay un `T_A` que se ha colado en una de las anteriores, es `T_U`.

## Clase 27/02/2020

- Archivo secuencial indexado:

Tiene dos partes, una se conoce como maestro, contiene los registres, la otra (el índice) contiene los índices, contiene parejas, parte del registro (el valor de la clave) y la localización del registro a donde apunta. Este tipo se llama indice denso.

El problema viene cuando no estamos buscando por valor de indice. En el fichero maestro el unico orden que se mantiene es el secuencial. 

Cuantos más indices, peor es esta solucion.

En lugar de almacenar la posicion en disco del registro, almacenamos la posicion de un bloque, tenemos un indice no denso. Luego todos los registros no tienen indice, solo algunos.

La forma mas comun de representar un indice es un arbol binario balanceado con estructura de APO, para buscarlos rapido. Si al AVL ademas le ponemos una restriccion consistente en que todos los niveles esten llenos excepto el ultimo de iquierda a derecha, entonces ese avl se puede guardar facilmente en disco.

¿Como construimos un indice?

Guardamos los registros de forma ordenada en el maestro (en el primer bloque)y cada vez que añadamos un registro al maestro, creamos su indice, creando un ASL ordenados por valores de clave.

El problema viene cuando los registros superan el tamaño de un bloque. A partir de ahi los bloques dejan de estar ordenados luego tenemos que volver a trabajar con el indice como anteriormente.

Otra forma: (...)

- ASI denso

Cada vez que tenemos una PRIMARY KEY se crea un indice para ese campo del registro. Lo normal en los volcados masivos es desactivar el indice, insertarlos, y kuego activar el indice, para construirlo solo una vez, para no tener que construir el indice en cada insercion.

- ASI denso: espacio de un registro

es un registro de longitud fija. A cada registro se le suma ademas un V_k y una P, el tamaño de la clave y el puntero al registro.

- ASI denso: recuperacion de un registro

log*T es la busqueda del indice, y T es la lectura del registro especifico.

- Siguiente registro:

primer T, leer el siguiente registro del indici, y el otro T leer el registro especificamente.

- Insercicion

Si el fichero maestro no tiene area de desbordamiento, es un ASL. Como no hemos completado el primer bloque del maestro, tenemos que desplazarlos todos para meter el nuevo.

encontrar la posicion donde hay que insertarlo +
leer la mitad de los elementos y volver a escribirlos. El ultimo t_w es la insercioni del registro en cuestion.

El maestro y el indice son ASL porque todavia no se ha completado el primer bloque, luego los dos tiempos son iguales. El tiempo total entonces es el doble.

Si tiene area de desbordamiento, a partir del primer bloque todo lo demas se escribe secuencialmente.

En el secuencial el tiempo de insercion coincide con el tiempo de escirtura. El indice sigue siendo ASL, luego leer la mitad, escribir la mitad escribir el registro.

- actualizar

si no se cambia el valor de la clave, siemplemente hay que encontrarlo y actualizarlo.

Si se cambia el valor de la claves, tenemos que buscarlo y borrarlo del fichero maestro y del indice, y luego hay que añadirlo correctamente en el maestro y en el indice.

- lectura de fichero

si lele por el indice prinicpal, si estoy leyendo el indice, si no hay zona de desbordamiento, entonces hay que leerlos secuencialmente en el maestro.

si es un indice secundario, el maestro no esta ordenado por ese indice, pero el indice secundario si, luego lo leemos secuencialmente. Lo leemos dos vece sporque leemos el indice y el registor del maestro.

Si es un indice secundario y hay zonas de desbordamineto, como es secundario el maestro no esta ordenado por ese indice, n numero de registros ordenaods, O numero de registros no ordenados. El indice tiene un tamaño n+O, hay que leerlos todos.

lo que tardo en recorrer el indice completo + leer la parte ordenada + leer la parte desordenada

- Reorganizacion del fichero

d son los borrados.

ordenar la parte desordenada (T_C*O)+
mergear los ordenados con la parte desordenada que ha sido ordenada (n+O)T
escribir los registros resultantes, es decir, los de antes n+O menos los borrados (los del indice y los del maestro)

- ASI no denso: entradas d eindice

un indice por bloque, es decir, numero de registros entre el factor de bloqueo.

- ASI multinivel

El indice sobre el indice tiene que ser no denso, hacer un indice denso de un indice denso es una tonteria.


la V + P es el tamño del registro del indice, es decir, el valor de la clave y el puntero. el tamaño es el mismo para cualquier otro indice que se construya a partir de ese. 

- el indice de nivel 1 puede ser denso o no denso, da igual.

- ASI multinivel: espacio de un registro

r = P + SUM V_i

cada registro tiene que tener una referencia a su zona de desbordamiento, ya que interamos no modificar el indice en la medida de lo posible. Luego un registro ocupa todo el tamaño de sus valores mas el puntero a su zona de desbordamiento o cubeta.

- i_k es el numero de ENTRADAS del bloque k.

- espacio necesario para indices:

los bloques de cada indice por el tamño de un bloque.

- espacio medio necesario por registro

el tamaño de los valores del registro (con el puntero a la zona de despordamiento) +
su parte proporcional de su zona de desbordamiento +
su parte correspondiente (proporcional) del indice


ASI MULTINIVEL

- recuperacion de registro

primera formula

T_M = T, es por notacion, e sla lectura del registor del maestro.
m-1 niveles que no estan pegados al maestor y el T_f prima la busqueda en el que esta pegadao al maestro.

en algunas situaciones, segunda formula:

si hay desbordamiento, hay que sumar ese tiempo de busqueda.

- siguiente registro:

cada registro esta enlazado con el siguiente, asi que lo mismo que leerlo.

- insercion

de forma ordenada:
encontrar donde vamos a insertarlo,
la mitad del bloque hay que desplazarlo hacia la derecha,
escribirlo.

si no queda espacio en el bloque:

lo mismo que antes pero el ULTIMO elemento del bloque, que esta lleno, hay que pasarlo al siguiente. y actualizar ese indice.

se tiene que insertar fichero de desbordamiento: hay que encontrarlo, escribirlo y actualiar el indice.

- actualizar registro

encontrarlo y actualizarlo

si cambia, encontrarlo marcarlo invalido e insertarlo.

- lectura exhaustiva de ficheros

lo que se tarda en leerlo de forma ordenada, como tiene desbordamiento, (n+O)T.

- reorganizacion de fichero

leerlo entero, escribir los que quedan sin borrar, y reconstruir todos los indices, k*I. Los leemos ordenados. EL I hay que recalcularlo!! porque los indices son nuevos. k es el numero de indices.
