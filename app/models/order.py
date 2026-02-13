from datetime import datetime, timezone
from decimal import Decimal
from typing import List

from sqlalchemy import String, Numeric, ForeignKey, DateTime, Integer
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.database import Base
from .enums import OrderStatus


class Order(Base):
    """Order model"""
    __tablename__ = "orders"

    id: Mapped[int] = mapped_column(
        Integer,
        primary_key=True,
        autoincrement=True
    )
    client_id: Mapped[int] = mapped_column(
        Integer,
        ForeignKey('clients.id', ondelete='CASCADE'),
        nullable=False,
        index=True
    )
    order_date: Mapped[datetime] = mapped_column(
        DateTime(timezone=True),
        default=lambda: datetime.now(timezone.utc),
        index=True
    )
    status: Mapped[str] = mapped_column(
        String(50),
        default=OrderStatus.created.value,
        index=True
    )
    total_amount: Mapped[Decimal] = mapped_column(
        Numeric(12, 2),
        default=Decimal('0')
    )
    created_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True),
        default=lambda: datetime.now(timezone.utc)
    )
    updated_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True),
        default=lambda: datetime.now(timezone.utc),
        onupdate=lambda: datetime.now(timezone.utc)
    )

    # Relations
    client: Mapped["Client"] = relationship("Client", back_populates="orders")
    items: Mapped[List["OrderItem"]] = relationship(
        "OrderItem",
        back_populates="order",
        cascade="all, delete-orphan"
    )

    def __repr__(self) -> str:
        return (f"<Order(id={self.id}, client_id={self.client_id}, "
                f"status={self.status}, total={self.total_amount})>")
