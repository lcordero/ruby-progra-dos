## Información General
Esta tabla hace referencia a cada usuario y branch que tienen que usar. **POR FAVOR** recuerden que estamos utilizando un servicio compartido con todos sus compañer@s; por lo tanto, mantengamos el respeto del espacio de cada compañer@ y **ÚNICA** y **EXCLUSIVAMENTE** usemos **NUESTRO** acceso y branch.

| user        | branch      |
|-------------|-------------|
| alejandro-z | alejandro-z |
| alonso-v    | alonso-v    |
| anthony-r   | anthony-r   |
| david-z     | david-z     |
| gabriel-m   | gabriel-m   |
| isacc-m     | isacc-m     |
| jairo-v     | jairo-v     |
| katherine-g | katherine-g |
| kervin-v    | kervin-v    |
| minor-g     | minor-g     |
| roy-u       | roy-u       |
| sebas-v     | sebas-v     |

**NOTA:** En los siguientes comandos reemplazar donde dice _<user>_ por sus respectivos usuarios de la tabla anterior; lo mismo cuando se encuentren _<branch>_


## 1) Accesar a VM Remota
1.1) Descargar id_rsa_student desde: https://drive.google.com/open?id=1TRLeCZsLxQ1jhu8xTEjRFsbceGL1fZ8u

1.2) Ubicar (copiar/pegar) el archivo id_rsa_student dentro de la carpeta: ```C:\Users\<Su-Usuario>\.ssh\```

1.3) Abrir gitBash y ejecutar (Reemplazar <user> por su usuario):
```
$ ssh <user>@35.209.175.42 -i ~/.ssh/id_rsa_student
```

1.4) A este punto ya deberían de ver lo siguiente:
```$ ssh <user>@35.209.175.42 -i ~/.ssh/id_rsa_student
Welcome to Ubuntu 18.04.2 LTS (GNU/Linux 4.15.0-1032-gcp x86_64)
...
...
<user>@progra2:~$
```

## 2) Crear mi RSA key para github.com

2.1) Generar RSA key (NOTA: Después de correr el siguiente comando, presionan "Enter" como unas 3 ó 4 veces; hasta que aparezca la siguiente línea: ```"+----[SHA256]-----+"):```
```
$ ssh-keygen
```

2.2) Copiar contenido de la key pública (NOTA: Tienen que copiar desde donde dice: ```ssh-rsa AAA...``` HASTA ```...@progra2```):
```
$ cat ~/.ssh/id_rsa.pub
```

2.3) Ir a https://github.com/settings/keys y presionar el botón "New SSH key". En el title digitan "Progra2-Remote" y en el espacio de key pegan lo que copiaron en el paso anterior. Y por último le dan al botón de "Add SSH key"

## 3) Clonando el repositorio

3.1) Nos vamos nuevamente a gitBash (Si ya hemos perdido la sesión repetimos el paso 1.4) y creamos un nuevo folder:
```
$ mkdir ~/progra2 && cd ~/progra2
```

3.2) Clonamos el repositorio y nos movemos al folder del repositorio:
```
$ git clone git@github.com:lcordero/ruby-progra-dos.git && cd ruby-progra-dos/
```

3.3) Nos movemos a nuestro branch:
```
$ git checkout <branch>
```


