## Preparación de las herramientas

Primeramente nos tenemos que descargar el archivo ISO [Ubuntu server 18.04](https://ubuntu.com/download/server). Una vez descargado el archivo, creamos dos máquinas virtuales a partir de él, llamadas `M1` y `M2`, y seguimos los pasos de la instalación:

![m1](./img/1.png)
![m2](./img/2.png)

![m1](./img/3.png)

Una vez instaladas las máquinas, procedemos a instalar el software necesario:

![m1](./img/4.png)

Comprobamos que `Apache` está funcionando correctamente:

![m1](./img/5.png)

E instalamos el resto de herramientas para `php`:

![m1](./img/11.png)

![m1](./img/12.png)

Añadimos el fichero web de ejemplo y usamos `curl` para ver si todo es correcto:

![m1](./img/6.png)
![m1](./img/7.png)

Por último, comprobamos que podemos conectarnos de una máquina a otra y viceversa:

![m1](./img/10.png)