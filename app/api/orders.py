from decimal import Decimal

from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession

from app.crud import add_product_to_order, get_order_with_items
from app.database import get_db
from app.schemas import (AddToOrderRequest, OrderItemResponse, OrderResponse,
                         InsufficientStockError, NotFoundError, ConflictError)

router = APIRouter(prefix="/orders", tags=["orders"])


@router.get(
    "/{order_id}",
    response_model=OrderResponse,
    responses={
        404: {
            "model": NotFoundError,
            "description": "Order not found"
        }
    },
    summary="Get order details with items",
    description="Get complete order information including all items."
)
async def get_order(
        order_id: int,
        db: AsyncSession = Depends(get_db)
):
    """Get order by ID with all items."""
    order = await get_order_with_items(db, order_id)

    items_with_subtotal = []
    for item in order.items:
        subtotal = Decimal(item.quantity) * Decimal(item.price)
        items_with_subtotal.append({
            "id": item.id,
            "product": {
                "id": item.product.id,
                "name": item.product.name,
                "price": item.product.price
            },
            "quantity": item.quantity,
            "price": item.price,
            "subtotal": subtotal
        })

    return {
        "id": order.id,
        "client_id": order.client_id,
        "order_date": order.order_date,
        "status": order.status,
        "items": items_with_subtotal,
        "created_at": order.created_at,
        "updated_at": order.updated_at
    }


@router.post(
    "/{order_id}/items",
    response_model=OrderItemResponse,
    status_code=201,
    responses={
        400: {
            "model": InsufficientStockError,
            "description": "Insufficient product quantity in stock"
        },
        404: {
            "model": NotFoundError,
            "description": "Order or product not found"
        },
        409: {
            "model": ConflictError,
            "description": "Data conflict occurred"
        }
    }
)
async def add_item_to_order(
        order_id: int,
        request: AddToOrderRequest,
        db: AsyncSession = Depends(get_db)
):
    """Add product item to order."""
    if order_id != request.order_id:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="order_id in URL and request not equal"
        )

    return await add_product_to_order(
        db=db,
        order_id=request.order_id,
        product_id=request.product_id,
        quantity=request.quantity
    )
