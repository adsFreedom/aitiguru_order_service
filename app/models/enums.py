from enum import Enum


class OrderStatus(str, Enum):
    """Order status"""
    created = "created"
    confirmed = "confirmed"
    paid = "paid"
    shipped = "shipped"
    completed = "completed"
    canceled = "canceled"


class CategoryType(str, Enum):
    """Category type"""
    ROOT = "ROOT"
    CHILD = "CHILD"
