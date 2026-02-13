from fastapi import FastAPI

app = FastAPI(
    title="Order Service",
    description="Service for managing orders",
    version="0.1.0"
)


@app.get("/")
async def root():
    return {
        "message": "Order Service API",
        "status": "running",
        "docs": "/docs"
    }


@app.get(
    "/health",
    summary="Check connection",
    description="Check service is ready to work (return status: healthy)"
)
async def health_check():
    return {
        "status": "healthy",
        "service": "order-service"
    }


if __name__ == "__main__":
    import uvicorn

    uvicorn.run(
        "app.main:app",
        host="0.0.0.0",
        port=8000,
        reload=True
    )
