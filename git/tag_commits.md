# Create and Push tags to Git

## 1. Add and Commit Changes

```bash
git add.
git commit -m "git commit comment"
git push
```

---


## 2. Creating and Pushing Tags (Local Git)
```bash
git tag -a v1.1.1 -m "Release v1.1.1"
```
- Stored as a full Git object

    Include:
    - Tagger name
    - Date
    - Message

- Best practice for deployments and releases

---

## 3. Pushing Tags to GitHub

```bash
git push origin v1.1.1
```

---

## 4. Verifying the Tag

```bash
git tag
```

or

```bash
git show v1.1.1
```