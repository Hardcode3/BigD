# Wheels

## Overview

!!! info "What is this?"

      Wheels are a component of the Python ecosystem that helps to make package installs _just work_. 
      They allow for faster installations and more stability in the package distribution process.
      It is a type of built distribution (it comes in a ready to install form).

!!! success "Strengths"

      - Faster `pip install` installation process
            - Smaller in size than source distributions
            - Avoids the intermediate step of building packages off the source distribution
      - Avoids missing headers errors since building source distributions requires [OpenSSL](https://www.openssl.org/) development headers installed
      - No need for a compiler
      - Provide consistency
      - Can be used inside other repositories when the package is private or unreleased as dependencies in `requirements.txt`, therefore allowing to build the dependent software.
      - Provides a fixed snapshot of the Python library in time.

!!! error "Weaknesses"

      - Must be built for each platform by the developer: each package will provide a source and / or a wheel distribution (per platform) of the package.
      - If broken, then a full source build is required
      - Only for deployment

## How wheel is working

### What is Python wheel ?

Python wheel is a `.zip` file containing the built source code for a python package.

### Naming conventions

Packages names follows the rule `{dist}-{version}(-{build})?-{python}-{abi}-{platform}.whl`

Where:
- `dist` is the package name
- `version` is the installed package version `X.Y.Z`
- `python` is the python tag, denoting the python implementation
- `abi` is the ABI tag (Application Binary Interface)
- `platform` is the platform tag, containing the operating system, the SDK and the instruction set of architectures

`Universal wheel` are often pure python packages that does not require a specific ABI or specific CPU architecture and support Python 2 and 3 versions.
`Pure python wheels` support a specific major Python version.

!!! example "Universal Wheel"

      In the following wheel name:
      ```text
      chardet-3.0.4-py2.py3-none-any.whl
      ```
      The package is called `chardet` version `3.0.4`. It supports both python 2 and 3, does not require an Application Binary Interface and supports any platform.
      It is a `universal wheel` since any Python version is supported.

!!! example "Pure Wheel"

      In the following wheel name:
      ```text
      Jinja2-3.0.0a1-py3-none-any.whl
      ```
      The package is called `Jinja2` version `3.0.0a1`. It only supports python 3, does not require an Application Binary Interface and supports any platform.
      It is a `pure wheel` since only one Python version is supported.

!!! example "Platform Wheel: manylinux tag"

      In the following wheel name:
      ```text
      pandas-1.0.3-cp37-cp37m-manylinux1_x86_64.whl
      pandas-1.0.3-cp37-cp37m-manylinux1_i686.whl
      ```
      The package is called `pandas` version `1.0.3`. It only supports C Python 3.7, require an Application Binary Interface (for linux distributions) and supports `x86-64` and `i686` architectures.
            `manylinux` distributions use docker images to build sources for each linux distribution. There are multiple variants: `manylinux1`, `manylinux2010`, `manylinux2024` supporting different linux distros.

### PIP Commands

#### Install only using source distribution

To force the use of a source distribution, use the flag `python -m pip install --no-binary=:all: cryptography`.
Using `:all:` will enable this feature for all the dependencies of the project.

#### Install only using the binary / wheel distribution

To force the use of the wheel distributions, use the flag ``python -m pip install -only-binary=cryprography cryptography`.
Using the package name will only force the use of a wheel for the `cryptography` package.

#### Do not install or download a cached version

`pip download -no-cache numba` will download the version from the remote automatically.

### Building a pure Python wheel

1. Make sure to have `setuptools` and `wheel` installed on a given python version
2. Build a pure python wheel using `python setup.py sdist bdist_wheel`. It will create both a source distribution and a wheel distribution in the `dist` current directory.

#### Building a platform wheel

1. On mac OS, make sure to have command line dev tools available (`$ xcode-select --install`). On Windows, install the C++ build tools via Microsoft's website. On linux, make sure to have a compiler installed (gcc or g++).
2. Clone the project and build it using `python setup.py bdist_wheel`
3. It compiles and builds

#### Building manylinux wheel

To make the built distribution valid across a range of Linux clients, build using manylinux tag.

Two solutions here:

1. Run docker and mound the drive containing the repo
2. Use a CI/CD dev tool to build automatically the distribution

Here are the steps for the docker build:
1. Clone the project and cd into it
2. Define a few shell variables for the `manylinux1` Docker image 
```bash
$ DOCKER_IMAGE='quay.io/pypa/manylinux1_x86_64'
$ PLAT='manylinux1_x86_64'
```
3. Pull the Docker image and run the wheel-builder script within the container
```bash
$ docker pull "$DOCKER_IMAGE"
$ docker container run -t --rm \
      -e PLAT=$PLAT \
      -v "$(pwd)":/io \
      "$DOCKER_IMAGE" /io/travis/build-wheels.sh
```

!!! cite "PyPA example repository on GitHub [python-manylinux-demo](https://github.com/pypa/python-manylinux-demo)"

### Build a wheel from a repository

1. Clone the repo
2. Change directory to the root of the project
3. `python setup.py sdist bdist_wheel` (optionally specify where to place the distributions with the flag `--dist-dir` flag)
4. Distributions will be inside the `dist` directory.

!!! example "Real life examples"

      1. [**`lxml`**](https://github.com/lxml/lxml/blob/master/tools/manylinux/build-wheels.sh) uses a separate build script that’s invoked from within the `manylinux1` Docker container.
      2. [**`ultrajson`**](https://github.com/ultrajson/ultrajson/blob/master/.github/workflows/deploy-wheels.yml) does the same and uses GitHub Actions to call the build script.

## Integrate a wheel inside a requirements file

Wheel files can be integrated inside the `requirements.txt`, that specifies the dependencies of the project as well as their versions.
Simpy add a line, that points to the wheel in the repository.

For instance:

```
spotfunk-1.7.2.3-py3-none-any.whl
pandas==2.2.0
pytest==8.0.2
plotly~=5.20.0
setuptools~=72.1.0
wheel~=0.44.0
```

- The first line tells where the wheel is located in the project tree (here, at the root, aka. same level as the `requirements.txt` file).
- The next lines are classic requirements, specifying the versions of the packages

!!! warning "Large (few Mb) wheel files may not be versioned to avoid plumbing git."

## Refs

!!! cite "Refs"

      [Real Python](https://realpython.com/python-wheels/)
      https://pythonwheels.com/