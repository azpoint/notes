Got it ✅ Let’s cover **Alembic with SQLAlchemy** in a practical 80/20 way — enough to be productive without drowning in every detail.

---

## 1. What is Alembic?

- **Alembic** = a migration tool for **SQLAlchemy**.
- It keeps your database schema in sync with your Python models.
- Instead of manually running `ALTER TABLE ...`, Alembic generates and applies migration scripts.

---

## 2. Typical Workflow (80/20 view)

### 🔹 Step 1: Install

```bash
pip install alembic
```

### 🔹 Step 2: Initialize project

```bash
alembic init alembic
```

- Creates:

  - `alembic/` folder → migration scripts live here
  - `alembic.ini` → config file (edit DB URL here or load from env)

### 🔹 Step 3: Link to SQLAlchemy models

In `alembic/env.py`:

```python
from myapp.models import Base  # your SQLAlchemy declarative base
target_metadata = Base.metadata
```

So Alembic knows your tables.

### 🔹 Step 4: Create migrations

```bash
alembic revision --autogenerate -m "create users table"
```

- Compares your models (`Base.metadata`) with the actual DB schema.
- Writes a migration script in `alembic/versions/`.

### 🔹 Step 5: Apply migrations

```bash
alembic upgrade head
```

- Applies migrations up to the latest version ("head").
- DB schema matches your models.

### 🔹 Step 6: Rollback (if needed)

```bash
alembic downgrade -1
```

- Rolls back the last migration.

---

## 3. Most Used Commands

- `alembic init [envName => alembic]` → setup
- `alembic revision -m "msg"` → new empty migration
- `alembic revision --autogenerate -m "msg"` → auto migration
- `alembic upgrade [Revision ID]` → apply all
- `alembic downgrade -1` → undo last
- `alembic history` → show migrations

---

## 4. The 20% That Matters

- Keep models & DB in sync → always run `alembic revision --autogenerate` after changing models.
- Review generated migration scripts (don’t blindly trust them).
- `upgrade head` = migrate forward.
- `downgrade -1` = rollback.
- `env.py` links Alembic with your SQLAlchemy models (`Base.metadata`).

---

## 5. Example Workflow

1. Add a column in a model:

   ```python
   class User(Base):
       __tablename__ = "users"
       id = Column(Integer, primary_key=True)
       name = Column(String)
       email = Column(String)  # new column
   ```

2. Generate migration:

   ```bash
   alembic revision --autogenerate -m "add email to users"
   ```

3. Apply it:

   ```bash
   alembic upgrade head
   ```

Done ✅ Your DB schema has the new column.

---

👉 That’s 80% of Alembic. The other 20% (branches, merge conflicts, env tweaks, seeding data, custom ops) you’ll rarely need at first.

---

Do you want me to also show you how to **integrate Alembic into a FastAPI project structure** (so migrations run smoothly with `SQLAlchemy` sessions)?
