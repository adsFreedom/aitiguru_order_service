from datetime import datetime
from decimal import Decimal
from typing import List

from pydantic import BaseModel, Field, field_validator


class AddToOrderRequest(BaseModel):
    """Add product to order"""
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
    price: Decimal = Field(..., description="Order price", gt=0,
                           examples=[12.22])
    created_at: datetime
    updated_at: datetime

    class Config:
        from_attributes = True


class ProductInfo(BaseModel):
    """Product information for order details"""
    id: int
    name: str
    price: Decimal = Field(..., description="Product price", gt=0,
                           examples=[99.22])

    class Config:
        from_attributes = True


class OrderItemWithProduct(BaseModel):
    """Order item with product details"""
    id: int
    product: ProductInfo
    quantity: int
    price: Decimal = Field(..., description="Product price", gt=0,
                           examples=[55.33])
    subtotal: Decimal = Field(..., description="Product price", gt=0,
                              examples=[1099.22])

    class Config:
        from_attributes = True


class OrderResponse(BaseModel):
    """Response with order information and items"""
    id: int
    client_id: int
    order_date: datetime
    status: str
    items: List[OrderItemWithProduct]
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
