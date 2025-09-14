# Complete List of `docker` Commands with Explanations

## Overview

`docker` is the command-line tool for interacting with Docker containers. It allows you to build, run, manage, and troubleshoot containerized applications.

## General Syntax

```sh
docker [COMMAND] [OPTIONS]
```

To see the full list of commands, run:

```sh
docker --help
```

---

## **1. Docker Container Management Commands**

| Command          | Description                                 | Example                           |
| ---------------- | ------------------------------------------- | --------------------------------- |
| `docker run`     | Run a new container                         | `docker run -d nginx`             |
| `docker start`   | Start a stopped container                   | `docker start my-container`       |
| `docker stop`    | Stop a running container                    | `docker stop my-container`        |
| `docker restart` | Restart a container                         | `docker restart my-container`     |
| `docker rm`      | Remove a container                          | `docker rm my-container`          |
| `docker ps`      | List running containers                     | `docker ps -a`                    |
| `docker logs`    | View logs of a container                    | `docker logs my-container`        |
| `docker exec`    | Run a command inside a running container    | `docker exec -it my-container sh` |
| `docker inspect` | Show detailed information about a container | `docker inspect my-container`     |
| `docker top`     | Display running processes in a container    | `docker top my-container`         |

---

## **2. Docker Image Management Commands**

| Command         | Description                       | Example                                |
| --------------- | --------------------------------- | -------------------------------------- |
| `docker images` | List available images             | `docker images`                        |
| `docker pull`   | Download an image from Docker Hub | `docker pull nginx`                    |
| `docker push`   | Upload an image to a registry     | `docker push myrepo/myimage`           |
| `docker rmi`    | Remove an image                   | `docker rmi my-image`                  |
| `docker build`  | Build an image from a Dockerfile  | `docker build -t myimage .`            |
| `docker tag`    | Tag an image                      | `docker tag myimage myrepo/myimage:v1` |
| `docker save`   | Save an image to a tar file       | `docker save -o myimage.tar myimage`   |
| `docker load`   | Load an image from a tar file     | `docker load -i myimage.tar`           |

---

## **3. Docker Network Management Commands**

| Command                     | Description                           | Example                                             |
| --------------------------- | ------------------------------------- | --------------------------------------------------- |
| `docker network ls`         | List networks                         | `docker network ls`                                 |
| `docker network create`     | Create a new network                  | `docker network create my-network`                  |
| `docker network inspect`    | View network details                  | `docker network inspect my-network`                 |
| `docker network connect`    | Connect a container to a network      | `docker network connect my-network my-container`    |
| `docker network disconnect` | Disconnect a container from a network | `docker network disconnect my-network my-container` |
| `docker network rm`         | Remove a network                      | `docker network rm my-network`                      |

---

## **4. Docker Volume Management Commands**

| Command                 | Description              | Example                           |
| ----------------------- | ------------------------ | --------------------------------- |
| `docker volume ls`      | List volumes             | `docker volume ls`                |
| `docker volume create`  | Create a volume          | `docker volume create my-volume`  |
| `docker volume inspect` | View details of a volume | `docker volume inspect my-volume` |
| `docker volume rm`      | Remove a volume          | `docker volume rm my-volume`      |
| `docker volume prune`   | Remove unused volumes    | `docker volume prune`             |

---

## **5. Docker System & Prune Commands**

| Command               | Description                                 | Example                  |
| --------------------- | ------------------------------------------- | ------------------------ |
| `docker system df`    | Show disk usage by Docker                   | `docker system df`       |
| `docker system prune` | Remove unused resources                     | `docker system prune -a` |
| `docker system info`  | Show system-wide Docker information         | `docker system info`     |
| `docker stats`        | Show live container resource usage          | `docker stats`           |
| `docker events`       | Get real-time events from the Docker daemon | `docker events`          |

---

## **6. Docker Compose Commands**

| Command                  | Description                      | Example                  |
| ------------------------ | -------------------------------- | ------------------------ |
| `docker-compose up`      | Start services in a Compose file | `docker-compose up -d`   |
| `docker-compose down`    | Stop and remove Compose services | `docker-compose down`    |
| `docker-compose restart` | Restart all services             | `docker-compose restart` |
| `docker-compose logs`    | View logs of Compose services    | `docker-compose logs`    |
| `docker-compose ps`      | List services managed by Compose | `docker-compose ps`      |
| `docker-compose build`   | Build or rebuild services        | `docker-compose build`   |

---

## **7. Docker Security and User Permissions**

| Command                | Description                    | Example                              |
| ---------------------- | ------------------------------ | ------------------------------------ |
| `docker login`         | Log in to a Docker registry    | `docker login myregistry.com`        |
| `docker logout`        | Log out from a Docker registry | `docker logout`                      |
| `docker trust inspect` | View image trust data          | `docker trust inspect myimage`       |
| `docker trust sign`    | Sign an image                  | `docker trust sign myrepo/myimage`   |
| `docker trust revoke`  | Remove trust for an image      | `docker trust revoke myrepo/myimage` |

---

## **8. Docker Debugging & Troubleshooting Commands**

| Command          | Description                               | Example                           |
| ---------------- | ----------------------------------------- | --------------------------------- |
| `docker logs`    | View container logs                       | `docker logs my-container`        |
| `docker inspect` | View detailed information about an object | `docker inspect my-container`     |
| `docker events`  | Monitor real-time Docker events           | `docker events`                   |
| `docker exec`    | Run a command inside a running container  | `docker exec -it my-container sh` |
| `docker ps -a`   | List all containers (running and stopped) | `docker ps -a`                    |

---

## **9. Docker Swarm (Orchestration) Commands**

| Command                 | Description              | Example                                          |
| ----------------------- | ------------------------ | ------------------------------------------------ |
| `docker swarm init`     | Initialize a new swarm   | `docker swarm init`                              |
| `docker swarm join`     | Join a swarm as a node   | `docker swarm join --token <TOKEN> <MANAGER-IP>` |
| `docker node ls`        | List swarm nodes         | `docker node ls`                                 |
| `docker service create` | Create a new service     | `docker service create --name myservice nginx`   |
| `docker service ls`     | List services in a swarm | `docker service ls`                              |
| `docker service ps`     | List tasks of a service  | `docker service ps myservice`                    |

---

## **Conclusion**

This document provides a comprehensive list of `docker` commands with explanations. Mastering these commands will help you efficiently manage containers, networks, volumes, and Docker Swarm clusters. 🚀
