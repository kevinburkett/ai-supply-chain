from fastapi import FastAPI
from pydantic import BaseModel
from typing import List

app = FastAPI()

class DelayPredictionRequest(BaseModel):
    """Request body for delay prediction."""
    order_id: int
    features: List[float] = []

@app.post("/predict_delay")
def predict_delay(req: DelayPredictionRequest):
    if req.features:
        predicted_delay = sum(req.features) / len(req.features)
    else:
        predicted_delay = 0.0
    return {"order_id": req.order_id, "predicted_delay": predicted_delay}

@app.get("/forecast")
def forecast():
    return {"forecast": "coming soon"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="0.0.0.0", port=8000)
