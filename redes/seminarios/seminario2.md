# Herramientas y utilidades de diagnóstico en red. Comandos básico CISCO

Al principio:

~~~bash
sudo apt install nmap # nuestro amigo
sudo apt install tracerouter
sudo apt install wireshark

# si ifconfig no está instalado
sudo apt install net-tools

# ver los equipos que están en nuestra subred
nmap -sn <direccion sub-red>

# escanea los puertos e intenta hablar con ellos
nmap -sS <direccion sub-red>

# para adivinar el SO
nmap -O <ip>
~~~

~~~bash
traceroute <direccion>
traceroute -d <direccion>
traceroute -n <direccion>
traceroute -q 5 -n <direccion>
~~~

