# Quick Guide to `pyenv`

`pyenv` manages multiple Python versions on the same machine, similar to `nvm` for Node.js.

---

Install dependencies first:

```bash
sudo apt update

sudo apt install -y \
  build-essential curl git \
  libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev \
  libsqlite3-dev llvm \
  libncursesw5-dev xz-utils \
  tk-dev libxml2-dev \
  libxmlsec1-dev libffi-dev \
  liblzma-dev
```

Install pyenv:

```bash
curl https://pyenv.run | bash
```

Add to shell:

```bash
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
```

Reload shell.

```bash
source ~/.bashrc
```
---

# Core Commands


## List available Python versions to install

```bash
pyenv install --list
```

or 

```bash
pyenv install -l
```

---

## List installed Python versions

```bash
pyenv versions
```
---

## Install a Python version

```bash
pyenv install 3.12.3
```

---

## Set global default version

```bash
pyenv global 3.12.3
```

Applies everywhere unless overridden.

---

## Set project-specific version

Inside a project directory:

```bash
pyenv local 3.11.9
```

Creates a `.python-version` file.

---

## Set temporary shell version

```bash
pyenv shell 3.10.14
```

Only affects current terminal session.

---

## Check active version

```bash
pyenv version
```

---

## Find Python executable path

```bash
pyenv which python
```

---

# Pip Usage

---

## Install packages

```bash
pip install requests
```

Packages install into the currently active pyenv interpreter.

---

## List installed packages

```bash
pip list
```

or

```bash
pip freeze
```

---

## Remove all packages

```bash
pip freeze | xargs pip uninstall -y
```

---

# Virtual Environments

`pyenv` manages Python versions, not dependency isolation.

For project isolation, use:

## Built-in venv

```bash
python -m venv .venv
source .venv/bin/activate
```

---

## Or install pyenv-virtualenv

```bash
brew install pyenv-virtualenv
```

Create env:

```bash
pyenv virtualenv 3.12.3 myenv
```

Activate:

```bash
pyenv activate myenv
```

---

# Useful Debug Commands

---

## See where Python comes from

```bash
which python
which pip
```

---

## Rebuild shims

Sometimes needed after installs:

```bash
pyenv rehash
```

---

# Uninstall Python Version

```bash
pyenv uninstall 3.10.14
```

---

# Recommended Workflow

Typical modern setup:

```bash
pyenv install 3.12.3
pyenv local 3.12.3
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

This gives:

* pyenv → Python version management
* venv → dependency isolation per project

That combination is currently the most common lightweight Python workflow.
