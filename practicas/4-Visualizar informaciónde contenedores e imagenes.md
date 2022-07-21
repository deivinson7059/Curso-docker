# Prácticas Docker

## 4. Nuestros primeros contenedores

- Vamos a crear nuestro primer contenedor:

```
docker run hello-world

Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
ca4f61b1923c: Pull complete
Digest:
sha256:97ce6fa4b6cdc0790cda65fe7290b74cfebd9fa0c9b8c38e979330
d547d22ce1
Status: Downloaded newer image for hello-world:latest
Hello from Docker!
This message shows that your installation appears to be working
correctly.
To generate this message, Docker took the following steps:
1. The Docker client contacted the Docker daemon.
2. The Docker daemon pulled the "hello-world" image from the Docker
Hub.
 (amd64)
3. The Docker daemon created a new container from that image which
runs the
 executable that produces the output you are currently reading.
4. The Docker daemon streamed that output to the Docker client, which
sent it
 to your terminal.
To try something more ambitious, you can run an Ubuntu container with:
$ docker run -it ubuntu bash
Share images, automate workflows, and more with a free Docker ID:
https://cloud.docker.com/
For more examples and ideas, visit:
```

- Comprobar que el contenedor no está activo, ya que se cierra en cuanto sal el mensaje:

  ```
  docker ps

  CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
  c0b8f9f8f8f8        hello-world        "/bin/sh"            5 seconds ago       Exited (0)
  ```

- Comprobar que el contenedor se ha creado, pero que está parado:

  ```
  docker ps -a

  CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
  c0b8f9f8f8f8        hello-world        "/hello"            5 seconds ago         Exited (0) 32 minutes ago
  ```

- Comprobar que existe la imagen:

  ```
  docker images

  REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
  hello-world        latest              ca4f61b1923c       5 seconds ago       8.88 MB
  ```

- Creamos un nuevo contenedor a partir de la imagen y vemos que existe:

```
docker run hello-world

Hello from Docker!
This message shows that your installation appears to be
working correctly.
To generate this message, Docker took the following steps:
1. The Docker client contacted the Docker daemon.
2. The Docker daemon pulled the "hello-world" image from
the Docker Hub.
(amd64)
3. The Docker daemon created a new container from that
image which runs the
executable that produces the output you are currently
reading.

4. The Docker daemon streamed that output to the Docker
client, which sent it
to your terminal.
To try something more ambitious, you can run an Ubuntu
container with:
$ docker run -it ubuntu bash
Share images, automate workflows, and more with a free
Docker ID:
https://cloud.docker.com/
For more examples and ideas, visit:
https://docs.docker.com/engine/userguide/

```

- Comprobar que el contenedor está activo:

  ```
  docker ps -a

  CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
  c0b8f9f8f8f8        hello-world        "/hello"            5 seconds ago         Exited (0) 32 minutes ago

  0e7ef0959d21        hello-world        "/hello"            5 seconds ago         Exited (0) 27 minutes ago
  ```

- Creamos un nuevo contenedor basado en otra imagen de Docker Hub
  denominada busybox, que es un contenedor con un cierto número de utilidades:

```
    docker run -it busybox

    Unable to find image 'busybox:latest' locally
    latest: Pulling from library/busybox
    d070b8ef96fc: Pull complete
    Digest:
    sha256:2107a35b58593c58ec5f4e8f2c4a70d195321078aebfadfbfb2
    23a2ff4a4ed21
    Status: Downloaded newer image for busybox:latest
```

- Comprobamos el nuevo contenedor:

  ```
  docker ps -a

  CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
  c0b8f9f8f8f8        hello-world        "/hello"            5 seconds ago         Exited (0) 32 minutes ago
  0e7ef0959d21        busybox            "/bin/sh"            5 seconds ago         Exited (0) 27 minutes ago
  ```

- Comprobar que existe la imagen:

  ```
  docker images

  REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
  busybox            latest              d070b8ef96fc       5 seconds ago       1.8 MB
  hello-world        latest              f2a91732366c       3 months ago 1.85kB

  ```

- Visualizar solo las ids de los contenedores:

  ```
  docker ps -q

  c0b8f9f8f8f8
  0e7ef0959d21
  ```

- Ver los dos últimos contenedores lanzados:

  ```
  docker ps -a -n 2

  CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
  c0b8f9f8f8f8        hello-world        "/hello"            5 seconds ago         Exited (0) 32 minutes ago
  0e7ef0959d21        busybox            "/bin/sh"            5 seconds ago         Exited (0) 27 minutes ago
  ```

  -Comprobar el espacio utilizado por los contenedores creados:

  ```
  docker ps -a -s

  CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
  c0b8f9f8f8f8        hello-world        "/hello"            5 seconds ago         Exited (0) 32 minutes ago nifty_vaughan 0B (virtual 1.15MB)
  0e7ef0959d21        busybox            "/bin/sh"            5 seconds ago         Exited (0) 27 minutes ago loving_jennings 0B (virtual 1.85kB)
  ```

  - También podemos usar la opción -f para filtrar por algún dato concreto,
    por ejemplo, por el nombre. Busca por el contenido dentro del texto.

- Ejemplo. Teniendo estos contenedores:

  ```
  docker ps -a

  CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
  c0b8f9f8f8f8        hello-world        "/hello"            5 seconds ago         Exited (0) 32 minutes ago nifty_vaughan
  0e7ef0959d21        busybox            "/bin/sh"            5 seconds ago         Exited (0) 27 minutes ago loving_jennings
  ```

  - Si queremos saber los que tienen la palabra “nifty_vaughan” en el nombre:

  ```
  docker ps -a -s -f "davinci"
  CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
  c0b8f9f8f8f8        hello-world        "/hello"            5 seconds ago         Exited (0) 32 minutes ago nifty_vaughan 0B (virtual 1.15MB)
  ```

  - O los que tengan una “y” en el nombre:

  ```
  docker ps -a -f name=y
  CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
  c0b8f9f8f8f8        busybox        "/sh"            5 seconds ago         Exited (0) 32 minutes ago nifty_vaughan
  ```
