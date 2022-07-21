# Prácticas Docker

## 3. Configurar un usuario normal para utilizar docker

Esta práctica la debemos hacer como “root”

- Vamos primero a crear un usuario:

```
useradd usu1
```

- Le asignamos una contraseña:

```
passwd usu1
```

- Creamos un grupo denominado “Docker”:

```
groupadd docker
```

- Asignamos el grupo “docker” al usuario que hemos creado anteriormente:

```
usermod -G docker usu1
```

- Si consultamos el fichero /etc/group debe aparecer una línea parecida a la siguiente con el grupo docker y el usuario asociado que hemos creado:

```
docker:x:972:usu1
```

Nos conectamos como ese usuario desde un terminal o desde cualquier sitio
Si ponemos el comando “id” debería aparecer entre otras características los grupos a los que pertenece y entre ellos debería estar el dedo car:

```
id
uid=54323(usu1) gid=54332(usu1) grupos=54332(usu1),972(docker)
contexto=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
```

- Para probar podemos poner el comando docker versión que debería sacar información tanto del cliente como del servidor:

```
docker --version
```
