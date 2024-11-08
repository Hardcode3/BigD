# VCPKG

## Description

!!! info "vcpkg is a C and C++ dependency manager from Microsoft."
    It works for all platforms, buildsystems and workflows.
    Works with [CMake](https://cmake.org/cmake/help/latest/guide/tutorial/index.html).

## Useful links

- [Official website](https://vcpkg.io/en/index.html)
- [Github repository](https://github.com/microsoft/vcpkg)

## How to install

### Windows

- clone the repository

```git
git clone https://github.com/microsoft/vcpkg
```

- execute the cmd script

```cmd
\vcpkg\bootstrap-vcpkg.bat
```

- add vcpkg to the PATH: go to the environment variables and add vcpkg to PATH.
- to search for a specific package:

```cmd
.\vcpkg\vcpkg search [search term]
```

- to install a package; type:

```cmd
.\vcpkg\vcpkg install [package name]:x64-windows
```

- to use vcpkg with Visual Studio, run:

```cmd
.\vcpkg\vcpkg integrate install
```

### List of useful packages

- [ImGui](https://github.com/ocornut/imgui)
- [GLFW](https://www.glfw.org/)
- [Eigen](https://eigen.tuxfamily.org/index.php?title=Main_Page)
