## Basic usage

```bash
date
```

Outputs the current system date and time in the default locale format.

---

## Common format specifiers

You control output using `+` followed by format tokens:

```bash
date "+%Y-%m-%d %H:%M:%S"
```

Key tokens:

* `%Y` → 4-digit year
* `%m` → month (01–12)
* `%d` → day (01–31)
* `%H` → hour (00–23)
* `%M` → minute
* `%S` → seconds
* `%A` → full weekday name
* `%b` → short month name

Example:

```bash
date "+%A, %d %b %Y"
```

---

## Setting the date/time (requires privileges)

```bash
sudo date -s "2026-04-29 15:30:00"
```

You can also use relative expressions:

```bash
sudo date -s "next Friday"
sudo date -s "2 hours ago"
```

---

## Working with timestamps (epoch time)

* Current epoch time:

```bash
date +%s
```

* Convert epoch → readable:

```bash
date -d @1714400000
```

---

## Parsing custom dates

```bash
date -d "2026-04-29"
date -d "yesterday"
date -d "next monday"
```

---

## UTC vs local time

* Show UTC:

```bash
date -u
```

* Format UTC explicitly:

```bash
date -u "+%Y-%m-%dT%H:%M:%SZ"
```

---

## ISO 8601 format

```bash
date --iso-8601=seconds
```

---

## File timestamps

* Show last modification time:

```bash
date -r filename
```

---

## Handy scripting examples

**Filename with timestamp**

```bash
backup_$(date +%Y%m%d_%H%M%S).tar.gz
```

**Log-friendly format**

```bash
date "+[%Y-%m-%d %H:%M:%S]"
```

---

## Mental model (nerdy touch)

Think of `date` as a thin wrapper around the system clock + `strftime()` formatting. The real power comes from combining:

* a time source (`now`, `-d`, `-r`)
* a representation (`+FORMAT`)

---

If you want, I can show advanced tricks (like timezone overrides, GNU vs BSD differences, or parsing edge cases).
