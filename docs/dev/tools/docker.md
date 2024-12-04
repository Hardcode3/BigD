# Docker

!!! info

    Docker is a [virtualization](https://en.wikipedia.org/wiki/Virtualization){target=_blank} technique based on containers.
    
    It allows running very light and isolated containers.

!!! success "Advantages of containers"

    - **Speed:** Simplifies setup and teardown of complex environments.
    - **Consistency:** Ensures all developers use the same environment.
    - **Portability:** Easily share configurations for testing or deployment.

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

## Usage

```txt
Usage:  docker [OPTIONS] COMMAND

A self-sufficient runtime for containers

Common Commands:
  run         Create and run a new container from an image
  exec        Execute a command in a running container
  ps          List containers
  build       Build an image from a Dockerfile
  pull        Download an image from a registry
  push        Upload an image to a registry
  images      List images
  login       Authenticate to a registry
  logout      Log out from a registry
  search      Search Docker Hub for images
  version     Show the Docker version information
  info        Display system-wide information

Management Commands:
  builder     Manage builds
  buildx*     Docker Buildx
  compose*    Docker Compose
  container   Manage containers
  context     Manage contexts
  debug*      Get a shell into any image or container
  desktop*    Docker Desktop commands (Alpha)
  dev*        Docker Dev Environments
  extension*  Manages Docker extensions
  feedback*   Provide feedback, right in your terminal!
  image       Manage images
  init*       Creates Docker-related starter files for your project
  manifest    Manage Docker image manifests and manifest lists
  network     Manage networks
  plugin      Manage plugins
  sbom*       View the packaged-based Software Bill Of Materials (SBOM) for an image
  scout*      Docker Scout
  system      Manage Docker
  trust       Manage trust on Docker images
  volume      Manage volumes

Swarm Commands:
  swarm       Manage Swarm

Commands:
  attach      Attach local standard input, output, and error streams to a running container
  commit      Create a new image from a container's changes
  cp          Copy files/folders between a container and the local filesystem
  create      Create a new container
  diff        Inspect changes to files or directories on a container's filesystem
  events      Get real time events from the server
  export      Export a container's filesystem as a tar archive
  history     Show the history of an image
  import      Import the contents from a tarball to create a filesystem image
  inspect     Return low-level information on Docker objects
  kill        Kill one or more running containers
  load        Load an image from a tar archive or STDIN
  logs        Fetch the logs of a container
  pause       Pause all processes within one or more containers
  port        List port mappings or a specific mapping for the container
  rename      Rename a container
  restart     Restart one or more containers
  rm          Remove one or more containers
  rmi         Remove one or more images
  save        Save one or more images to a tar archive (streamed to STDOUT by default)
  start       Start one or more stopped containers
  stats       Display a live stream of container(s) resource usage statistics
  stop        Stop one or more running containers
  tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
  top         Display the running processes of a container
  unpause     Unpause all processes within one or more containers
  update      Update configuration of one or more containers
  wait        Block until one or more containers stop, then print their exit codes

Global Options:
      --config string      Location of client config files (default
                           "C:\\Users\\bapti\\.docker")
  -c, --context string     Name of the context to use to connect to the
                           daemon (overrides DOCKER_HOST env var and
                           default context set with "docker context use")
  -D, --debug              Enable debug mode
  -H, --host list          Daemon socket to connect to
  -l, --log-level string   Set the logging level ("debug", "info",
                           "warn", "error", "fatal") (default "info")
      --tls                Use TLS; implied by --tlsverify
      --tlscacert string   Trust certs signed only by this CA (default
                           "C:\\Users\\bapti\\.docker\\ca.pem")
      --tlscert string     Path to TLS certificate file (default
                           "C:\\Users\\bapti\\.docker\\cert.pem")
      --tlskey string      Path to TLS key file (default
                           "C:\\Users\\bapti\\.docker\\key.pem")
      --tlsverify          Use TLS and verify the remote
  -v, --version            Print version information and quit

Run 'docker COMMAND --help' for more information on a command.

For more help on how to use Docker, head to https://docs.docker.com/go/guides/
```

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

## Docker compose

!!! info "Overview"

    Docker Compose is a tool for defining and managing multi-container Docker applications. It allows developers to use a YAML file to define the services, networks, and volumes needed to run an application, simplifying the management and orchestration of containers.

### Features

1. **Multi-Container Management**: Easily define and run applications with multiple containers.  
2. **YAML Configuration**: Use `docker-compose.yml` to declaratively define services, networks, and volumes.  
3. **Dependency Management**: Control service startup order with `depends_on`.  
4. **Networking**: Automatic inter-service communication via a shared network.  
5. **Environment Variables**: Support for `.env` files for configuration.  
6. **Shared Volumes**: Persist data and enable container data sharing.  
7. **Scaling**: Scale services horizontally with `--scale`.  
8. **Simplified Commands**: Manage all containers with `up`, `down`, `logs`, etc.  
9. **Local Development**: Easily replicate production-like environments locally.  
10. **Portability**: Share and reuse configurations for testing or deployment.

### Usage

```txt
Usage:  docker compose [OPTIONS] COMMAND

Define and run multi-container applications with Docker

Options:
      --all-resources              Include all resources, even those not
                                   used by services
      --ansi string                Control when to print ANSI control
                                   characters ("never"|"always"|"auto")
                                   (default "auto")
      --compatibility              Run compose in backward compatibility mode
      --dry-run                    Execute command in dry run mode
      --env-file stringArray       Specify an alternate environment file
  -f, --file stringArray           Compose configuration files
      --parallel int               Control max parallelism, -1 for
                                   unlimited (default -1)
      --profile stringArray        Specify a profile to enable
      --progress string            Set type of progress output (auto,
                                   tty, plain, json, quiet) (default "auto")
      --project-directory string   Specify an alternate working directory
                                   (default: the path of the, first
                                   specified, Compose file)
  -p, --project-name string        Project name

Commands:
  attach      Attach local standard input, output, and error streams to a service's running container
  build       Build or rebuild services
  config      Parse, resolve and render compose file in canonical format
  cp          Copy files/folders between a service container and the local filesystem
  create      Creates containers for a service
  down        Stop and remove containers, networks
  events      Receive real time events from containers
  exec        Execute a command in a running container
  images      List images used by the created containers
  kill        Force stop service containers
  logs        View output from containers
  ls          List running compose projects
  pause       Pause services
  port        Print the public port for a port binding
  ps          List containers
  pull        Pull service images
  push        Push service images
  restart     Restart service containers
  rm          Removes stopped service containers
  run         Run a one-off command on a service
  scale       Scale services 
  start       Start services
  stats       Display a live stream of container(s) resource usage statistics
  stop        Stop services
  top         Display the running processes
  unpause     Unpause services
  up          Create and start containers
  version     Show the Docker Compose version information
  wait        Block until containers of all (or specified) services stop.
  watch       Watch build context for service and rebuild/refresh containers when files are updated

Run 'docker compose COMMAND --help' for more information on a command.
```

#### Launch docker-compose

##### For the first time

In the current directorry of the `docker-compose.yaml` file:

```bash
docker-compose up
```

##### Another time

```bash
docker-compose start
```

- Add `-d` to launch docker-compose and detach the console

#### Show logs when detached

```bash
docker-compose logs
```

Exit with `ctrl+c`, it does not stop the containers.

#### Stop docker-compose

```bash
docker-compose stop
```

#### Delete docker-compose

!!! warning "This command deletes everything built for the docker-compose services, except for the volumes"

```bash
docker-compose down
```

### Example

```yaml
version: '3.9'
services:
  web:
    image: nginx:latest
    ports:
      - "8080:80"
    depends_on:
      - app
  app:
    build:
      context: ./app
    environment:
      - APP_ENV=development
    volumes:
      - app-data:/app/data
  db:
    image: postgres:13
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: password
volumes:
  app-data:
```

This file:

- Defines three services: `web`, `app`, and `db`.
- Configures networking and volume sharing.
- Manages service dependencies.

## Portainer

...