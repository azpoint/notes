# 🚀 Deploying Your Docker Swarm Stack to VPS

Perfect — you're almost there. Here's a clean step-by-step guide to deploy your Docker Swarm stack to your VPS using the **`deploy`** user you've configured.

---

## ✅ Prerequisites Recap

Make sure the following is done **before proceeding**:

- ✅ VPS is accessible via SSH with your **`deploy`** user.
- ✅ Docker & Docker Compose are installed on the VPS.
- ✅ Docker Swarm is initialized.
- ✅ The **`deploy`** user is in the `docker` group.
- ✅ You have your stack YAML files (`fazb-stack.yml`, `nginx-stack.yml`, etc.) and `nginx.conf` ready on the VPS.

---

## 🚀 Step-by-Step Deployment

### 🔹 1. SSH into your VPS

```bash
ssh deploy@your-vps-ip
```

---

### 🔹 2. Initialize Docker Swarm (if not done yet)

```bash
docker swarm init
```

> 📝 If it's already initialized, this will return an error — you can ignore it.

---

### 🔹 3. Create the Shared Overlay Network

This only needs to be done **once** before deploying stacks that use it.

```bash
docker network create --driver overlay --attachable fazb-net
```

---

### 🔹 4. Load External Secrets (if not yet created)

Run this for **each secret**:

```bash
echo -n "your-secret-value" | docker secret create jwt_secret -
echo -n "admin@example.com" | docker secret create sys_admin_email -
# Repeat for each:
#   sys_admin_password
#   admin_mail_verif_password
#   recaptcha_secret_key
#   postgres_db
#   postgres_user
#   postgres_password
```

> 🔐 You only need to do this **once per VPS**, unless the secret value changes.

---

### 🔹 5. Deploy the App Stack

Ensure `fazb-stack.yml` is on the VPS and run:

```bash
docker stack deploy -c fazb-stack.yml fazb
```

---

### 🔹 6. Deploy the NGINX Reverse Proxy

Ensure `nginx.conf` and `nginx-stack.yml` are ready, then run:

```bash
docker stack deploy -c nginx-stack.yml nginx
```

---

### 🔹 7. Verify Deployment

Check that the services are running:

```bash
docker service ls
```

You should see both stacks (`fazb_*` and `nginx_nginx`) and their replica counts.

To check logs:

```bash
docker service logs -f fazb_fazb-app
```

---

```bash
docker stack services fazb_app
docker service ps fazb_app_app
docker service ps fazb_app_db
docker service ps fazb_app_volume-init
```

---


### 🔹 8. Test Your Setup

Visit your VPS IP or domain (if DNS is configured):

```text
http://your-vps-ip
```

You should see your app served through **NGINX → Docker Swarm**.

---

## 📦 Optional: Organize Folders on the VPS

Consider this structure:

```
/home/deploy/
├── stacks/
│   ├── fazb-stack.yml
│   ├── nginx-stack.yml
├── configs/
│   └── nginx.conf
```

Then deploy like this:

```bash
cd ~/stacks
docker stack deploy -c fazb-stack.yml fazb
```

---

## ✅ That’s it!

Your app is now deployed in **production via Docker Swarm**. 🎉

---

## Stop Deploy

```bash
docker stack rm fazb
```
