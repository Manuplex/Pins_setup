"""
Gestion de la configuration de l'application.

On charge les valeurs depuis les variables d'environnement,
éventuellement complétées par un fichier `.env`.
"""

from __future__ import annotations


from pydantic_settings import BaseSettings, SettingsConfigDict
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent.parent.parent
ENV_FILE_PATH = BASE_DIR / ".env"

if not ENV_FILE_PATH.exists():
    print(f"⚠️ Alerte : Le fichier n'est pas trouvé à l'adresse : {ENV_FILE_PATH}")

class Settings(BaseSettings):
    """Configuration typée de l'application."""

    # URL de base de l'instance FreshRSS (ex: http://localhost:8080)
    freshrss_base_url: str =""

    # Clé ou token API FreshRSS (à configurer côté FreshRSS)
    freshrss_api_token: str =""

    # ID ou nom de la catégorie ciblée
    freshrss_category_id: str =""

    # DSN de connexion à MariaDB pour SQLAlchemy
    # Exemple : mysql+pymysql://user:password@host:3306/db_name
    database_url: str =""

    # Dossier où seront stockées les images téléchargées
    image_storage_dir: str =""

    #api_connexion
    freshrss_token_greader: str =""

    #hash _md5
    Hash_md5:  str =""

    #groq_key
    groq_Api_key: str =""

    #Asynchrone_session_db
    Async_database_url: str =""

    model_config = SettingsConfigDict(
        env_file=ENV_FILE_PATH,           # Il charge le .env automatiquement
        env_file_encoding="utf-8",
        extra="ignore"
    )


#On crée l'instance globale de configuration à utiliser dans toute l'application
settings = Settings()

