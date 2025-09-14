Got it ✅ — here’s the **80/20 guide** to using **FastAPI + SQLAlchemy + Pydantic + PostgreSQL** for building a CRUD API.
This is the _practical workflow_ that covers 80% of what you’ll use day to day.

---

# 🚀 FastAPI + SQLAlchemy + Pydantic + PostgreSQL (80/20 Guide)

## 1. **Concepts**

- **FastAPI** → Web framework for building APIs (async, type hints, validation).
- **SQLAlchemy ORM** → Python ORM to map database tables to Python classes.
- **Pydantic** → Data validation & serialization (request/response schemas).
- **PostgreSQL** → Database backend.

👉 Workflow:
Request (JSON) → **Pydantic schema** → **FastAPI route** → **SQLAlchemy model + DB session** → Response (Pydantic schema).

---

## 2. **Project Setup**

```bash
pip install fastapi uvicorn sqlalchemy psycopg2-binary pydantic
```

---

## 3. **Database Config**

`database.py`

```python
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base

DATABASE_URL = "postgresql://user:password@localhost:5432/mydb"

engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()
```

---

## 4. **SQLAlchemy Model**

`models.py`

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

## 5. **Pydantic Schemas**

`schemas.py`

```python
from pydantic import BaseModel

class UserBase(BaseModel):
    name: str
    email: str

class UserCreate(UserBase):
    pass

class UserRead(UserBase):
    id: int

    class Config:
        orm_mode = True  # Enables compatibility with SQLAlchemy ORM objects
```

---

## 6. **CRUD Operations**

`crud.py`

```python
from sqlalchemy.orm import Session
from . import models, schemas

def get_user(db: Session, user_id: int):
    return db.query(models.User).filter(models.User.id == user_id).first()

def get_users(db: Session, skip: int = 0, limit: int = 10):
    return db.query(models.User).offset(skip).limit(limit).all()

def create_user(db: Session, user: schemas.UserCreate):
    db_user = models.User(**user.dict())
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return db_user
```

---

## 7. **Dependency for DB Session**

`main.py`

```python
from fastapi import Depends, FastAPI, HTTPException
from sqlalchemy.orm import Session
from . import crud, models, schemas
from .database import SessionLocal, engine

models.Base.metadata.create_all(bind=engine)  # Create tables

app = FastAPI()

# Dependency
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
```

---

## 8. **API Routes (CRUD)**

```python
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
```

---

## 9. **Run Server**

```bash
uvicorn main:app --reload
```

---

## 10. **Workflow Recap**

1. **Define models** (`SQLAlchemy ORM`) → database tables.
2. **Define schemas** (`Pydantic`) → request/response validation.
3. **CRUD functions** → encapsulate DB logic.
4. **API routes** → call CRUD functions with dependency-injected DB session.

---

⚡ That’s the **80/20**: with this structure, you can expand to PUT, DELETE, relationships, and async queries when needed.

---

Do you want me to extend this with **update & delete** CRUD endpoints too, so you have the full set?
