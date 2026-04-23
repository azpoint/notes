If you strip rsync down to its Pareto core, ~20% of its features cover ~80% of real-world usage: syncing directories efficiently, safely, and repeatably—locally or over SSH.

Here’s that distilled guide.

---

# The 80/20 Guide to rsync

## Mental Model (this is the key insight)

`rsync` = **smart copy with delta transfer**

Instead of copying whole files, it:

* Compares source vs destination
* Transfers only differences (block-level)
* Preserves metadata if asked

Think: `cp`, but incremental + remote-aware.

---

## The One Command to Remember

```bash
rsync -av --progress source/ user@host:/dest/
```

This single pattern covers most use cases.

### What matters here:

* `-a` → archive mode (recursive + preserve permissions, timestamps, etc.)
* `-v` → verbose (see what’s happening)
* `--progress` → shows transfer progress

If you only memorize one thing, make it this.

---

## Trailing Slash Rule (CRITICAL)

This is where most mistakes happen.

### Case 1: With trailing slash

```bash
rsync -av dir/ backup/
```

→ copies **contents of dir**

### Case 2: Without trailing slash

```bash
rsync -av dir backup/
```

→ copies **dir itself**

This subtlety causes many “why is my structure wrong?” moments.

---

## Local vs Remote

### Local sync

```bash
rsync -av src/ dst/
```

### Remote sync over SSH

```bash
rsync -av src/ user@server:/path/
```

### Pull from remote

```bash
rsync -av user@server:/path/ local/
```

No extra setup needed—SSH does the transport.

---

## The 3 Flags That Unlock Real Power

### 1. `--delete` (mirror mode)

```bash
rsync -av --delete src/ dst/
```

* Removes files in `dst` that don’t exist in `src`
* Makes destination an exact mirror

⚠️ Dangerous if used wrong—double-check paths.

---

### 2. `--dry-run` (safety net)

```bash
rsync -av --delete --dry-run src/ dst/
```

* Simulates changes without executing
* Use this whenever:

  * You add `--delete`
  * You’re unsure about paths

---

### 3. `-z` (compression)

```bash
rsync -avz src/ user@host:/dst/
```

* Compresses during transfer
* Useful for slow networks
* Usually unnecessary on fast LANs

---

## Excluding Files (common real-world need)

```bash
rsync -av --exclude="node_modules" src/ dst/
```

Multiple:

```bash
rsync -av \
  --exclude=".git" \
  --exclude="*.log" \
  src/ dst/
```

---

## Updating Only Changed Files

By default, rsync already does this.

But you can refine behavior:

```bash
rsync -av --ignore-existing src/ dst/
```

→ skips files that already exist

```bash
rsync -av --size-only src/ dst/
```

→ compares only file size (faster, less precise)

---

## SSH Customization (useful shortcut)

```bash
rsync -av -e "ssh -p 2222" src/ user@host:/dst/
```

* `-e` lets you tweak SSH options
* Common uses:

  * custom port
  * identity file

---

## The 5 Most Common Real-World Recipes

### 1. Backup a directory locally

```bash
rsync -av ~/projects/ /backup/projects/
```

---

### 2. Mirror a folder to a server

```bash
rsync -av --delete ~/site/ user@server:/var/www/site/
```

---

### 3. Copy only new files (no overwrite)

```bash
rsync -av --ignore-existing src/ dst/
```

---

### 4. Safe preview before syncing

```bash
rsync -av --dry-run src/ dst/
```

---

### 5. Sync large project, skip heavy dirs

```bash
rsync -av \
  --exclude="node_modules" \
  --exclude=".git" \
  project/ backup/
```

---

## Performance Insight (why rsync is fast)

It uses a **rolling checksum algorithm**:

* Splits files into chunks
* Transfers only changed chunks

This is why it dominates tools like `scp` for repeated syncs.

---

## Pitfalls to Avoid

### 1. Forgetting `--dry-run` with `--delete`

Can wipe data unintentionally.

### 2. Trailing slash confusion

Changes directory structure outcome.

### 3. Permissions issues

If things look wrong:

```bash
rsync -av --no-perms src/ dst/
```

---

## Minimal Cheat Sheet

If you want ultra-condensed:

```bash
# basic
rsync -av src/ dst/

# remote
rsync -av src/ user@host:/dst/

# mirror
rsync -av --delete src/ dst/

# safe test
rsync -av --dry-run src/ dst/

# exclude
rsync -av --exclude="pattern" src/ dst/
```

---

## Final Takeaway

You don’t need most of rsync.

If you understand:

* `-a`
* trailing slashes
* `--delete`
* `--dry-run`

…you can handle the overwhelming majority of sync, backup, and deployment workflows.

---

