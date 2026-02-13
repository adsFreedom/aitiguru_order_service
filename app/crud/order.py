from decimal import Decimal
from uuid import UUID

from fastapi import HTTPException, status
from sqlalchemy import select, func
from sqlalchemy.exc import IntegrityError
from sqlalchemy.ext.asyncio import AsyncSession

from app.models import Order, Product, OrderItem


async def add_product_to_order(
        db: AsyncSession,
        order_id: UUID,
        product_id: UUID,
        quantity: int
) -> OrderItem:
    """Add product to order."""
    order = await db.get(Order, order_id)
    if not order:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Order ID {order_id} not found"
        )

    stmt = select(Product).where(Product.id == product_id).with_for_update()
    result = await db.execute(stmt)
    product = result.scalar_one_or_none()

    if not product:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Product ID {product_id} not found"
        )

    if product.quantity < quantity:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail={
                "detail": "Out of stock",
                "available": product.quantity,
                "requested": quantity
            }
        )

    stmt = select(OrderItem).where(
        OrderItem.order_id == order_id,
        OrderItem.product_id == product_id
    ).with_for_update()
    result = await db.execute(stmt)
    existing_item = result.scalar_one_or_none()

    if existing_item:
        new_quantity = existing_item.quantity + quantity

        if product.quantity < new_quantity:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail={
                    "detail": "Out of stock for update",
                    "available": product.quantity,
                    "requested": new_quantity
                }
            )

        existing_item.quantity = new_quantity
        existing_item.price = product.price
        order_item = existing_item
    else:
        order_item = OrderItem(
            order_id=order_id,
            product_id=product_id,
            quantity=quantity,
            price=product.price
        )
        db.add(order_item)

    product.quantity -= quantity

    stmt = select(
        func.sum(OrderItem.quantity * OrderItem.price)
    ).where(OrderItem.order_id == order_id)

    result = await db.execute(stmt)
    total_amount = result.scalar() or Decimal('0')
    order.total_amount = total_amount

    try:
        await db.commit()
        await db.refresh(order_item)
        return order_item
    except IntegrityError as e:
        await db.rollback()
        print(f"DB conflict{str(e)}")
        raise HTTPException(
            status_code=status.HTTP_409_CONFLICT,
            detail="DB conflict"
        )
