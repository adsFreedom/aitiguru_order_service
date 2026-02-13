from pydantic import BaseModel, SecretStr


class DBSettings(BaseModel):
    """PostgreSQL settings"""
    host: str = "localhost"
    port: int = 5432
    user: str = "postgres"
    password: SecretStr = "postgres"
    db: str = "order_db"

    @property
    def url(self) -> str:
        """Connection string"""
        auth = f"{self.user}:{self.password.get_secret_value()}"
        address = f"{self.host}:{self.port}"
        return f"postgresql+asyncpg://{auth}@{address}/{self.db}"

    @property
    def url_public(self):
        """Connection string for logging"""
        auth = f"{self.user}:*****"
        address = f"{self.host}:{self.port}"
        return f"postgresql+asyncpg://{auth}@{address}/{self.db}"
