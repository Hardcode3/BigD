# Docker

!!! info

    Docker is a [virtualization](https://en.wikipedia.org/wiki/Virtualization){target=_blank} technique based on containers.
    
    It allows running very light and isolated containers.

!!! quote

    - [Develop inside a container using VSCode](https://code.visualstudio.com/docs/devcontainers/containers){target=_blank}
    - [Docker documentation](https://docs.docker.com/){target=_blank}
    - [Docker Hub](https://hub.docker.com/){target=_blank}
    - [Play with Docker](https://labs.play-with-docker.com/){target=_blank}
    - [ByteByteGo: Virtualization and Containerization: Which one to pick?](https://blog.bytebytego.com/p/virtualization-and-containerization){target=_blank}

## Preliminaries

See [virtualization notes](virtualization.md).

## Docker hub

[Docker Hub](https://hub.docker.com/){target=_blank} is the equivalent of GitHub.
It stores Docker images from the community.

!!! danger "Use verified and popular images!"

    Everyone can upload images to Docker hub.
    Some can have security issues or may contain malwares.

## Installation

Cf [official Docker documentation](https://docs.docker.com/){target=_blank}.

## Docker Basics

One can first analyze the following command:

```bash title="Example: how to call Docker:"
docker run --rm bash echo Salut!
```

It gives the follwing result:

```text
Unable to find image 'bash:latest' locally
latest: Pulling from library/bash
e1517fbc9c07: Download complete
467989b961c3: Download complete
43c4264eed91: Download complete
Digest: sha256:ce062497c248eb1cf4d32927f8c1780cce158d3ed0658c586a5be7308d583cbb
Status: Downloaded newer image for bash:latest
Salut!
```

What happens is:

1. Docker searches for a bash image and since we did not specified any tag, it takes the latest version.
2. Docker pulls (downloads) bash image from DockerHub.
3. Docker executes the command `echo Salut!`.
4. Docker removes the container (not the image) since we used the flag `-rm`.

### Get Help

!!! tip "Each docker command has a `--help` feature to get a description and usage."

### View downloaded (cached) images

```bash title="Listing cached images:"
docker images
```

```text title="Result:"
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
bash         latest    ce062497c248   6 weeks ago   21.8MB
```

After having launched a bash container, bash image is cached in the computer.
Caching ensures that the following runs are much faster: there is no need to download the image again.

Running again:

```bash title="Specifying an image version / tag:"
docker run --rm bash:3.2 echo Salut!
```

```text title="Result:"
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
bash         latest    ce062497c248   6 weeks ago   21.8MB
bash         3.2       79dd16db958d   5 months ago   17.4MB
```

Again, this is the goal of caching: the bash version 3.2 have to be dowloaded and appears in the table.

### Running interactive Docker

- `-t`: asks Docker to give a terminal access, plugging STDIN and STDOUT
- `-i`: runs the container in interactive mode, giving access to the keyboard
- `-ti`: combination of `-t` and `-i`

```bash title="After this command, Docker terminal appears inside out terminal:"
docker run -ti --rm bash:3.2 echo Salut!
```

```bash title="To exit the docker container console:"
exit
```

!!! warning "``docker run` always create a new container."

### Start an existing container

Once we've created a container, we must not use docker run command again.
The container can be started using the command:

```bash
docker start -ai <container name>
```

- `-a`: attach the container to a process
- `-i`: runs the container in interactive mode, giving access to the keyboard
- `-ai`: combination of `-a` and `-i`

### Stop an existing container

```bash title="Stop a container from inside the attached commandline"
exit
```

```bash title="Stop a container gracefully from the outside"
docker exit
```

### List container information

```bash title="To print running Docker containers"
docker ps
```

```bash title="List all containers quietly (only displays container IDs)"
docker ps -q
```

```bash title="List all containers (running and stoped)"
docker ps -a
```

```bash title="To print the last n created containers (running and stoped)"
docker ps -l
```

```bash title="To print container sizes"
docker ps -s
```

```bash title="To print container with their id, name and status (using formatter)"
docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}"
```

#### Detail informations for any container

Use ``docker ps` t get container's name and then:

```bash title="Print information on the docker"
docker inspect <container name>
```

### Attach to a running container

```bash
docker attach <container name>
```

### Detach from a running container

```bash title="From inside a container"
ctrl p+q
```

### Container IDs

Image and containers have unique IDs, that can be obtained using `docker images`.
IDs can be used to:

- get images properties
- manipulate images

### Print history / layers of an image

```bash title="Print the layers used for a given image. Layers can be numerous."
docker history <IMAGE_ID>
```

!!! tip "Shortcut"

    Typing only the first unique digits of the ID is the same as copy-pasting the whole ID.

!!! info

    All the layers that constitude the container image are read-only.
    There is a read-write partition inside the container (separated from host), that stores the data of the container.
    Now there are multiple issues:

    1. How to make backup of the container?
    2. How to update an image for this container?

    Answer: containers are volatile, and this is where volumes are important.

### Volumes handling

#### Maped volumes

Volumes mount a directory from host machine into a container.
The deletion of the container will not affect the project files.

```bash title="Mount a directory from the host machine inside the container"
docker run -ti --rm -v $(pwd)/<host folder>:<docker folder>
```

bash title="To mound a directory in read only, add `ro`:"
```
docker run -ti --rm -v $(pwd)/<host folder>:ro<docker folder>
```

#### Managed volumes

```bash title="Docker creates a file volume for us:"
docker volume create my_data
```

```bash title="Print the list of the created volumes:"
docker volume ls
```

```bash title="Create a bash container sharing the volume my_data:"
docker run --rm -ti -v my_data:/src bash
```

```bash title="Create a bash container sharing the volume my_data:"
docker run --rm -ti -v my_data:/src bash
```

!!! tip "When mounting an empty managed volume, the mounting folder of the container is totally transferred inside the host folder, and stays after the container has been deleted."

Docker containers can then modify the volume.

```bash title="Print information on the managed volume"
docker volume inspect my_data
```

### Delete all existing containers

```bash title="Stop all running containers"
docker stop $(docker ps -q)
```

```bash title="Remove all containers"
docker rm $(docker ps -a -q)
```

### Test some executable in different environments

```bash
docker run --rm -v $(pwd)/script.sh:/script.sh bash:4 /script.sh
```

What this command will do is:

- create a temporary docker (`rm` command is used) using bash version 4
- mount a volume corresponding to the executable file `script.sh`
- execute the script with the command `/script.sh`
- exit the container and delete it

To test the script or the executable on another bash version, the only thing to do is specifying the version we want to test in the same command:

```bash
docker run --rm -v $(pwd)/script.sh:/script.sh bash:3.2 /script.sh
```

!!! success "And we have not touched to our system configuration!"

### Network ports handling

Just as volumes, containers have their own network ports, that can be mounted to host's network ports. `-p` is similar to `-v` to mount volumes, but for network ports.

```bash title="Creates an nginx docker that maps the container network port to the host network port"
docker run --rm -p <host port>:<container port> nginx 
```

Note that:

- ports can be reserved
- cannot be allocated twice
- if no host port is specified, the host machine choses the port number

```bash title="Creates an nginx docker that maps the container network port to the host network port of the host's choice"
docker run --rm -p -d <host port>:<container port> nginx 
```

Note that `-d` detaches the docker and runs it in the background so that the server can run continously.

However, docker silences the maping and we want a way to see quickly which port host's system decided to use ``docker ps` t get container's name and then:

```bash title="Print information on the docker (ports and volumes are one of those)"
docker inspect <container name>
```

#### Network drivers

There are different levels of network drivers for docker containers:

- none: no network driver
- bridge (default): only containers created using the bridge and host will be able to connect to each others
- custom bridges: same as bridge but this is not a default bridge
- host: no network isolation between host and container
- overlay
- macvlan

!!! tip "Bridge features can be checked using `ping` command inside each docker"

!!! tip "Network features can be checked using `ifconfig` command inside the docker"

##### No network

```bash title="Create a bash container having no network feature"
docker run -ti --rm --network none bash
```

##### Default bridge

```bash title="Create a bash container having a bridge feature"
docker run -ti --rm bash
```

!!! warning

    This default bridge provides acceess to every other docker and the host machine, one may want to ping specific containers instead of all of them.
    In this case, custom bridges can be used.

##### Custom bridge

```bash title="Create a bash container having a custom bridge feature"
docker run -ti --rm --network create --driver=bridge my_bridge_name bash
```

Then, my_bridge_name network should appear inside the created network:

```bash title="To list docker networks created"
docker network ls
```

```bash title="To create another container sharing the same my_bridge_name network:"
docker run -ti -rm --network=my_bridge_name --name=server1 bash
```

!!! warning "Docker uses a internal DNS only for cloned bridges or custom briges, but not for default bridges"

    Containers sharing the same network can therefore ping each other by their IP, but also using their names (given by `--name`).

If a container was created on another bridge or none, it can be linked at container runtime with:

```bash title="Connect container server to the bridge my_bridge_name"
docker network connect my_bridge_name server
```

Once done, server container should be able to ping server1 because it will share the same bridge network.
Note that this is done while the container is running and do not require a container reboot.

##### Host driver

Opening a network port on the docker is equivalent to opening a network port on the host machine.

!!! danger "This type of network can be used in very specific cases, but goes against container's isolation principle."

#### Delete a network

```bash title="Remove the my_bridge_name network"
docker network rm my_bridge_name
```

### Log detached containers

```bash title="Print the last logs of a given container (a bit like unix tail command)"
docker logs <container id or name>
```

This command is useful for detached containers.

### Executing a command in an active container

```bash title="Executes the program in the specified active container"
docker exec -ti <container id or name> <program>
```

e.g.

```bash title="Executes the program bqsh in the specified active container d24"
docker exec -ti d24 bash
```

This will open the container in a bash console, in interactive mode.

### Creating images

Sometimes, existing images do not have the features we want, and therefore we have to create it.

This can be done by:

1. Selecting an existing image on DockerHub
2. Typing commands that should be run in addition on the image, creating additional layers

#### Editing the Dockerfile

Any Dockerfile starts with a base image specification:

```dockerfile
FROM ubuntu:22.04
```

In this scenario, the base image on which we will add layers is ubuntu, version 22.04.

!!! success "Changing the version number of the base image is a standard way of testing a code throughout software versions"

##### Installing libraries automatically using `apt-get`

Sometimes, installing libraries need a user input, like Y for yes or N for no.

In this case, the syntax in the dockerfile becomes:

```dockerfile
RUN apt-get install -y libxml2-dev
```

This command will provide an automated Y or yes input to the installation procedure of the container.

In other scenarios, time-zone has to be known by a user input and stops the container installation process.

To automate this, two commands can be added at the top of the Dockerfile:

```dockerfile
ENV TZ=Europe/Paris
ENV DEBIAN_FRONTEND=noninteractive
```

##### Changing the working directory

```dockerfile title="Set the working directory to /opt/test"
WORKDIR /opt/test
```

#### Build the new image from a Dockerfile

```bash
docker build -t <new container name> <path to Docker file>
```

```bash
docker build -t php_soap:7.0.31 .
```

Where:

- `-t` creates a tag for the new image `php_soap:7.0.31`
- `.` specifies that the dockerfile is in the current working directory

!!! tip "If the Dockerfile has a custom name (different from Dockerfile or dockerfile), then the path to this configuration script is indicated by `-f my_custom_named_dockerfile path_to_custom_dockerfile`"

### Docker compose

Uses a `docker-compose.yaml` file.

...

### Portainer

...