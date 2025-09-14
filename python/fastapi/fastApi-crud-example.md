Perfect — let’s wire up **FastAPI + SQLAlchemy + Pydantic + PostgreSQL** with a simple **CRUD example**. This is the most common stack you’ll use in real projects.

---

# 🚀 FastAPI + SQLAlchemy + PostgreSQL + Pydantic (CRUD Example)

## 1. Install dependencies

```bash
pip install fastapi uvicorn sqlalchemy psycopg2-binary pydantic
```

---

## 2. Database setup (`database.py`)

```python
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base

DATABASE_URL = "postgresql://user:password@localhost:5432/mydb"

engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()

# Dependency for FastAPI routes
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
```

---

## 3. Models (`models.py`)

```python
from sqlalchemy import Column, Integer, String
from .database import Base

class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, nullable=False)
    email = Column(String, unique=True, index=True, nullable=False)
```

---

## 4. Pydantic Schemas (`schemas.py`)

```python
from pydantic import BaseModel, EmailStr

# Shared properties
class UserBase(BaseModel):
    name: str
    email: EmailStr

# For creating
class UserCreate(UserBase):
    pass

# For reading (response)
class UserRead(UserBase):
    id: int

    class Config:
        orm_mode = True  # 🔑 important for SQLAlchemy -> Pydantic
```

---

## 5. CRUD Operations (`crud.py`)

```python
from sqlalchemy.orm import Session
from . import models, schemas

def create_user(db: Session, user: schemas.UserCreate):
    db_user = models.User(name=user.name, email=user.email)
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return db_user

def get_user(db: Session, user_id: int):
    return db.query(models.User).filter(models.User.id == user_id).first()

def get_users(db: Session, skip: int = 0, limit: int = 10):
    return db.query(models.User).offset(skip).limit(limit).all()

def delete_user(db: Session, user_id: int):
    user = db.query(models.User).filter(models.User.id == user_id).first()
    if user:
        db.delete(user)
        db.commit()
    return user
```

---

## 6. FastAPI App (`main.py`)

```python
from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy.orm import Session
from . import models, schemas, crud
from .database import engine, Base, get_db

# Create tables
Base.metadata.create_all(bind=engine)

app = FastAPI()

@app.post("/users/", response_model=schemas.UserRead)
def create_user(user: schemas.UserCreate, db: Session = Depends(get_db)):
    return crud.create_user(db=db, user=user)

@app.get("/users/{user_id}", response_model=schemas.UserRead)
def read_user(user_id: int, db: Session = Depends(get_db)):
    db_user = crud.get_user(db, user_id=user_id)
    if not db_user:
        raise HTTPException(status_code=404, detail="User not found")
    return db_user

@app.get("/users/", response_model=list[schemas.UserRead])
def read_users(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    return crud.get_users(db, skip=skip, limit=limit)

@app.delete("/users/{user_id}", response_model=schemas.UserRead)
def delete_user(user_id: int, db: Session = Depends(get_db)):
    db_user = crud.delete_user(db, user_id=user_id)
    if not db_user:
        raise HTTPException(status_code=404, detail="User not found")
    return db_user
```

---

## 7. Run server

```bash
uvicorn main:app --reload
```

---

## 8. Try it out

- Go to **[http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs)** → Swagger UI
- Endpoints:

  - `POST /users/` → create user
  - `GET /users/{id}` → read single user
  - `GET /users/` → list users
  - `DELETE /users/{id}` → delete user

---

✅ That’s the **minimal CRUD with FastAPI + SQLAlchemy + PostgreSQL + Pydantic**.

---

Would you like me to also show you how to **add Alembic migrations** to this setup (so you don’t rely on `Base.metadata.create_all` in production)?
