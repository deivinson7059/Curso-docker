# 1. Instalación en Debian, Ubuntu, Suse….)

Esta práctica está basada en la versión 20.10.17 (Julio 2022), que era la que en el momento de hacer este curso era la versión estable. Durante el curso vamos a usar el usuario “root”

- Realizamos una actualización inicial:

```
$ sudo apt-get update
```

- Eliminamos los posibles paquetes anteriores:

```
$ sudo apt-get remove docker docker-engine docker.io containerd runc
```

- Configuramos el repositorio para la instalación:

```
$ sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```

- Volvemos a realizar un update:

```
$ apt-get update
```

- Agregue la clave GPG oficial de Docker:

```
 $ sudo mkdir -p /etc/apt/keyrings

 $ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

- configuraramos el repositorio:

```
 $ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

- Realizamos la instalación de Docker:

```
$ sudo apt-get update
$ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

- Arrancamos el servicio:
  ```
  $ sudo systemctl start docker
  ```
- Comprobamos que está funcionando:

  ```
  $ sudo systemctl status docker

  ```

- Comprobar que lo tenemos funcionando:
  ```
  $ docker - -version
  ```
- Lo activamos para que cada vez que arranque el sistema operativo arranque también docker:
  ```
  $ sudo systemctl enable docker
  ```

# 2. Instalación en Centos (Fedora, Red Hat y Oracle Linux)

Esta práctica está basada en la versión 20.10.17 (Julio 2022), que era la que en el momento de hacer este curso era la versión estable. Durante el curso vamos a usar el usuario “root”

- Realizamos una actualización inicial:

```
$ sudo yum update
```

- Eliminamos los posibles paquetes anteriores:

```
$ sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
```

- Configuramos el repositorio para la instalación:

```
$ sudo yum install -y yum-utils

$ sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
```

- Realizamos la instalación de Docker:

```
$ sudo yum update
$ sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

- Comprobamos que tenemos instalado los paquetes RPM. (El resultado puede ser un poco distinto dependiendo de la versión que hayamos descargado):

```
$ sudo rpm -qa | grep docker
```

- Arrancamos el servicio:
  ```
  $ sudo systemctl start docker
  ```
- Comprobamos que está funcionando:

  ```
  $ sudo systemctl status docker

  ```

- Comprobar que lo tenemos funcionando:
  ```
  $ docker - -version
  ```
- Lo activamos para que cada vez que arranque el sistema operativo arranque también docker:

  ```
  $ sudo systemctl enable docker
  ```

[Click para ver la Documentacion de Docker](https://docs.docker.com/get-started/)
