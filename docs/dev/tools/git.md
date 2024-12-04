# Git

## Git Tags

!!! tip "Overview"

    Git tags are used to mark specific points in history as important, typically to indicate releases or milestones in a project.

!!! cite "Refs"

    [Git Basics - Tagging](https://git-scm.com/book/en/v2/Git-Basics-Tagging)

### List all tags

To list all the tags in the repository:  

```bash
git tag
```

### View tag details

To display detailed information about a specific tag (commit, author, date, etc.):  

```bash
git show <tag_name>
```

### Create a new tag

You can create two types of tags:

- **Lightweight tags**: A simple reference to a commit (no extra metadata).

  ```bash
  git tag <tag_name>
  ```

- **Annotated tags**: Include additional information such as the tagger's name, email, and a tagging message.

  ```bash
  git tag -a <tag_name> -m "<tagging_message>"
  ```

### Tag a specific commit

You can tag a particular commit by its hash. First, view commit history with `git log --pretty=oneline` to find the commit hash, then:  

```bash
git tag -a <tag_name> <commit_hash>
```

### Push a tag to remote

To push a specific tag to a remote repository:

```bash
git push origin <tag_name>
```

### Delete a local tag

To remove a tag locally:

```bash
git tag -d <tag_name>
```

### Fetch tags from remote

Fetch a tags from remote:

```bash
git fetch --tags
```

To fetch a specific tag:

```bash
git fetch origin <tag_name>
```

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
