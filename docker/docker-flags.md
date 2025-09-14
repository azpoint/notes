Here’s a consolidated table of the most frequently used Docker **flags and options** across the commands you listed:

---

# 🚩 Most Common Docker Command Flags

| Flag / Option         | Description                                                | Example                                                        |
| --------------------- | ---------------------------------------------------------- | -------------------------------------------------------------- |
| `-d`                  | Run container in **detached mode** (background)            | `docker run -d nginx`                                          |
| `-it`                 | Run container **interactively with a terminal**            | `docker run -it ubuntu bash`                                   |
| `--name`              | Assign a **custom name** to the container                  | `docker run --name myapp nginx`                                |
| `-p HOST:CONTAINER`   | Map **host port to container port**                        | `docker run -p 8080:80 nginx`                                  |
| `-v HOST:CONTAINER`   | Mount a **host directory/volume into container**           | `docker run -v /data:/var/lib/mysql mysql`                     |
| `--rm`                | Automatically **remove container after exit**              | `docker run --rm ubuntu echo "Hello"`                          |
| `-e KEY=VALUE`        | Set **environment variables**                              | `docker run -e MYSQL_ROOT_PASSWORD=secret mysql`               |
| `--network`           | Connect container to a **specific network**                | `docker run --network my-network nginx`                        |
| `--restart`           | Set container **restart policy** (e.g., always)            | `docker run --restart=always nginx`                            |
| `--env-file`          | Load environment variables from a **file**                 | `docker run --env-file .env postgres`                          |
| `--cpu` / `--memory`  | Limit **CPU and memory usage**                             | `docker run --memory="512m" --cpus="1.0" nginx`                |
| `--entrypoint`        | Override the container’s **default entrypoint**            | `docker run --entrypoint /bin/sh nginx`                        |
| `-a`                  | Show **all containers** (running + stopped)                | `docker ps -a`                                                 |
| `-q`                  | Show **only container IDs**                                | `docker ps -q`                                                 |
| `-f` / `--filter`     | Filter list results (containers, images, etc.)             | `docker ps -f "status=exited"`                                 |
| `--format`            | Format output using a **Go template**                      | `docker ps --format "{{.ID}}: {{.Status}}"`                    |
| `-t TAG`              | Assign a **tag** when building or tagging an image         | `docker build -t myapp:latest .`                               |
| `-f DOCKERFILE`       | Specify a **custom Dockerfile** when building              | `docker build -f Dockerfile.dev -t myapp-dev .`                |
| `--no-cache`          | Build image **without using cache**                        | `docker build --no-cache -t freshbuild .`                      |
| `-o FILE` / `-i FILE` | Save/load images to/from **tar archives**                  | `docker save -o myimage.tar myimage` / `docker load -i my.tar` |
| `docker exec -it`     | Run a command **inside a running container interactively** | `docker exec -it my-container bash`                            |
