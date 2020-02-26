### Levantar base de datos

~~~bash
lsnrctl start
sqlplus /nolog
connect sys as sysdba;
startup;
~~~

### Tirar base de datos

~~~bash
sqlplus sys as sysdba
shutdown immediate;
lsnrctl stop
su -
umount /database
~~~

- Oracla Enterprise Manager: `https://localhost:5500/em` ó `https://pclab.localdomain:5500/em`
