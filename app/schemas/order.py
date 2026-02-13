from datetime import datetime
from decimal import Decimal
from uuid import UUID

from pydantic import BaseModel, Field, field_validator


class AddToOrderRequest(BaseModel):
    """Add product to order"""
    order_id: UUID = Field(..., description="Order ID")
    product_id: UUID = Field(..., description="Product ID")
    quantity: int = Field(..., gt=0, description="Product quantity")

    @field_validator('quantity')
    @classmethod
    def validate_quantity(cls, v: int) -> int:
        if v <= 0:
            raise ValueError('Must be > 0')
        return v


class OrderItemResponse(BaseModel):
    """Response with order product info"""
    id: UUID
    order_id: UUID
    product_id: UUID
    quantity: int
    price: Decimal
    created_at: datetime
    updated_at: datetime

    class Config:
        from_attributes = True


class InsufficientStockError(BaseModel):
    """Error: product not available"""
    detail: str
    available: int
    requested: int
