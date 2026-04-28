# ⚙️ DevOps `curl` Workflow (Practical 80/20)

## 1) Health Checks & Readiness Gates

You’re not just “calling an endpoint”—you’re **asserting system state**.

### Basic health check

```bash
curl -f https://service.internal/health
```

* `-f` → fail on HTTP ≥ 400 (critical for CI/CD)
* Exit code becomes your signal

### With timeout + retry (production-safe)

```bash
curl -f --max-time 5 --retry 3 --retry-delay 2 \
  https://service.internal/health
```

👉 Pattern: **fail fast, retry briefly, then abort pipeline**

---

## 2) Status Code–Driven Logic

In DevOps, you often don’t care about the body—just the status.

```bash
status=$(curl -s -o /dev/null -w "%{http_code}" https://api.service.com)

if [ "$status" -ne 200 ]; then
  echo "Service unhealthy"
  exit 1
fi
```

Key flag:

* `-w "%{http_code}"` → extract metrics

---

## 3) Authenticated Service Calls (Tokens Everywhere)

### Inject token from environment

```bash
curl -sS https://api.service.com/data \
  -H "Authorization: Bearer $API_TOKEN"
```

👉 Always:

* store secrets in env vars / vault
* never hardcode tokens

---

## 4) JSON APIs + Structured Output

Pipe into `jq` for deterministic parsing:

```bash
curl -sS https://api.service.com/deployments \
  | jq -r '.[] | select(.status=="failed")'
```

Use this for:

* deployment validation
* config drift detection
* alert conditions

---

## 5) Deployment Verification

After deploy, assert:

* service responds
* correct version is live

```bash
curl -s https://service.internal/version | jq -r '.version'
```

Compare:

```bash
EXPECTED="1.4.2"
ACTUAL=$(curl -s https://service/version | jq -r '.version')

[ "$ACTUAL" = "$EXPECTED" ] || exit 1
```

---

## 6) File Transfers (Artifacts, Backups)

### Download artifact

```bash
curl -fLO https://artifacts.company.com/app.tar.gz
```

### Upload artifact

```bash
curl -X PUT -T app.tar.gz https://storage.service.com/app.tar.gz
```

👉 Often used with:

* artifact repos
* object storage (S3-compatible endpoints)

---

## 7) Observability & Debugging

### Full trace (when things break)

```bash
curl -v https://service.internal
```

### Log timing metrics

```bash
curl -s -o /dev/null -w "\
DNS: %{time_namelookup}\n\
Connect: %{time_connect}\n\
TTFB: %{time_starttransfer}\n\
Total: %{time_total}\n" \
https://service.internal
```

👉 This gives:

* latency breakdown (DNS vs backend)
* quick SRE triage signal

---

## 8) Resilience Patterns

### Retry with backoff

```bash
curl --retry 5 --retry-delay 2 --retry-max-time 20 \
     --retry-connrefused \
     https://api.service.com
```

### Follow redirects (common with CDNs / auth)

```bash
curl -L https://service.com
```

---

## 9) CI/CD Pipeline Usage

### Example: GitHub Actions / CI step

```bash
curl -f https://api.service.com/ready || exit 1
```

### Example: wait for service startup

```bash
until curl -sf http://localhost:8080/health; do
  sleep 2
done
```

---

## 10) Kubernetes & Container Workflows

### Probe inside container

```bash
kubectl exec pod-name -- curl -s localhost:8080/health
```

### Port-forward + test locally

```bash
kubectl port-forward svc/api 8080:80
curl http://localhost:8080/health
```

---

## 11) Security & TLS Handling

### Custom CA

```bash
curl --cacert ca.pem https://internal.service
```

### Skip verification (only for debugging)

```bash
curl -k https://internal.service
```

👉 In production: never rely on `-k`

---

## 12) Advanced Logging / Metrics Extraction

You can turn `curl` into a lightweight probe:

```bash
curl -s -o /dev/null -w "\
status=%{http_code} \
time=%{time_total} \
ip=%{remote_ip}\n" \
https://service.com
```

Perfect for:

* cron-based monitoring
* lightweight synthetic checks

---

# 🧾 DevOps Curl Cheat Sheet (Condensed)

## Reliability

```bash
curl -f URL                     # fail on error
curl --retry 3 URL             # retry
curl --max-time 5 URL          # timeout
```

## Silent + Clean

```bash
curl -sS URL                   # silent but show errors
curl -o file URL               # output file
```

## Metrics

```bash
curl -w "%{http_code}" -o /dev/null -s URL
```

## Auth

```bash
curl -H "Authorization: Bearer $TOKEN" URL
```

## JSON

```bash
curl -s URL | jq
```

## Debug

```bash
curl -v URL
curl -i URL
```

## Files

```bash
curl -O URL
curl -T file URL
```

## Redirects

```bash
curl -L URL
```

---

# 🧠 Mental Model Upgrade (DevOps Context)

Think of `curl` as:

> **A deterministic, scriptable HTTP probe with exit codes and metrics**

Not just a request tool.

That framing makes it ideal for:

* CI/CD gates
* health checks
* smoke tests
* incident debugging
* synthetic monitoring

---