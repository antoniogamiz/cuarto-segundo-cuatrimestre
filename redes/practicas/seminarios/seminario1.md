# Internet Protocol (IP)

Dirección lógica de un dispositvo en una red, formada por 4 octetos.

| Class | First Octect Range | Valid Network Numbers      | Total number of this class of network | Number of hosts per network | Private directions             |
| ----- | ------------------ | -------------------------- | ------------------------------------- | --------------------------- | ------------------------------ |
| A     | 1 to 126           | 1.0.0. to 126.0.0.0        | 2^7-2                                 | 2^24-2                      | 10.0.0.0 to 10.255.255.255     |
| B     | 128 to 191         | 128.1.0.0 to 191.254.0     | 2^14-2                                | 2^16-2                      | 172.16.0.0 to 172.31.255.255   |
| C     | 192 to 223         | 192.0.1.0 to 223.255.254.0 | 2^21-2                                | 2^8-2                       | 192.168.0.0 to 192.168.255.255 |

- Máscara de red: nos indica que parte direcciona a la subred y que parte direcciona a los equipos de esa subred.

- Otra forma de dar la máscara es contar el número de bits que hay. Por ejemplo, 255.255.255.0, 8 unos en cada octeto luego la máscara es 24.

- Truco para pasar máscaras rápidamente:

Cada número es el valor decimal del bit del octeto `11111111`

128 64 32 16 8 4 2 1

## Ejercicios

- IP = `10.20.30.40`, máscara=255.255.255.0/24.

      	- Clase A, tipo privada.
      	- 24 bits redes / 8 bits hosts.
      	- Direccion de la red: 10.20.30.0
      	- Dirección de broadcasting: 10.20.30.255
      	- Primera dirección para un host: 10.20.30.1
      	- Ultima: 10.20.30.254

- IP = 221.34.56.21, máscara=255.255.0.0/16

      	- Clase C, pública.
      	- 16 / 16
      	- 221.34.0.0
      	- 221.34.255.255
      	- 221.34.0.1
      	- 221.34.255.254
      	- ESTA DIRECCION ESTA MAL. Porque es publica, y no cumple las reglas de la clase C. En el mundo real esta máscara no podría existir. En los ejercicios teóricos no va a importar.

- IP = 9.10.11.12, máscara=255.0.0.0

      	- Clase A, pública, 8/24
      	- 9.0.0.0
      	- 9.255.255.255
      	- 9.0.0.1
      	- 9.255.255.254

- IP = 192.168.23.223, máscara=255.255.255.128

      	- Tipo C, privada, 25 / 7
      	- 192.168.23.128
      	- 192.168.23.255
      	- 192.168.23.129
      	- 192.168.23.254

- IP = 172.17.25.114, máscara=255.255.255.192

      	- Tipo B, privada, 26/6
      	- 172.17.25.64 (172.17.25.01110010, poner todos los bits que no pertenecen a la máscara de red a 0)
      	- 172.17.25.127 (poned todos los bits que no sean de la máscara a 1)
      	- 172.17.25.65
      	- 172.17.25.126

## Máscaras de red de tamaño variable

Usando esto se desperdician menos IPs.

- IP = 21.10.20.220

      	- Clase A, pública.

Supongamos que la empresa necesita tener al menos 300 IPs, públicas. Por lo que necesitamos una máscara de red de 23 bits.

¿Qué rango de IPs le daríamos?

Veamos la dirección de la red. 21.10.20.0 (21.10.00010100.220). El rango seria 21.10.20.0 hasta la 21.10.21.255.

La máscara sería 255.255.254.0.

## Classless Inter-Domain Routing

Uso más eficiente de las IPs. Tablas de enrutamiento más sencillas.

192.168.2.6
192.168.14.20
192.168.50.32
192.168.33.0

Esas 4 direcciones IPs pertenecen a distintas subredes. Queremos minimizar el número de entradas en la tabla de enrutamiento.

En binario, las anteriores IPs:

11000000.101010000.0000 0010.0000 0110
11000000.101010000.0000 1110.0001 0100
11000000.101010000.0011 0010.0010 0000
11000000.101010000.0010 0001.0000 0000

Cogemos la máscara de 18 bits para englobarlas a todas. La dirección de la "macronet" que incluye esas 4 redes sería 192.168.0.0/18. La de broadcasting sería 192.168.63.255.
