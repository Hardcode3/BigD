# Mac Setup for Software Development

## Install Homebrew

Homebrew is a package manager for macOS. Install it by running:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

---

## Install Docker

Docker is essential for containerization and running apps in isolated environments.

```bash
brew install --cask docker
```

---

## Install VSCode & Add to Path

### Step 1: Install VSCode

Install Visual Studio Code and make sure it’s available in your terminal's path:

```bash
brew install --cask visual-studio-code
```

### Step 2: Add VSCode to the PATH

Add vscode to the path using the command palette: `shell command: install code command in PATH`.

---

## Install Xcode Command Line Tools

Xcode Command Line Tools are required for development on macOS, providing compilers and other necessary utilities.

```bash
xcode-select --install
```

---

## Install Pyenv (Python Version Management)

Pyenv is used to manage multiple versions of Python.

### Step 1: Install dependencies required for Pyenv

```bash
brew install xz zlib
```

### Step 2: Install Pyenv

```bash
brew install pyenv
```

### Step 3: Add Pyenv to your shell configuration (`~/.zshrc`) to make it available in your terminal

```bash
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
```

---

## Install Pyenv Virtualenv (for Managing Python Environments)

Pyenv Virtualenv helps create and manage isolated Python environments.

```bash
brew install pyenv-virtualenv
```

Add the following to your `~/.zshrc`:

```bash
eval "$(pyenv virtualenv-init -)"
```

---

## Install Oh My Zsh (Improved Terminal Experience)

Oh My Zsh offers plugins, themes, and various enhancements for the Zsh shell.

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

---

## Install Zsh Plugins

Enhance your terminal experience by adding useful Zsh plugins.

### Zsh Autosuggestions

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### Zsh Syntax Highlighting

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

To enable these plugins, edit your `~/.zshrc` file.
Find a line starting by plugins=(git) and fill with the desired plugins:

```bash
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
```

---

## Install Terminal Fonts

Install a preferred font for the terminal to improve readability and aesthetics.

```bash
brew install --cask font-0xproto
```

---

## Install CMake

CMake is used to manage and configure build processes in software development.

```bash
brew install cmake
```

---

## Install Vcpkg (C++ Package Manager)

Vcpkg is a package manager for C++ libraries.

### Step 1: Clone and install Vcpkg

```bash
git clone https://github.com/microsoft/vcpkg.git ~/.dev/vcpkg
cd ~/.dev/vcpkg
./bootstrap-vcpkg.sh
```

### Step 2: Add Vcpkg to your `~/.zshrc` to make it available globally

```bash
echo 'export PATH="$PATH:~/.dev/vcpkg"' >> ~/.zshrc
```

---

## Configure Git

Set up your global Git configuration with your user details and preferred editor.

```bash
git config --global user.name "Baptiste Penot"
git config --global user.email "baptiste.penot@gmail.com"
git config --global core.editor "code"
```

---

## Install Tree Command

The `tree` command allows you to visualize directory structures in a tree format.

```bash
brew install tree
```

---

## Install Unison (file sync)

Allows for synchronizing two directories.

Used to sync an external disk with the local document folder.

```bash
brew install unison
```

Setup the unison profile, located in `/Library/Application Support/Unison` by first opening the folder.

Create a file that will have the profile name `sync_t5.prf` for instance.

Add the following content:

```unison
# Unison Profile for syncing an external disk
root = /Volumes/BaptisteT5/DOCUMENTS
root = /Users/baptistepenot/Documents

# Sync options
auto = true
batch = true
prefer = newer
fastcheck = true

# This disk uses the ExFAT file system
fat = true

ignore = Name *.swp         # Fichiers temporaires de Vim
ignore = Name *~            # Fichiers temporaires classiques
ignore = Name *.bak         # Fichiers de sauvegarde
ignore = Name *.DS_Store*   # Fichiers macOS inutiles
ignore = Name .localized    # ?
ignore = Name *.unison*     # unsion temporary files
ignore = Name Thumbs.db     # Fichiers Windows inutiles
```

Launch unison using:

```shell
unison sync-t5 -batch
```

or optionaly, use a script:

```bash
#!/bin/zsh

# Define the external drive name (e.g., "BaptisteT5")
DRIVE_NAME="BaptisteT5"

# Check if the folder for the external drive exists under "/Volumes"
if [ -d "/Volumes/$DRIVE_NAME" ]; then
    # Run Unison in batch mode silently in the background
    /opt/homebrew/bin/unison sync-t5 -batch
else
    # Print a message if the directory doesn't exist
    echo "Drive $DRIVE_NAME not found! Please connect the external drive."
fi
```

---

## Install LaTeX

If you need to work with LaTeX, install a minimal distribution.

```bash
brew install --cask basictex
```

---

## Install Other Essential Apps

To enhance productivity, install the following apps:

- WhatsApp (messaging)
- Spark (email client)
- Obsidian (note-taking)

You can install these via Homebrew or directly from their respective websites.

---
