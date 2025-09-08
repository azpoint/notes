# 🌳 Trunk-Based Development with Git: Step-by-Step (Annotated for Solo Developers)

This markdown document walks you through trunk-based development using Git, explaining each command in detail. Comments include tips and notes for **solo developers**, who can often streamline parts of the process.

---

## 🧭 Start from the Trunk

```bash
git checkout main
```

➡️ Switch to the `main` branch — this is your **trunk**, the central integration branch.

```bash
git pull origin main
```

➡️ Update your local `main` branch with the latest changes from the remote repository (`origin`).

> ✅ **Solo Developer Note:** Even when working alone, always pull the latest in case you've pushed from another machine or workflow.

---

## 🌿 Create a Feature Branch

```bash
git checkout -b feature/your-feature
```

➡️ Create and switch to a new branch named `feature/your-feature`. The `-b` flag combines branch creation and checkout.

> ✅ **Solo Developer Tip:** Use short, meaningful names like `fix/login-bug` or `feat/add-navbar`.

---

## 🛠️ Stage and Commit Changes

```bash
git add .
```

➡️ Stage all changes in the working directory.

```bash
git commit -m "WIP: partial work on feature"
```

➡️ Commit staged changes with a message. `WIP` = Work In Progress.

---

## ☁️ Push Work to Remote (In Progress)

```bash
git push origin feature/your-feature
```

➡️ Pushes your local branch (`feature/your-feature`) to the remote repository (`origin`).  
This is useful for backup, sharing code with teammates, or opening a Pull Request.

> ✅ **Solo Developer Tip:** Even if you're working alone, pushing periodically gives you a backup and enables syncing across machines.

---

## 🔄 Rebase with Latest Trunk (Keep History Clean)

Before merging into `main`, ensure your branch is based on the latest code:

```bash
git fetch origin
```

➡️ Updates your local view of the remote repository, fetching all new commits from `origin`.

```bash
git rebase origin/main
```

➡️ Reapplies your changes on top of the latest `origin/main`.  
This helps prevent merge conflicts and maintains a linear commit history.

> ✅ **Solo Developer Tip:** Rebasing regularly avoids painful merges later — even if you're the only contributor.

---

## ⚠️ Resolve Rebase Conflicts (if any)

```bash
git add .
```

➡️ After resolving conflicts, use `git add` to stage the fixed files.

```bash
git rebase --continue
```

➡️ Continue the rebase process after conflict resolution.

---

## ✅ Run Tests

```bash
npm test
```

➡️ Run your project's test suite. Replace with your own command if different.

> ✅ **Solo Developer Tip:** Always test before merging, even if no one is reviewing your code.

---

## ☁️ Push Finalized Feature Branch

```bash
git push origin feature/your-feature
```

➡️ Pushes the rebased (and now clean) version of your feature branch to the remote repository.  
This can now be reviewed and merged, or used in a CI pipeline.

---

## 🔀 Merge Feature into Trunk

```bash
git checkout main
```

➡️ Switch back to the main branch.

```bash
git pull origin main
```

➡️ Ensure local `main` is up to date before merging.

```bash
git merge feature/your-feature --no-ff
```

➡️ Merge your feature into `main`. The `--no-ff` flag forces a merge commit for traceability.

> ✅ **Solo Developer Tip:** This step is still useful — keeping merge commits helps visualize history later.

---

## ☁️ Push Merged Trunk

```bash
git push origin main
```

➡️ Push the updated `main` branch to the remote.

---

## 🧹 Clean Up Branches

```bash
git branch -d feature/your-feature
```

➡️ Delete the local feature branch.

```bash
git push origin --delete feature/your-feature
```

➡️ Delete the remote feature branch.

---

## 🔁 Summary Flow

```text
checkout main ➜ pull ➜ checkout -b feature ➜ work & commit ➜ push ➜ rebase ➜ test ➜ push again ➜ merge ➜ delete branch
```

> 🔒 **Solo Developer Reminder:** Even when working solo, following this flow keeps your history clean, ensures backup, and simplifies collaboration or CI/CD setup later.
