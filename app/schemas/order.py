from datetime import datetime
from decimal import Decimal

from pydantic import BaseModel, Field, field_validator


class AddToOrderRequest(BaseModel):
    """Add product to order"""
    order_id: int = Field(..., description="Order ID", gt=0)
    product_id: int = Field(..., description="Product ID", gt=0)
    quantity: int = Field(..., gt=0, description="Product quantity")

    @field_validator('quantity')
    @classmethod
    def validate_quantity(cls, v: int) -> int:
        if v <= 0:
            raise ValueError('Must be > 0')
        return v


class OrderItemResponse(BaseModel):
    """Response with order product info"""
    id: int
    order_id: int
    product_id: int
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


class NotFoundError(BaseModel):
    """Error response for not found entities"""
    detail: str
    entity: str
    entity_id: int


class ConflictError(BaseModel):
    """Error response for data conflicts"""
    detail: str
