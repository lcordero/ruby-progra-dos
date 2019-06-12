## Información General
Esta tabla hace referencia a cada usuario y branch que tienen que usar. **POR FAVOR** recuerden que estamos utilizando un servicio compartido con todos sus compañer@s; por lo tanto, mantengamos el respeto del espacio de cada compañer@ y **ÚNICA** y **EXCLUSIVAMENTE** usemos **NUESTRO** acceso y branch.

| user        | branch      | port |
|-------------|-------------|------|
| alejandro-z | alejandro-z | 3001 |
| alonso-v    | alonso-v    | 3002 |
| anthony-r   | anthony-r   | 3003 |
| david-z     | david-z     | 3004 |
| gabriel-m   | gabriel-m   | 3005 |
| isacc-m     | isacc-m     | 3006 |
| jairo-v     | jairo-v     | 3007 |
| katherine-g | katherine-g | 3008 |
| kervin-v    | kervin-v    | 3009 |
| leandro-c   | leandro-c   | 3010 |
| minor-g     | minor-g     | 3011 |
| roy-u       | roy-u       | 3012 |
| sebas-v     | sebas-v     | 3013 |

**NOTA:** En los siguientes comandos reemplazar donde dice *<**user**>* por sus respectivos usuarios de la tabla anterior; lo mismo cuando se encuentren *<**branch**>*


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

2.1) Generar RSA key (**NOTA:** Después de correr el siguiente comando, presionan "Enter" como unas 3 ó 4 veces; hasta que aparezca la siguiente línea: ```"+----[SHA256]-----+"):```
```
$ ssh-keygen
```

2.2) Copiar contenido de la key pública (**NOTA:** Tienen que copiar desde donde dice: ```ssh-rsa AAA...``` HASTA ```...@progra2```):
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

## 4) Actualizar branch
4.1) Revisamos que nuestro branch está limpio y no hay cambios en el aire
```
$ git branch
```
Debemos ver como resultado:
```     
* leandro-c <<-- En su caso debe ser su branch
  master
```
Luego revisamos el estado del branch:
```
$ git status
```
Resultado:
```
nothing to commit, working tree clean
```
Si el resultado es diferente de ```nothing to commit, working tree clean``` debemos correr:
```
$ git checkout .
```

4.2) Nos movemos al branch **leandro-c** para jalar nuevos cambios.
```
$ git checkout leandro-c
```
```
$ git pull origin leandro-c
```

4.3) No movemos a nuestro branch para actualizarlo con los cambios del branch **leandro-c**:
```
$ git checkout <branch>
```
```
$ git merge leandro-c
```

4.4) Nos movemos al folder que se creó nuevo:
```
$ cd ~/progra2/ruby-progra-dos/my-api
```

## 5) Instalar dependencias y levantar server
5.1) Recreamos Gemfile.lock, para esto es necesario eliminarlo
```
$ rm Gemfile.lock
```

5.2) Ejecutamos bundle install, para instalar todas las gemas
```
$ bundle install
```
Resultado:
```
...
...
Bundle complete! X Gemfile dependencies, XX gems now installed.
Bundled gems are installed into `./vendor/bundle`
```

5.3) Correr las migraciones de Bases de Datos:
```
$ rails db:migrate
```

5.4) Crear las rutas/endpoints de nuestra App
```
$ rails routes
```

5.5) A este punto podemos ver nuestra API en acción (**NOTA:** reemplazar *<**port**>* por el puerto de cada uno en la tabla del inicio de este documento):
```
$ rails s -b 0.0.0.0 -p <port>
```

5.6) Nos vamos al navegador, abrimos un nuevo tab y accesamos a (**NOTA:** Recuerden reemplazar *<**port**>* por el número usado en el paso 5.5): 
http://35.209.175.42:<port>/todos

Como resultado deben obtener un array vacío:
```
[]
```
