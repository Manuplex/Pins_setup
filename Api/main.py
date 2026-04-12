from typing import Union
import os
from fastapi import FastAPI
from fastapi import Depends, FastAPI, HTTPException, Query
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select, cast, Integer, String, func

# On importe ce qu'on a préparé dans shared
from shared.db import get_Async_session
from shared.models import Pins_Images
from shared.models import SubCategorie_pin
from fastapi.middleware.cors import CORSMiddleware
from shared.db import Base, Sync_engine
# Importe ici tous tes modèles (Article, User, etc.) pour que SQLAlchemy les connaisse
# from shared.models import Article, Category ...

# Cette ligne va créer les tables sur Railway au démarrage


Base.metadata.create_all(bind=Sync_engine)

app = FastAPI()

frontend_url: str = os.getenv("FRONTEND_URL", "http://localhost:5173")

origins= [frontend_url]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/")
async def read_root():
    return {"Hello": "World"}



@app.get("/items/")
async def read_items(
    categories: list[str] = Query(None),  # Capture la liste des catégories
    is_featured: bool = None, # Filtre booléen
    search: str = None,
    db: AsyncSession = Depends(get_Async_session),
    skip: int = 0, limit: int = 20,):

    query = select(Pins_Images)

    # Filtre par catégories
    if categories:
        print(f"Filtres reçus (labels): {categories}")

        # 1. D'abord, trouve les IDs correspondant aux labels
        sub_result = await db.execute(
            select(SubCategorie_pin.Id_Subcategorie, SubCategorie_pin.label_SubCategorie)
            .where(SubCategorie_pin.label_SubCategorie.in_(categories))
        )
        sub_categories = sub_result.fetchall()
        print(f"SubCategories trouvées: {sub_categories}")

        sub_ids = [str(sc[0]) for sc in sub_categories]
        print(f"IDs à chercher: {sub_ids}")

        query = query.where(Pins_Images.Pin_SubCategorie.in_(sub_ids))

    # Filtre par recherche de mots-clés (case-insensitive)
    if search:
        print(f"Recherche: {search}")
        query = query.where(Pins_Images.Pin_keywords.ilike(f"%{search}%"))

    query = query.offset(skip).limit(limit)
    result = await db.execute(query)
    items = result.scalars().all()
    print(f"Pins retournées: {len(items)} items")
    return items

@app.get("/items/{item_id}")
async def read_item_detail(item_id: int, db: AsyncSession = Depends(get_Async_session)):
    result = await db.execute(select(Pins_Images).where(Pins_Images.Pin_id == item_id))
    item = result.scalar_one_or_none()

    if not item:
        raise HTTPException(status_code=404, detail="Image not found")

    return item

@app.get("/categories/")
async def read_categories(db: AsyncSession = Depends(get_Async_session)):
    result = await db.execute(select(SubCategorie_pin.label_SubCategorie))
    categories = result.scalars().all()
    return categories