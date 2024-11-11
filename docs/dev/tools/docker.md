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

One can fist analyze the following command:

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

### List container information

```bash title="To print instanciated image info (containers) from inside the container:"
docker ps
```

### IDs

Image and containers have unique IDs, that can be obtained using `docker images`.
IDs can be used to:

- get images properties
- manipulate images

### Print history / layers of an image

```bash title="Print the layers used for a given image:"
docker history <IMAGE_ID>
```

!!! tip "Typing only the first unique digits of the ID is the same as copy-pasting the whole ID."

TO BE CONTINUED...
