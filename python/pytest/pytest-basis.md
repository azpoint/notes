Got it — you want the **80/20 guide to pytest**: the essentials that get you productive quickly, without drowning in details. Let’s break it down into **what it is, how to use it, and a solid workflow**.

---

## 1. What pytest is

- A **testing framework** for Python.
- Lets you write **simple functions** as tests (no boilerplate `unittest.TestCase`).
- Very popular in Python projects (most modern Python repos use it).
- Supports **fixtures**, **parametrization**, and a huge plugin ecosystem.

---

## 2. Installation & Setup

```bash
# Install in your virtualenv
pip install pytest
```

Optional but common extras:

```bash
pip install pytest-cov   # coverage reports
pip install pytest-xdist # run tests in parallel
```

**Project structure convention** (not mandatory but standard):

```
my_project/
│
├── src/                # your actual code
│   └── calc.py
│
├── tests/              # all tests here
│   ├── test_calc.py
│   └── conftest.py     # shared test fixtures live here
```

---

## 3. Writing Tests (the 80%)

- Test files start with `test_*.py`
- Test functions start with `test_*`
- Assertions are plain Python `assert`

**Example** (`tests/test_calc.py`):

```python
from src.calc import add

def test_add():
    assert add(2, 3) == 5
```

Run tests:

```bash
pytest
```

Pytest auto-discovers tests in `tests/` or any `test_*.py` file.

---

## 4. Running tests

- Run all:

  ```bash
  pytest
  ```

- Run a specific file:

  ```bash
  pytest tests/test_calc.py
  ```

- Run a specific test function:

  ```bash
  pytest tests/test_calc.py::test_add
  ```

- Verbose mode:

  ```bash
  pytest -v
  ```

- Stop after first failure:

  ```bash
  pytest -x
  ```

---

## 5. Fixtures (the superpower, but start simple)

Fixtures let you **set up reusable context** for tests.

Example:

```python
import pytest

@pytest.fixture
def sample_data():
    return {"a": 1, "b": 2}

def test_dict_has_keys(sample_data):
    assert "a" in sample_data
    assert sample_data["b"] == 2
```

Fixtures are defined in `conftest.py` for sharing across test files.

---

## 6. Parametrization

Run the same test with multiple inputs:

```python
import pytest

@pytest.mark.parametrize("x,y,expected", [
    (2, 3, 5),
    (1, 1, 2),
    (0, 0, 0),
])
def test_add(x, y, expected):
    from src.calc import add
    assert add(x, y) == expected
```

---

## 7. Coverage (quick feedback on what’s tested)

```bash
pytest --cov=src --cov-report=term-missing
```

---

## 8. Workflow (the 80/20)

1. **Create a `tests/` folder** at project root.
2. **For each module**, create a matching `test_<module>.py`.
3. **Write simple `assert` tests** first.
4. **Use fixtures** when you notice setup code repeating.
5. **Run tests constantly** during dev:

   - Run all before committing: `pytest -q`
   - Run failed tests first when debugging: `pytest --lf`
   - Run in watch mode (needs `pytest-watch`): `ptw`

---

## 9. VS Code integration

- Install **Python extension**.
- In `.vscode/settings.json`:

  ```json
  {
    "python.testing.pytestEnabled": true,
    "python.testing.unittestEnabled": false,
    "python.testing.pytestArgs": ["tests"]
  }
  ```

- Then you can:

  - Run/debug tests inside the editor.
  - See inline green/red indicators.

---

✅ That’s the **80/20**:

- `pytest` installed
- `tests/` folder
- `assert` statements
- `pytest -v` to run
- Fixtures when things get repetitive
- Parametrization for inputs

---

Would you like me to also give you a **ready-to-go pytest boilerplate setup** (with `requirements-dev.txt`, `pytest.ini`, and `.vscode/settings.json`) so you can drop it straight into a new project?
