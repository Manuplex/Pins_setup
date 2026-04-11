"""
Initialisation de SQLAlchemy (engine + session).

Ce module ne définit PAS les modèles : ils vivent dans `models.py`.
"""

from __future__ import annotations
from typing import AsyncGenerator
from sqlalchemy import create_engine
from sqlalchemy.orm import DeclarativeBase, sessionmaker, Session
from sqlalchemy.orm import sessionmaker, declarative_base
from sqlalchemy.ext.asyncio import create_async_engine, AsyncSession

from .config import settings

class Base(DeclarativeBase):
    """Base déclarative pour tous les modèles ORM du projet."""

#COnfiguration de l'engine et de la session pour la partie SYNCHRONE
# Engine SQLAlchemy connecté à MariaDB / MySQL
Sync_engine = create_engine(settings.database_url, echo=False, future=True, pool_pre_ping=True,)

# Fabrique de sessions
Sync_SessionLocal = sessionmaker(bind=Sync_engine, autoflush=False, autocommit=False, future=True)

#Configuration de l'engine et de la session pour la partie ASYNCHRONE
Async_engine = create_async_engine(settings.Async_database_url, echo=False, future=True, pool_pre_ping=True)
Async_SessionLocal = sessionmaker(bind=Async_engine, class_=AsyncSession, autoflush=False, autocommit=False, expire_on_commit=False, future=True)

def get_session() -> Session:
    """
    Fournit une session SQLAlchemy.

    À utiliser typiquement avec un context manager :

        with get_session() as session:
            ...
    """

    return Sync_SessionLocal()

async def get_Async_session() :
    """
    Fournit une session SQLAlchemy asynchrone.

    À utiliser typiquement avec un context manager :

        with get_session() as session:
            ...
    """
    async with Async_SessionLocal() as session:
        try:
            yield session
            await session.commit()
        except Exception:
            await session.rollback()
            raise
        finally:
            await session.close()
