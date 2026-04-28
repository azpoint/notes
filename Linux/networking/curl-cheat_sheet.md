# ⚡ Curl Cheat Sheet

## Basic Requests

```bash
curl URL
curl -X GET URL
curl -X POST URL
curl -X PUT URL
curl -X DELETE URL
```

---

## Headers

```bash
curl -H "Header: Value" URL
```

Multiple:

```bash
curl -H "Authorization: Bearer TOKEN" \
     -H "Content-Type: application/json" URL
```

---

## Data Sending

### Form data

```bash
curl -d "key=value&foo=bar" URL
```

### JSON

```bash
curl -H "Content-Type: application/json" \
     -d '{"key":"value"}' URL
```

---

## Files

Download:

```bash
curl -O https://example.com/file.zip
curl -o custom.zip https://example.com/file.zip
```

Upload:

```bash
curl -F "file=@file.txt" https://api.example.com/upload
```

---

## Auth

```bash
curl -u user:pass URL
curl -H "Authorization: Bearer TOKEN" URL
```

---

## Debugging

```bash
curl -v URL   # verbose
curl -i URL   # include headers
curl -I URL   # HEAD request only
```

---

## Redirects

```bash
curl -L URL
```

---

## Cookies

```bash
curl -c cookies.txt URL   # save
curl -b cookies.txt URL   # send
```

---

## Timeouts / Limits

```bash
curl --max-time 10 URL
curl --connect-timeout 5 URL
```

---

## Silent / Clean Output

```bash
curl -s URL        # silent
curl -sS URL       # silent but show errors
```

---

## Combine Everything (real-world example)

```bash
curl -X POST https://api.example.com/login \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d '{"email":"user@test.com","password":"secret"}' \
  -sS | jq
```

---

# 🧩 If You Want to Go One Level Deeper

The next 20% that gives disproportionate value:

* `--data-urlencode` (safe query encoding)
* `--compressed` (gzip support)
* `--retry` (resilience)
* `--parallel` (batch requests)
* `--write-out` (custom metrics/logging)

---