# Bash basics

## About

!!! info "Bash (Bourne Again SHell) is a widely used shell and command language in Unix-like operating systems. It is the default shell for most Linux distributions and macOS."

## The language

### Shell prompt

Opening a terminal shows the prompt.
It typically ends

- with a dollar sign (`$`) for regular users
- with a hash (`#`) for the root user.

### Text editors for creating and modifying files

To open text files, integrated editors can be used, such as `nano` or `vim`:

```bash
nano filename
```

```bash
vim filename
```

### Asking for help

```bash
man command
```

```bash
command --help
```

### Running Scripts

!!! important "Each `.sh` script have to begin with a `shebang`."
    ```bash
    #!/bin/bash
    ```

And can be executed as follows:

```bash
./myscript.sh
# or
sh myscript.sh

```

### How bash works

Each time bash is executed, it runs one of the following scripts

- `/etc/profile`
- `/etc/bash.bashrc` provided its existence.

Then it searches:

- `~/.bash_login`
- `~/.bash_profile`
- `~/.profile` (only in non interactive shells without login)

When bash is exited, it runs `~/.bash_logout`

### Good practices

!!! info "Enclose variables into quotes"
    This practice will prevent from raising errors where the variable might be empty or contains spaces.
    Just use `if [ -z "$VENV_NAME" ] || [ -z "$VENV_PATH" ]; then` instead of `if [ -z $VENV_NAME ] || [ -z $VENV_PATH ]; then`.

### Environment variables

#### Home directory for the current user

```bash
echo $HOME

```

#### Current username

```bash
echo $USER
# or
echo $LOGNAME

```

#### Present Working Directory (PWD)

```bash
echo $PWD

```

#### PATH

List of directories where the shell looks for executables as a colon-separated list of directories.

```bash
echo $PATH

```

#### Path of the current shell

```bash
echo $SHELL

```

#### Terminal type

```bash
echo $TERM

```

#### Primary prompt string

Is the text displayed before each command.

```bash
echo $PS1

```

#### Hostname of the computer

```bash
echo $HOSTNAME
```

#### Operating System Type

```bash
echo $OSTYPE

```

#### Language and local settings

```bash
echo $LANG
echo $LC_COLLATE
# ... and others

```

#### User ID and effective user ID for the current user

```bash
echo $UID
echo $EUID

```

#### Version number of bash

```bash
echo $BASH_VERSION

```

#### Random number

Gets a random number between 0 and 32767.

```bash
echo $RANDOM

```

### Exploring and editing the files

#### Change directory

```bash
cd /path/to/directory
```

#### List files and directories

```bash
ls
```

#### Copy files and directories

```bash
cp file1 file2
```

#### Move or rename files or directories

```bash
mv oldfile newfile
```

#### Delete files

```bash
rm filename
```

#### Create a new directory

```bash
mkdir new_directory
```

#### Get the location of a file

```bash
# on git bash
where file_or_executable_append_to_path

#or 
# on ubuntu

whereis file_or_executable_append_to_path)
```

### Flux redirection

#### Redirect output to a file

```bash
echo "Hello, world!" output.txt
```

#### Redirect output to a variable

```bash
# Store the current date in the 'current_date' variable using command substitution
current_date=$(date)

# Display the result
echo "Current date is: $current_date"

```

#### Append output to a file

```bash
echo "More text" > output.txt
```

#### Pipe the output of one command as the input to another

```bash
command1 | command2
```

This procedure can be useful to chain operations.

#### Silence the output of a command

Both `stdout` and `stderr` (resp. standard output and standard error) can be redirected to `/dev/null` which is a file that discards data.

##### Redirect Both `stdout` and `stderr` to `/dev/null`

```bash
command /dev/null 2>&1

```

##### Redirect only `stdout` to `/dev/null`

```bash
command /dev/null

```

### Matching strings

#### Matches any sequence of characters

```bash
ls *.txt
```

#### Matches any single character

```bash
ls file?.txt
```

### Displaying some stuff

### Displaying variables

```bash
echo variable
```

#### Display the content of a file

```bash
cat filename
```

### Permissions and ownership

#### Change file permissions

```bash
chmod +x script.sh
```

#### Change file ownership.

```bash
chown user:group filename
```


### Objects

#### Variables

```bash
variable_name="value"

```

#### Arrays

##### Creation

```bash
# Method 1
array=("value1" "value2" "value3")

# Method 2
array[0]="value1"
array[1]="value2"
array[2]="value3"

```

##### Accessing

```bash
echo ${array[0]}   # prints "value1"
echo ${array[1]}   # prints "value2"

```

##### Iterating

```bash
array=("value1" "value2" "value3")

for element in "${array[@]}"; do
    echo $element
done

```

##### Array length

```bash
array=("value1" "value2" "value3")
length=${#array[@]}
echo "Array length: $length"

```

##### Appending

```bash
array=("value1" "value2")
array+=( "value3" "value4" )

```

##### Searching

```bash
array=("apple" "orange" "banana")

search_element="orange"
for element in "${array[@]}"; do
    if [ "$element" == "$search_element" ]; then
        echo "Element found: $search_element"
        break
    fi
done

```

##### Removing

```bash
array=("apple" "orange" "banana")
element_to_remove="orange"

array=("${array[@]/$element_to_remove}")

```

#### Functions

```bash
function_name() {
    # Code for the function
}

```

### Operators 

#### Comparison Operators

- `-eq`: Equal to
- `-ne`: Not equal to
- `-lt`: Less than
- `-le`: Less than or equal to
- `-gt`: Greater than
- `-ge`: Greater than or equal to

#### Logical Operators:

- `&&`: Logical AND
- `||`: Logical OR
- `!`: Logical NOT

### Statements

#### Conditional statements

##### If

```bash
if [ $a -gt $b ]; then
    echo "a is greater than b"
elif [ $a -lt $b ]; then
    echo "a is less than b"
else
    echo "a is equal to b"
fi

```

##### case

```bash
case $fruit in
    "apple")
        echo "It's an apple"
        ;;
    "orange" | "mandarin")
        echo "It's an orange or mandarin"
        ;;
    *)
        echo "Unknown fruit"
        ;;
esac

```

#### Loops

##### For

```bash
for i in {1..5}; do
    echo $i
done

```

##### While

```bash
count=1
while [ $count -le 5 ]; do
    echo $count
    ((count++))
done

```

##### Until

```bash
count=1
until [ $count -gt 5 ]; do
    echo $count
    ((count++))
done

```

##### Foreach

```bash
fruits=("apple" "orange" "banana")

for fruit in "${fruits[@]}"; do
    echo $fruit
done

```

##### Break and continue

Exit a loop prematurely using `break`:

```bash
for i in {1..10}; do
    if [ $i -eq 5 ]; then
        break
    fi
    echo $i
done
```

Skip the rest of the loop code to the next iteration using `continue`:

```bash
for i in {1..5}; do
    if [ $i -eq 3 ]; then
        continue
    fi
    echo $i
done
```

## Input flags handling

### Positional arguments

TODO

### Conditional arguments

TODO

## Script examples

[[Configure and build a CMake solution]]
[[Delete a folder properly]]
[[Run doxygen on a project]]
