A **clean, repeatable workflow** for working with Python virtual environments and VS Code.

---

# 🔹 Python Virtual Environment Workflow (with VS Code)

---

## **1. Create a Project Folder**

```bash
mkdir myproject
cd myproject
```

Keep everything project-local so nothing leaks into other projects.

---

## **2. Create a Virtual Environment**

Use the Python version you want (managed by `pyenv` or system Python):

```bash
python -m venv .venv
```

- This creates a `.venv/` directory inside the project.
- All dependencies go here.
- Add `.venv/` to `.gitignore` so it doesn’t get committed.

---

## **3. Activate the Environment**

```bash
source .venv/bin/activate
```

Now when you run `python` or `pip`, they point to your isolated environment.

Install your dependencies:

```bash
pip install --upgrade pip
pip install requests  black pylint isort
```

Save them:

```bash
pip freeze > requirements.txt
```

Deactivate when done:

```bash
deactivate
```

---

## **4. Configure VS Code**

Inside your project, create a `.vscode/` directory:

```bash
mkdir -p .vscode
```

Add a `settings.json`:

```json
{
  "python.defaultInterpreterPath": "${workspaceFolder}/.venv/bin/python",
  "python.terminal.activateEnvironment": true,
  "python.analysis.autoImportCompletions": true,
  "editor.formatOnSave": true,
  "python.formatting.provider": "black",
  "python.linting.enabled": true,
  "python.linting.pylintEnabled": true,
  "editor.codeActionsOnSave": {
    "source.organizeImports": true
  }
}
```

### What this does:

- **Interpreter**: points IntelliSense, debugger, and terminal to your `.venv`.
- **Auto-activation**: terminals opened in VS Code automatically activate `.venv`.
- **Formatting**: uses **Black** for code formatting, organizes imports with **isort**.
- **Linting**: uses **Pylint** for error checking.
- **Format on save**: every save reformats your file automatically.

---

## **5. Workflow Summary**

1. `python -m venv .venv` → create env
2. `source .venv/bin/activate` → activate env
3. `pip install -r requirements.txt` → install deps
4. `.vscode/settings.json` → tells VS Code to use `.venv`
5. **Write code** → IntelliSense, linting, and formatting just work.

---

## **6. Optional: Project Bootstrap Script**

To automate steps 2–4, you can add `scripts/init.sh`:

```bash
#!/usr/bin/env bash
python -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
[ -f requirements.txt ] && pip install -r requirements.txt
deactivate
```

Run once per project:

```bash
bash scripts/init.sh
```

---

✅ With this setup, every project has:

- Its own isolated `.venv`
- A reproducible `requirements.txt`
- VS Code fully wired up for IntelliSense, formatting, linting

---
