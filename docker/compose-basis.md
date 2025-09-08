# Complete List of `docker-compose` Commands with Explanations

## Overview

`docker-compose` is a tool for defining and running multi-container Docker applications. It allows you to manage services, networks, and volumes defined in a `docker-compose.yml` file.

## General Syntax

```sh
docker-compose [COMMAND] [OPTIONS]
```

To see the full list of commands, run:

```sh
docker-compose --help
```

---

## **1. Basic Commands**

| Command                  | Description                                       | Example                  |
| ------------------------ | ------------------------------------------------- | ------------------------ |
| `docker-compose up`      | Create and start containers                       | `docker-compose up -d`   |
| `docker-compose down`    | Stop and remove containers, networks, and volumes | `docker-compose down`    |
| `docker-compose start`   | Start existing stopped containers                 | `docker-compose start`   |
| `docker-compose stop`    | Stop running containers                           | `docker-compose stop`    |
| `docker-compose restart` | Restart all services                              | `docker-compose restart` |
| `docker-compose ps`      | List containers in the current project            | `docker-compose ps`      |

---

## **2. Build & Image Management**

| Command                 | Description                         | Example                 |
| ----------------------- | ----------------------------------- | ----------------------- |
| `docker-compose build`  | Build or rebuild services           | `docker-compose build`  |
| `docker-compose pull`   | Pull service images from a registry | `docker-compose pull`   |
| `docker-compose push`   | Push service images to a registry   | `docker-compose push`   |
| `docker-compose config` | Validate and view the compose file  | `docker-compose config` |

---

## **3. Logs & Debugging**

| Command                 | Description                                 | Example                  |
| ----------------------- | ------------------------------------------- | ------------------------ |
| `docker-compose logs`   | View logs of running services               | `docker-compose logs -f` |
| `docker-compose top`    | Display processes running inside containers | `docker-compose top`     |
| `docker-compose events` | Monitor real-time events from containers    | `docker-compose events`  |

---

## **4. Executing Commands in Containers**

| Command               | Description                              | Example                      |
| --------------------- | ---------------------------------------- | ---------------------------- |
| `docker-compose exec` | Run a command inside a running container | `docker-compose exec web sh` |
| `docker-compose run`  | Run a one-off command in a new container | `docker-compose run web ls`  |

---

## **5. Volume & Network Management**

| Command                          | Description                      | Example                                    |
| -------------------------------- | -------------------------------- | ------------------------------------------ |
| `docker-compose volume ls`       | List volumes used in the project | `docker volume ls`                         |
| `docker-compose network ls`      | List networks created by Compose | `docker network ls`                        |
| `docker-compose network inspect` | View details about a network     | `docker-compose network inspect mynetwork` |

---

## **6. Cleaning & Resource Management**

| Command                  | Description                         | Example                  |
| ------------------------ | ----------------------------------- | ------------------------ |
| `docker-compose rm`      | Remove stopped containers           | `docker-compose rm`      |
| `docker-compose down -v` | Remove containers and volumes       | `docker-compose down -v` |
| `docker-compose stop`    | Stop services without removing them | `docker-compose stop`    |

---

## **Conclusion**

This document provides a comprehensive list of `docker-compose` commands with explanations. Mastering these commands will help you efficiently manage multi-container applications. 🚀
