from pathlib import Path

from pydantic_settings import BaseSettings, SettingsConfigDict

from .db import DBSettings


class Settings(BaseSettings):
    """App settings"""
    model_config = SettingsConfigDict(
        env_nested_delimiter="_",
        env_nested_max_split=1,
        env_file=Path(__file__).parents[2] / ".env",
        extra='ignore'
    )

    db: DBSettings = DBSettings()


settings = Settings()
print("Settings:")
print(f"{settings.db=}")
