Got it! Here’s the **80/20 guide to SQLAlchemy** — enough to get productive quickly without drowning in details:

---

# 🚀 SQLAlchemy 80/20 Guide

## 1. What SQLAlchemy Is

- **Python ORM (Object Relational Mapper)** and **SQL toolkit**.
- Lets you interact with databases using **Python classes & objects**, while still allowing **raw SQL when needed**.
- Works with many databases: PostgreSQL, MySQL, SQLite, etc.

---

## 2. Core Concepts

- **Engine**: Manages the DB connection.
- **Session**: Manages interactions with the DB (transactions, queries).
- **Models**: Python classes mapped to DB tables.
- **Querying**: Build queries with Python expressions instead of SQL.
- **Migrations**: Usually handled with Alembic (not built-in, but tightly integrated).

---

## 3. Setup & Engine

```python
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base

# Connect to DB (SQLite example)
engine = create_engine("sqlite:///example.db", echo=True)

# Base class for models
Base = declarative_base()

# Session factory
SessionLocal = sessionmaker(bind=engine)
```

---

## 4. Define Models (Tables)

```python
from sqlalchemy import Column, Integer, String

class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, nullable=False)
    email = Column(String, unique=True, index=True)
```

- `__tablename__`: the actual table name.
- Columns map to table fields.
- Constraints like `primary_key`, `nullable`, `unique` are declared here.

---

## 5. Create Tables

```python
Base.metadata.create_all(bind=engine)
```

---

## 6. Using Sessions

```python
db = SessionLocal()

# Create
new_user = User(name="Alice", email="alice@example.com")
db.add(new_user)
db.commit()
db.refresh(new_user)  # refresh from DB, get auto-generated fields like id

# Read
users = db.query(User).all()
user = db.query(User).filter(User.email == "alice@example.com").first()

# Update
user.name = "Alice Wonderland"
db.commit()

# Delete
db.delete(user)
db.commit()
```

---

## 7. Relationships

```python
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship

class Address(Base):
    __tablename__ = "addresses"
    id = Column(Integer, primary_key=True)
    email = Column(String)
    user_id = Column(Integer, ForeignKey("users.id"))

    user = relationship("User", back_populates="addresses")

User.addresses = relationship("Address", back_populates="user")
```

- `relationship()` links objects together.
- Easy navigation: `user.addresses` and `address.user`.

---

## 8. Raw SQL (Fallback)

```python
result = db.execute("SELECT * FROM users WHERE name=:name", {"name": "Alice"})
for row in result:
    print(row)
```

---

## 9. Typical Workflow

1. **Define models** (`Base` + `Column`).
2. **Create engine + session**.
3. **Run migrations** (with Alembic).
4. **Use ORM for CRUD**.
5. **Use raw SQL for complex queries** if ORM feels too heavy.

---

## 10. 80/20 Takeaways

- Use **ORM** for most tasks → clean, Pythonic.
- Use **raw SQL** when it’s easier.
- Always wrap DB operations in a **session**.
- Pair with **Alembic** for schema migrations.

---

👉 With just **engine + Base + Session + models + queries**, you’ll cover \~80% of use cases.

---

Do you also want me to add a **"common gotchas & best practices"** section (like session scope, lazy loading, n+1 queries)?
