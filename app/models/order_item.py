from datetime import datetime, timezone
from decimal import Decimal

from sqlalchemy import (Integer, Numeric, ForeignKey, DateTime,
                        CheckConstraint, UniqueConstraint)
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.database import Base


class OrderItem(Base):
    """Order item model"""
    __tablename__ = "order_items"

    id: Mapped[int] = mapped_column(
        Integer,
        primary_key=True,
        autoincrement=True
    )
    order_id: Mapped[int] = mapped_column(
        Integer,
        ForeignKey('orders.id', ondelete='CASCADE'),
        nullable=False,
        index=True
    )
    product_id: Mapped[int] = mapped_column(
        Integer,
        ForeignKey('products.id', ondelete='CASCADE'),
        nullable=False,
        index=True
    )
    quantity: Mapped[int] = mapped_column(Integer, nullable=False)
    price: Mapped[Decimal] = mapped_column(Numeric(10, 2), nullable=False)
    created_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True),
        default=lambda: datetime.now(timezone.utc)
    )
    updated_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True),
        default=lambda: datetime.now(timezone.utc),
        onupdate=lambda: datetime.now(timezone.utc)
    )

    __table_args__ = (
        UniqueConstraint('order_id', 'product_id', name='uq_order_product'),
        CheckConstraint('quantity > 0', name='check_quantity_positive'),
        CheckConstraint('price > 0', name='check_price_positive'),
    )

    # Relations
    order: Mapped["Order"] = relationship("Order", back_populates="items")
    product: Mapped["Product"] = relationship("Product",
                                              back_populates="order_items")

    def __repr__(self) -> str:
        return (f"<OrderItem(id={self.id}, order_id={self.order_id}, "
                f"product_id={self.product_id}, quantity={self.quantity})>")
