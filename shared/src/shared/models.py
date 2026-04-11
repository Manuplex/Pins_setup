"""
Modèles ORM propres au projet.

On évite de mapper ici les tables internes de FreshRSS.
On se concentre sur nos propres besoins (images sélectionnées, scores, etc.).
"""

from __future__ import annotations

from cgitb import text
from datetime import datetime
from typing import Optional
from typing import List

from sqlalchemy import ForeignKey, String, Integer, DateTime, Text
from sqlalchemy.orm import Mapped, mapped_column

from sqlalchemy.orm import relationship

from .db import Base


class Pins_Images(Base):
    """
    Représente une image sélectionnée par notre logique.
    """

    __tablename__ = "Pins_Images"

    Pin_id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)

    # Identifiant d'article côté FreshRSS (ou autre référence externe)
    article_id: Mapped[str] = mapped_column(String(255), index=True)

    #title descripting image
    Pin_title: Mapped[str] = mapped_column(String(255))

    #keywords for image
    Pin_keywords: Mapped[str] = mapped_column(Text)

    #Ambiance and colors for image
    Pin_Ambiance : Mapped[str] = mapped_column(Text)

    # URL d'origine de l'image
    Pin_url: Mapped[str] = mapped_column(Text)

    # Chemin local où l'image est stockée sur disque
    Pin_local_path: Mapped[str] = mapped_column(String(500), nullable=True)

    #Information relative à la provenance du fichier
    Pin_source: Mapped[str] = mapped_column(String(255), index=True)

    #jobs corresponding
    Jobs: Mapped[str] = mapped_column(Text)

    # Score calculé par l'algorithme de sélection
    score: Mapped[int | None] = mapped_column(default=None)
    
    #Categorie correspondante de l'image prise
    Pin_categorie: Mapped[str] = mapped_column(String(255))

    #Sous-catégorie de l'image cible
    Pin_SubCategorie: Mapped[str] = mapped_column(String(255))


    created_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True),
        default=datetime.utcnow,
        )

class  Categorie_pin(Base):
    __tablename__= "Categorie_pin"

    Id_categorie: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)

    #Chaque catégorie a un label ou nom qui permet de le reconnaitre

    label_Categorie: Mapped[str] = mapped_column(String(255), index=True)

    subCategories: Mapped[List["SubCategorie_pin"]] = relationship(back_populates="categories")

# classe subcategorie

class  SubCategorie_pin(Base):
    __tablename__= "SubCategorie_pin"

    Id_Subcategorie: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)

    #Chaque catégorie a un label ou nom qui permet de le reconnaitre

    label_SubCategorie: Mapped[str] = mapped_column(String(255), index=True)
    
    #Chaque sous-catégorie a un lien avec une catégorie
    Id_categorie : Mapped[int] = mapped_column(ForeignKey(Categorie_pin.Id_categorie))

    categories: Mapped["Categorie_pin"] = relationship(back_populates="subCategories")
