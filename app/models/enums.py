from enum import Enum


class OrderStatus(str, Enum):
    """Order status"""
    CREATED = "CREATED"
    CONFIRMED = "CONFIRMED"
    PAID = "PAID"
    SHIPPED = "SHIPPED"
    COMPLETED = "COMPLETED"
    CANCELED = "CANCELED"


class CategoryType(str, Enum):
    """Category type"""
    ROOT = "ROOT"
    CHILD = "CHILD"
