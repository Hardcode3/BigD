# Python environment

## Introduction

Python is an [[#Interpreted languages]], meaning it needs an environment to work properly.
Other programming languages can require a compilation phase to transform the code in binary instructions for the computer. Theses are called the [[#Compiled languages]].
There are also other programming languages execution methods that will not be detailed here (JIT, semi-interpreted, ...).

There are mainly 3 ways to create an environment for Python:

- Using the base (global) environment
- Using a virtual environment
- Using an anaconda environment

Each methods has its features and drawbacks, which will be detailed below.
The choice depends largely on the use case.

## Executing Python code

Python files are simply text files with a `.py` extension.
They can be executed in a terminal / shell / console called [[#Command-Line Interface (CLI)]] on your system.

!!! info "There are several command-line interfaces to be aware of:"
    For windows:

    1. **Command Prompt (cmd):** The traditional Windows command-line interface.
    2. **PowerShell:** A more powerful and modern shell with scripting capabilities.
    3. **Windows Subsystem for Linux (WSL):** Allows running a Linux distribution alongside Windows. Once installed, you can use Linux terminals like `bash`.

    For Linux:

    1. **Bash:** The default shell for most Linux distributions.
    2. **GNOME Terminal:** Commonly used on systems running the GNOME desktop environment.
    3. **Konsole:** The default terminal emulator for the KDE desktop environment.
    4. **xterm:** A simple and widely used terminal emulator in X Window System.

    For macOS

    1. **Terminal:** The default terminal emulator for macOS, which uses the Bash shell by default.
    2. **iTerm2:** A popular alternative to the default Terminal app, providing additional features and customization options.
    3. **Zsh (with Oh My Zsh):** Zsh is an alternative shell to Bash and can be used with macOS. Many users enhance it further using the Oh My Zsh framework.

Code can also be executed in an  (Spyder, PyCharm, VSCode, ...).

In any of these scenarios, you need an [[#Integrated Development Environment (IDE)]] to be able to execute Python code.

## How to call Python ?

The Python base environment is the one that comes installed with your Python distribution.

- You can find the different Python versions on the [official website](https://www.python.org/).
- You can install multiple versions of Python on your system and be able to use them only if its a different major version. (3.9.1 can not be installed if 3.9.4 is already installed, but 3.11 can).

Installing a Python version will lead to a clean, empty from libraries environment.
Therefore you can not use any external librairies ([numpy](https://numpy.org/), [scipy](https://scipy.org/), [matplotlib](https://matplotlib.org/stable/), ...).
You need first to install librairies.

!!! warn "Python can only be called from the console if"

    1. You specify the absolute path
    2. You add Python executable to the PATH variables of your computer

!!! warn "How to call Python ?"
    An example to get the Python version.

    - If you have a single Python version installed, use:
      - `python --version` (often)
      - `python3 --version` (if `python` is not found)
      - if `python` is still not found, it means that it is not installed on your system or that you have not added it to the PATH
    - If you have multiple Python distributions installed, use the [[#py launcher]] (must be installed):
      - `py -3.9 -m --version` (you can specify the version you need with a minus before and only two numbers)

## Python base environment

Using the Python base environment typically means working with the global Python installation on your system without creating a virtual environment. Here are the general steps for using the Python base environment:

### 1. Check Python Installation

Ensure that Python is installed on your system. Open a terminal or command prompt and type:

```bash
python --version
```

This should display the version number of the installed Python interpreter.

### 2. Create and Navigate to Your Project Directory

Create a directory for your project and navigate to it using the `cd` command:

```bash
mkdir my_project
cd my_project
```

### 3. Write Your Python Code

Create a Python script or write your Python code directly in a file within the project directory. You can use any text editor or integrated development environment (IDE) of your choice.

For example, create a file named `my_script.py` and add the following code:

```python
print("Hello, Python base environment!")
```

### 4. Run Your Python Script

Run your Python script from the terminal or command prompt:

```bash
python my_script.py
```

This will execute your Python script, and you should see the output.

### Important Notes

!!! warning

    - When working with the Python base environment, you are using the global Python installation on your system. Any packages you install using `pip` will be installed globally.
    - It's recommended to use virtual environments for project-specific dependencies to avoid conflicts and ensure better isolation between projects.
    - The commands used (`python` and `pip`) refer to the global Python installation. If you have multiple Python versions installed, you may need to specify the version (e.g., `python3`, `pip3`) to ensure you're using the desired interpreter.
    - Keep in mind that installing packages globally may require administrative (sudo) permissions on Linux/macOS systems.

!!! note

    While using the Python base environment is straightforward, virtual environments are generally preferred for Python development to manage dependencies on a per-project basis. Virtual environments provide better isolation and avoid potential conflicts between different projects or system-wide Python installations.

## Python virtual environment

Using a Python virtual environment is a good practice for managing project-specific dependencies. Here are the general steps for creating and using a virtual environment in Python:

### 1. Install `virtualenv` (if not already installed)

If you don't have the `virtualenv` package installed, you can install it using the following command:

```bash
pip install virtualenv
```

### 2. Create a Virtual Environment

Navigate to your project directory in the terminal or command prompt and run the following command to create a virtual environment named "venv_spotfunk":

#### For Windows

```bash
python -m venv venv_spotfunk
```

#### For Linux/macOS

```bash
python3 -m venv venv_spotfunk
```

### 3. Activate the Virtual Environment

Activate the virtual environment. The activation commands differ based on the operating system:

#### For Windows

```bash
./venv_spotfunk/Scripts/activate
```

#### For Linux/macOS

```bash
source venv_spotfunk/bin/activate
```

After activation, your command prompt or terminal prompt should change, indicating that you are now working within the virtual environment.

### 4. Use Python and Install Packages

Now that you are in the virtual environment, any Python-related commands and package installations will be isolated to this environment. For example:

- Run Python:

    ```bash
    python
    ```

- Install packages using `pip`:

    ```bash
    pip install package_name
    ```

### 5. Deactivate the Virtual Environment

When you're done working in the virtual environment, you can deactivate it:

```bash
deactivate
```

### Important Notes

!!! warning

    - Always activate the virtual environment before working on your project to ensure you're using the isolated environment.
    - Include the virtual environment directory (`venv` in this case) in your project's `.gitignore` file or equivalent, so you don't accidentally commit it to version control.
    - Each project should have its own virtual environment to avoid conflicts between different projects.
    - The virtual environment needs to be reactivated each time you start a new terminal or command prompt session.

!!! note

    Using virtual environments is a standard practice in Python development to manage dependencies and ensure project-specific consistency. It helps keep your project isolated and reduces potential conflicts between different projects or system-wide Python installations.

## Anaconda environment

Anaconda is a popular distribution for Python and other programming languages commonly used in data science and scientific computing. It includes many pre-installed libraries and tools to simplify the setup for data-related tasks. Here are the steps to use Anaconda with Python:

### 1. Install Anaconda

Visit the [Anaconda website](https://www.anaconda.com/products/distribution) and download the Anaconda distribution suitable for your operating system (Windows, macOS, or Linux). Follow the installation instructions provided on the website.

### 2. Open Anaconda Navigator (Optional)

Anaconda Navigator is a graphical interface that comes with the Anaconda distribution. You can use it to manage environments, install packages, and launch applications. After installation, you can open Anaconda Navigator from the Start menu (Windows) or the Applications folder (macOS).

### 3. Create and Manage Environments

One of the key features of Anaconda is the ability to create and manage isolated environments. Environments allow you to install specific packages for different projects without interfering with each other. You can create a new environment using the following command in the terminal or command prompt:

```bash
conda create --name myenv
```

Replace `myenv` with the desired name for your environment. You can also specify the Python version and additional packages during the environment creation.

Activate the environment:

- On Windows:
  ```bash
  conda activate myenv
  ```
- On macOS/Linux:
  ```bash
  source activate myenv
  ```

### 4. Install Packages

Once you have activated your environment, you can use `conda install` to install packages. For example, to install a package named `numpy`, you can run:

```bash
conda install numpy
```

### 5. Use Jupyter Notebooks (Optional)

Anaconda comes with Jupyter Notebooks, a popular interactive computing environment. You can launch Jupyter Notebooks from the Anaconda Navigator or directly from the terminal:

```bash
jupyter notebook
```

This will open a web browser with the Jupyter Notebook interface, allowing you to create and run Python notebooks.

### 6. Update Anaconda and Packages

Regularly update Anaconda and the installed packages to benefit from the latest features and bug fixes. You can use the following commands:

```bash
conda update conda
conda update anaconda
```

To update a specific package:

```bash
conda update package_name
```

### 7. Deactivate the Environment

When you're done working in an environment, deactivate it using the following command:

- On Windows:
  ```bash
  conda deactivate
  ```
- On macOS/Linux:
  ```bash
  source deactivate
  ```

These are the basic steps to get started with Anaconda and Python. Anaconda provides a convenient environment for data science and scientific computing, making it easier to manage dependencies and create reproducible environments for your projects.

## Other environments

Apart from the base Python environment, virtual environments, and Anaconda environments, there are other environments or tools that developers and data scientists use for managing Python environments. Some of them include:

### 1. **Pipenv:**

[Pipenv](https://pipenv.pypa.io/) is a tool for managing Python environments, dependencies, and packaging in a single file. It aims to bring the best of all packaging worlds (bundled, required, and development) to the Python world.

### 2. **Poetry:**

[Poetry](https://python-poetry.org/) is a modern dependency management and packaging tool for Python. It simplifies and centralizes the configuration of your projects, including dependency management, packaging, and publishing.

### 5. **pyenv:**

[pyenv](https://github.com/pyenv/pyenv) allows you to easily install and switch between multiple versions of Python. It's particularly useful for managing different Python versions on your system.

### 6. **pip (package installer):**

While not an environment management tool itself, the `pip` package installer can be used with `requirements.txt` files to specify and install dependencies for a project. Tools like `pip-tools` can help manage dependencies more efficiently.

These tools offer various features and approaches to creating, managing, and isolating Python environments. The choice of which one to use depends on your specific needs and preferences. Some developers prefer the simplicity of `venv`, while others may choose more feature-rich tools like `Pipenv` or `Poetry` for managing dependencies and packaging. Conda is often favored in data science and scientific computing due to its ability to handle non-Python libraries and its cross-platform support.

## Definitions

### Interpreted languages

!!! info Interpreted language
An interpreted language is a type of programming language in which the source code is not directly translated into machine code before execution. Instead, an interpreter reads and executes the code line by line or statement by statement at runtime. This means that the source code is translated and executed on the fly, without the need for a separate compilation step.
In an interpreted language, the interpreter interprets the code and executes the instructions directly, which can make the development process more flexible and interactive. Developers can write and test code quickly without the need to compile the entire program before running it. However, interpreted languages may have slightly slower execution compared to languages that are compiled to machine code. 
Examples of interpreted languages include Python, JavaScript, Ruby, and PHP. These languages are often used for scripting, rapid prototyping, and applications where development speed and ease of use are prioritized over raw performance.

### Compiled languages

!!! info Compiled language
  
A compiled language is a type of programming language where the source code is translated into machine code or an intermediate code by a compiler before execution. The compiler analyzes the entire source code and translates it into a form that can be executed by the computer's hardware.
Unlike interpreted languages, compiled languages undergo a separate compilation step before running the program. This compilation process generates an executable file or another form of code that is specific to the target machine's architecture. Once the compilation is complete, the resulting binary file can be executed without the need for the original source code or the presence of the compiler.
Compiled languages often provide better performance at runtime compared to interpreted languages because the code has already been translated into machine code optimized for the target platform. Examples of compiled languages include C, C++, Java (which is compiled to bytecode and then interpreted by the Java Virtual Machine), and Rust. These languages are often used for system-level programming, application development, and scenarios where performance is a critical factor.

### Command-Line Interface (CLI)

!!! info Command-Line Interface (CLI)
A Command-Line Interface (CLI) is a text-based interface used for interacting with software and computer systems by entering commands into a text terminal or console. Users interact with the system by typing commands, and the system responds with textual output. CLI is an alternative to Graphical User Interfaces (GUIs), which use graphical elements like buttons and windows for user interaction.
Key characteristics of command-line interfaces include

1. **Text Commands:** Users input commands by typing text-based instructions. Commands often consist of a command name followed by parameters or options.
2. **Scripting:** CLIs are conducive to scripting, allowing users to automate repetitive tasks by creating scripts that execute sequences of commands.
3. **Resource Efficiency:** CLIs typically use fewer system resources than GUIs, making them suitable for use on servers, embedded systems, and environments where resource efficiency is crucial.
4. **Scriptable and Automatable:** CLIs are scriptable, meaning users can create scripts to automate tasks and perform complex operations.
5. **Remote Access:** CLIs are well-suited for remote access and administration, allowing users to connect to a remote system over a network and execute commands.
6. **Learning Curve:** For some users, CLIs may have a steeper learning curve compared to GUIs, as users need to memorize commands and their syntax. However, they often provide more control and efficiency once mastered.

Examples of command-line interfaces include:

- **Command Prompt (cmd):** Found on Windows systems, it provides a text-based interface for entering commands.
- **Terminal:** Found on Unix-like systems (Linux and macOS), it allows users to interact with the shell and execute commands.
- **PowerShell:** On Windows, it is a more advanced and scriptable shell and command language.
- **Bash:** The default shell on many Unix-like systems, including Linux and macOS.

Users can perform various tasks through the command line, such as file manipulation, system configuration, software installation, and more. CLIs remain popular in many technical fields, including software development, system administration, and networking, where precise control and automation are essential.

### Integrated Development Environment (IDE)

!!! info Integrated Development Environment (IDE)
An IDE, or Integrated Development Environment, is a software application that provides comprehensive facilities to programmers for software development. It typically combines a code editor, a debugger, and a build automation tool, along with other features such as version control integration, project management, and collaboration tools. The primary purpose of an IDE is to streamline and enhance the process of writing, testing, and debugging code.
Key components of an IDE include:

1. **Code Editor:** A text editor specifically designed for writing and editing source code. It often includes features like syntax highlighting, code completion, and error checking.
2. **Debugger:** A tool for inspecting and debugging code. It allows developers to set breakpoints, step through code execution, and examine variable values during runtime.
3. **Compiler/Interpreter:** Some IDEs include built-in support for compiling and running code. For interpreted languages, they may include an interpreter or provide seamless integration with an external interpreter.
4. **Build Automation:** Facilities for automating the process of building and compiling code into executable files or deployable artifacts.
5. **Version Control Integration:** Integration with version control systems (e.g., Git, SVN) to manage source code changes and collaboration among developers.
6. **Project Management:** Tools for organizing and managing project files, dependencies, and configurations.
7. **User Interface:** A user-friendly interface that brings together all the development tools and features into a cohesive environment.

Popular IDEs include:

- **Visual Studio (Visual Studio Code):** Developed by Microsoft, Visual Studio is a comprehensive IDE for various languages, and Visual Studio Code is a lightweight, extensible code editor.
- **Eclipse:** An open-source IDE primarily used for Java development but supports various languages through plugins.
- **IntelliJ IDEA:** A popular Java IDE developed by JetBrains, with support for other languages through plugins.
- **PyCharm:** A Python-specific IDE developed by JetBrains.
- **Xcode:** Apple's IDE for macOS and iOS development.

IDEs significantly enhance productivity by providing a centralized and efficient environment for software development, allowing developers to manage various aspects of the development lifecycle within a single application.

### py launcher

!!! info The py launcher
The `py` launcher is a tool that allows you to manage and launch Python versions on Windows. If it's installed, you can use it from the command prompt or PowerShell to run Python scripts or interact with different Python versions. Here's how you can call the `py` launcher:

1. Open the Command Prompt or PowerShell on your Windows system.

2. To run a Python script using the default Python version, you can simply use:

    ```bash
    py script.py
    ```

   Replace `script.py` with the name of your Python script.

3. If you want to specify a particular Python version, you can use the `-X` option followed by the version number, like this:

    ```bash
    py -X.Y script.py
    ```

   Replace `X.Y` with the desired Python version, such as `3.8`.

If the `py` launcher is not installed or not available, you can still run Python scripts by using the full path to the Python executable. The default installation path for Python on Windows is usually something like:

```bash
C:\Users\YourUsername\AppData\Local\Programs\Python\Python3X\python.exe
```

Replace `YourUsername` with your actual username, and `X` with the specific Python version number.

Alternatively, you can add the Python installation directory to the system's PATH environment variable, which allows you to run `python` directly from the command prompt without specifying the full path. Once added to the PATH, you can use:

```bash
python script.py
```

Make sure to adjust the commands based on your Python version and script filename.

To check if the `py` launcher is installed, you can try running `py --version` from the command prompt or PowerShell. If it's not installed, you can install it by downloading and installing the latest version of Python from the official Python website (https://www.python.org/downloads/), making sure to check the option that says "Add Python to PATH" during installation.
