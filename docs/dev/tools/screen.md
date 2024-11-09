# Screen (UNIX)

!!! info "screen` is a powerful terminal multiplexer that allows you to manage multiple terminal sessions within a single window. This is particularly useful when you are working on a remote server or need to detach and reattach to sessions."

## 1. **Installation**

If `screen` is not already installed on your Linux system, you can install it using the package manager for your distribution. For example:

- On Ubuntu/Debian:

    ```bash
    sudo apt-get update
    sudo apt-get install screen
    ```

- On CentOS/RHEL:

    ```bash
    sudo yum install screen
    ```

## 2. **Starting a Screen Session:**

To start a new `screen` session, open a terminal and type:

```bash
screen
```

## 3. **Working within the Screen Session:**

Once inside a `screen` session, you can use it like a regular terminal. Run your commands, open multiple windows, or split the screen.

- **Create a new window:** Press `Ctrl-a` followed by `c`.

- **Switch between windows:** Press `Ctrl-a` followed by a number corresponding to the window number.

- **Split the screen horizontally:** Press `Ctrl-a` followed by `S`.

- **Split the screen vertically:** Press `Ctrl-a` followed by `|`.

- **Navigate between split regions:** Press `Ctrl-a` followed by `Tab`.

## 4. **Detach from a Screen Session:**

To detach from a `screen` session and leave it running in the background, press:

```bash
Ctrl-a d
```

## 5. **Reattach to a Screen Session:**

To reattach to a detached `screen` session, list the available sessions:

```bash
screen -ls
```

You will see a list of detached sessions. Reattach to a session by specifying its ID:

```bash
screen -r <session_id>
```

## 6. **Exiting a Screen Session:**

To exit a `screen` session, simply exit all shells within it, and when the last shell is closed, the `screen` session will terminate.

If you want to close a `screen` session even if there are multiple windows or shells running, press `Ctrl-a` followed by `:` to bring up the command prompt and type `quit` or `exit`.

These are the basic commands to get started with `screen`. It's a versatile tool that provides a lot of functionality for managing terminal sessions, and you can customize it based on your needs.
