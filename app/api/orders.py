from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession

from app.crud import add_product_to_order
from app.database import get_db
from app.schemas import (AddToOrderRequest, OrderItemResponse,
                         InsufficientStockError, NotFoundError, ConflictError)

router = APIRouter(prefix="/orders", tags=["orders"])


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
