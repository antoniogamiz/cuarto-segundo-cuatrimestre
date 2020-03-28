## Router Malaga
|     | Destino  | Máscara       | Siguiente |
| --- | ---      | ---           | ---       |
|     | 10.0.0.0 | 255.255.255.0 | -         |
|     | 30.0.0.0 | 255.255.255.0 | -         |
|     | 20.0.0.0 | 255.255.255.0 | 30.0.0.1  |
|     | 40.0.0.0 | 255.255.255.0 | 30.0.0.1  |
|     | 50.0.0.0 | 255.255.255.0 | 30.0.0.1  |
|     | 60.0.0.0 | 255.255.255.0 | 10.0.0.1  |

## Router Almería
|     | Destino  | Máscara       | Siguiente |
| --- | ---      | ---           | ---       |
|     | 40.0.0.0 | 255.255.255.0 | -         |
|     | 50.0.0.0 | 255.255.255.0 | -         |
|     | 10.0.0.0 | 255.255.255.0 | 40.0.0.1  |
|     | 20.0.0.0 | 255.255.255.0 | 40.0.0.1  |
|     | 30.0.0.0 | 255.255.255.0 | 40.0.0.1  |
|     | 60.0.0.0 | 255.255.255.0 | 50.0.0.2  |

## Router Jaen
|     | Destino  | Máscara       | Siguiente |
| --- | ---      | ---           | ---       |
|     | 50.0.0.0 | 255.255.255.0 | -         |
|     | 60.0.0.0 | 255.255.255.0 | -         |
|     | 10.0.0.0 | 255.255.255.0 | 60.0.0.2  |
|     | 20.0.0.0 | 255.255.255.0 | 60.0.0.2  |
|     | 30.0.0.0 | 255.255.255.0 | 50.0.0.1  |
|     | 40.0.0.0 | 255.255.255.0 | 50.0.0.1  |

# Ejemplo 2

Primero necesitamos copiar en el grafo el peso o el valor de la métrica:

R1-R2: 895
R1-R3: 380
R2-R3: 450
R3-R4: 205
R2-R4: 545

## Router R1
| Destino | Siguiente | Metrica (C) |
| ---     | ---       | ---         |
| R2      | R3        | 830         |
| R3      | R3        | 380         |
| R4      | R3        | 585         |

## Router R2
| Destino | Siguiente | Metrica (C) |
| ---     | ---       | ---         |
| R1      | R3        | 830         |
| R3      | R3        | 450         |
| R4      | R4        | 545         |

## Router R3
| Destino | Siguiente | Metrica (C) |
| ---     | ---       | ---         |
| R1      | R1        | 380         |
| R2      | R2        | 450         |
| R4      | R4        | 205         |

## Router R4
| Destino | Siguiente | Metrica (C) |
| ---     | ---       | ---         |
| R1      | R3        | 585         |
| R2      | R2        | 545         |
| R3      | R3        | 205         |

## Ejercicio Tipos de enrutamiento:

- Dinámico
- Dinámico
- Estático
- Estático
- Dinámico
- Ambos son escalables, pero depende de la paciencia. Luego dinámico.
- Estático
- Estático
- Dinámico
- Dinámico

## Ejercicio (subnetting y enrutamiento)

Primero tenemos que saber cuantas direcciones IPs tenemos disponibles, con la red que nos dan y su máscara. Como nos dan la red `150.214.192.0/18`, nos quedan 12 bits para hosts. Todos comparten la parte `150.214.1100000.0` (hasta el `11` del final).

¿Cuántos equipos tenemos que direccionar dentro de la red? Tenemos que disponer dentro de cada subred de `124+2=126` direcciones posibles. Para cubrirlo, necesitamos 7 bits, es decir, máscara 25. Siempre que podamos, ajustamos la máscara al último octeto, por eso, aunque no nos haga falta, cogemos máscara 24 y así podemos usar el octeto entero para direccionamiento de equipos.

SR1: 150.214.11000000.0/24 -> 150.214.192.0/24
SR2: 150.214.11000001.0/24 -> 150.214.193.0/24
SR3: 150.214.11000010.0/24 -> 150.214.194.0/24
SR4: 150.214.11000011.0/24 -> 150.214.195.0/24

Ahora le asignamos IPs a los equipos en cada subred, primero a los routers y luego a los hosts (mirar dibujo).

Vayamos al apartado (b):

Hay que considerar la entrada por defecto como la salida hacia internet.

### R2:

| Destino          | Siguiente     |
| ---              | ---           |
| 150.214.193.0/24 | *             |
| 150.214.194.0/24 | *             |
| 150.214.195.0/24 | *             |
| 150.214.192.0/24 | 150.214.193.1 |
| default          | 150.214.193.1 |

Lo anterior es correcto, pero como nos dicen que hay que hacer la tabla lo más pequeña posible, tenemos que agrupar las entradas con la misma salida, es decir, quitamos la penúltima. Quedando:

| Destino          | Siguiente     |
| ---              | ---           |
| 150.214.193.0/24 | *             |
| 150.214.194.0/24 | *             |
| 150.214.195.0/24 | *             |
| default          | 150.214.193.1 |

### RA

| Destino          | Siguiente     |
| ---              | ---           |
| 10.0.1.0/24      | GW-ISP        |
| default          | GW-ISP        |
| 150.214.193.0/24 | 150.214.192.2 |
| 150.214.194.0/24 | 150.214.192.2 |
| 150.214.195.0/24 | 150.214.192.2 |

Para agrupar las 3 últimas filas que aparecen podemos agrandar la máscara hasta el último bit que coincida en las IPs que aparecen en `Destino`, es decir, máscara 22.

### RA

| Destino          | Siguiente     |
| ---              | ---           |
| 10.0.1.0/24      | GW-ISP        |
| default          | GW-ISP        |
| 150.214.192.0/22 | 150.214.192.2 |

### RA

| Destino          | Siguiente     |
| ---              | ---           |
| 150.214.192.0/24 | *             |
| default          | 150.214.192.0 |

