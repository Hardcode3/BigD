# Git

## Git modules

### Add a git module

```bash
## initialize a git repository
git init

## add a git module to project
git submodule add -b <branch_name> --name <module_name> <url> <path>
```

Example:

```bash
git submodule add -b docking --name imgui https://github.com/ocornut/imgui.git external/imgui
```

The former lines of code will clone the repository Imgui from the given URL in the folder `external/imgui` even if not already existing using the name imgui.
A hidden .gitmodules file should appear alongside the .git folder and contains the newly added git modules:

```text .gitmodules
[submodule "glfw"]
        path = external/glfw
        url = https://github.com/glfw/glfw.git
        branch = master
```

Add some more gitmodules by repeating the process.

### Clone a project having submodules

#### Clone sudmodules with the project

```bash
git clone --recursive <URL>
```

By using this command, every submodule of the project will be initialized during the cloning procedure of the main project.

#### Clone submodules in a differed way

TODO

### Delete a module from the git repository

A very helpful github gist is available [here](https://gist.github.com/myusuf3/7f645819ded92bda6677)

```bash
## Remove the submodule entry from .git/config
git submodule deinit -f path/to/submodule

## Remove the submodule directory from the superproject's .git/modules directory
rm -rf .git/modules/path/to/submodule

## Remove the entry in .gitmodules and remove the submodule directory located at path/to/submodule
git rm -f path/to/submodule
```
