# Docker & Docker Swarm Cheat Sheet (80/20)

A concise, practical reference for day-to-day Docker and Docker Swarm usage on Ubuntu.

---

## 1. Docker Basics

### Images

```bash
docker pull nginx
docker build -t myapp .
docker images
docker rmi nginx
```

### Containers

```bash
docker run -d -p 8080:80 nginx
docker ps
docker ps -a
docker stop <container>
docker rm <container>
docker logs <container>
docker exec -it <container> sh
```

---

## 2. Docker Networks

```bash
docker network ls
docker network inspect <network>
docker network create app_net
docker network rm app_net
```

**Key network types**

* `bridge` — single-host networking (default)
* `host` — container uses host networking
* `overlay` — multi-host networking (Swarm)
* `ingress` — Swarm routing mesh (auto-managed)

---

## 3. Volumes

```bash
docker volume ls
docker volume create data
docker volume inspect data
docker volume rm data
```

Bind mount example:

```bash
-v /host/path:/container/path
```

---

## 4. Docker Compose (Local Development)

```bash
docker compose up -d
docker compose down
docker compose ps
docker compose logs
docker compose exec <service> sh
```

---

## 5. Docker Swarm – Cluster Management

### Initialize / Join / Leave

```bash
docker swarm init
docker swarm join
docker swarm leave
```

### Nodes

```bash
docker node ls
docker node inspect <node>
docker node update --availability drain <node>
```

---

## 6. Services (Core Swarm Concept)

### Create a Service

```bash
docker service create --name web -p 80:80 nginx
```

### List & Inspect

```bash
docker service ls
docker service ps web
docker service inspect web
```

### Scale

```bash
docker service scale web=5
```

### Update / Restart

```bash
docker service update --image nginx:latest web
docker service update --force web
```

### Logs

```bash
docker service logs web
```

---

## 7. Overlay Networking (Swarm)

Create a shared overlay network:

```bash
docker network create --driver overlay app_net
```

Attach a service:

```bash
docker service create --name api --network app_net myimage
```

**Built-in DNS**

```text
http://api:<port>
```

---

## 8. Stacks (Compose for Swarm)

Deploy:

```bash
docker stack deploy -c docker-compose.yml myapp
```

Manage:

```bash
docker stack ls
docker stack services myapp
docker stack rm myapp
```

---

## 9. Secrets & Configs

### Secrets

```bash
echo "secret" | docker secret create db_password -
docker secret ls
```

### Configs

```bash
docker config create nginx_conf nginx.conf
docker config ls
```

---

## 10. Cleanup Commands

```bash
docker system df
docker system prune
docker container prune
docker image prune
docker volume prune
docker network prune
```

---

## 11. Inspection, Debugging & Handy Snippets

### Interactive Inspection (`-it`)

Exec into a running container:

```bash
docker exec -it <container> sh
# or
ocker exec -it <container> bash
```

Run a temporary debug container on a network:

```bash
docker run -it --rm --network app_net busybox sh
```

Inspect a Swarm task container (from manager/node):

```bash
docker service ps web
docker inspect <task_container_id>
```

---

### Inspect Commands (Deep Dive)

Container details:

```bash
docker inspect <container>
```

Service details:

```bash
docker service inspect web --pretty
```

Network details:

```bash
docker network inspect app_net
```

Node details:

```bash
docker node inspect <node> --pretty
```

---

### Filtering & Formatting Output

List containers by name:

```bash
docker ps --filter "name=postgres"
```

Exec into a PostgreSQL container in a deployed stack (filtered by name):

```bash
docker exec -it $(docker ps -q --filter "name=myapp_postgres") sh
```

List exited containers:

```bash
docker ps -a --filter "status=exited"
```

List services by name:

```bash
docker service ls --filter name=web
```

Custom output formatting:

```bash
docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}"
```

---

### Logs & Health Debugging

Tail logs:

```bash
docker logs -f <container>
docker service logs -f web
```

Show last 50 lines:

```bash
docker service logs --tail 50 web
```

Check container health:

```bash
docker inspect --format='{{.State.Health.Status}}' <container>
```

---

### Resource Usage

Live resource usage:

```bash
docker stats
docker stats <container>
```

Disk usage breakdown:

```bash
docker system df -v
```

---

### Emergency / Recovery Snippets

Restart all containers of a service:

```bash
docker service update --force web
```

Drain a node before maintenance:

```bash
docker node update --availability drain <node>
```

Re-enable scheduling:

```bash
docker node update --availability active <node>
```

---

## 12. 80/20 Rules to Remember

* Use **services**, not `docker run`, in Swarm
* Use **overlay networks** for multi-node communication
* Use **stacks** for real deployments
* Scale with `docker service scale`
* Debug with `docker service ps` and `docker service logs`
* Do **not** remove the `ingress` network
* Use `docker ps --filter "name=<name>"` for reliable container selection in stacks
