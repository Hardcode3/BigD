# Docker-Compose

!!! info "Overview"
    Docker Compose is a tool for defining and managing multi-container Docker applications. It allows developers to use a YAML file to define the services, networks, and volumes needed to run an application, simplifying the management and orchestration of containers.

---

## Features

1. **Multi-Container Management**: Easily define and run applications with multiple containers.  
2. **YAML Configuration**: Use `docker-compose.yml` to declaratively define services, networks, and volumes.  
3. **Dependency Management**: Control service startup order using `depends_on`.  
4. **Networking**: Automatically creates networks for inter-service communication.  
5. **Environment Variables**: Support for `.env` files to configure environment-specific settings.  
6. **Shared Volumes**: Persist data and enable data sharing between containers.  
7. **Scaling**: Scale services horizontally using the `--scale` flag.  
8. **Simplified Commands**: Manage containers with commands like `up`, `down`, `logs`, etc.  
9. **Local Development**: Replicate production-like environments for local development.  
10. **Portability**: Share and reuse configurations for testing or deployment.

---

## Usage

```txt
Usage:  docker compose [OPTIONS] COMMAND

Define and run multi-container applications with Docker.

Options:
  --all-resources              Include all resources, even those not used by services
  --ansi string                Control when to print ANSI control characters ("never"|"always"|"auto") (default "auto")
  --compatibility              Run Compose in backward compatibility mode
  --dry-run                    Execute command in dry-run mode
  --env-file stringArray       Specify an alternate environment file
  -f, --file stringArray       Compose configuration files
  --parallel int               Control max parallelism, -1 for unlimited (default -1)
  --profile stringArray        Specify a profile to enable
  --progress string            Set type of progress output (auto, tty, plain, json, quiet) (default "auto")
  --project-directory string   Specify an alternate working directory (default: the path of the first Compose file)
  -p, --project-name string    Project name

Commands:
  attach      Attach to a service's running container
  build       Build or rebuild services
  config      Parse, resolve, and render the Compose file
  cp          Copy files between a service container and the local filesystem
  create      Create containers for a service
  down        Stop and remove containers, networks, etc.
  events      Receive real-time events from containers
  exec        Execute commands in running containers
  images      List images used by services
  kill        Force stop service containers
  logs        View container logs
  ls          List running Compose projects
  pause       Pause services
  port        Show container port mappings
  ps          List containers
  pull        Pull service images
  push        Push service images
  restart     Restart service containers
  rm          Remove stopped service containers
  run         Run a one-off command
  scale       Scale services
  start       Start services
  stats       Display live resource usage statistics
  stop        Stop services
  top         Display running processes
  unpause     Unpause services
  up          Create and start containers
  version     Show Docker Compose version information
  wait        Wait for service containers to stop
  watch       Monitor and rebuild containers on file changes

Run 'docker compose COMMAND --help' for detailed usage information.
```

---

## Docker-Compose Basics

### Launch Docker-Compose

#### For the First Time

Run the following command in the directory containing the `docker-compose.yml` file:

```bash
docker-compose up
```

#### Subsequent Runs

```bash
docker-compose start
```

- Add `-d` to run Docker Compose in detached mode:

  ```bash
  docker-compose up -d
  ```

### Show Logs

To view logs in detached mode:

```bash
docker-compose logs
```

> Exit with `Ctrl+C` (does not stop containers).

### Stop Docker-Compose
```bash
docker-compose stop
```

### Delete Docker-Compose Services

!!! warning "This will delete all containers created by the `docker-compose.yml` file, except for the volumes."

```bash
docker-compose down
```

To delete associated volumes:

```bash
docker-compose down -v
```

---

## Examples

### NGINX Server with PostgreSQL Database

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

This configuration:

- Defines three services: `web`, `app`, and `db`.
- Manages networking and volume sharing.
- Ensures service dependency management.

---

### WordPress with MySQL

#### With Mapped Volumes

```yaml
version: "3"
services:
  wordpress:
    image: wordpress:4.9
    ports:
      - 80:80
    environment:
      - WORDPRESS_DB_HOST=db
      - WORDPRESS_DB_USER=user1
      - WORDPRESS_DB_PASSWORD=user1pswd
      - WORDPRESS_DB_NAME=wordp
    networks:
      galaxie:
    volumes:
      - ./data/wp:/var/www/html
    restart: unless-stopped
  db:
    image: mysql:5.7
    environment:
      - MYSQL_ROOT_PASSWORD=blabla
      - MYSQL_DATABASE=wordp
      - MYSQL_USER=luke
      - MYSQL_PASSWORD=skywalker
    networks:
      - galaxie
    volumes:
      - ./data/db:/var/lib/mysql
networks:
  galaxie:
```

#### With Managed Volumes

Use named volumes for storage instead of local paths:

```yaml
version: "3"
services:
  wordpress:
    image: wordpress:4.9
    ports:
      - 80:80
    environment:
      - WORDPRESS_DB_HOST=db
      - WORDPRESS_DB_USER=user1
      - WORDPRESS_DB_PASSWORD=user1pswd
      - WORDPRESS_DB_NAME=wordp
    networks:
      galaxie:
    volumes:
      - wp:/var/www/html
    restart: unless-stopped
  db:
    image: mysql:5.7
    environment:
      - MYSQL_ROOT_PASSWORD=blabla
      - MYSQL_DATABASE=wordp
      - MYSQL_USER=luke
      - MYSQL_PASSWORD=skywalker
    networks:
      - galaxie
    volumes:
      - db:/var/lib/mysql
volumes:
  wp:
  db:
networks:
  galaxie:
```

The key difference is using named volumes (`wp` and `db`) instead of mapped local paths (`./data/wp` and `./data/db`).
