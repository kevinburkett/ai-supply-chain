package resolvers

import (
	"ai-supply-chain/db/sqlc"
	"bytes"
	"context"
	"database/sql"
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/google/uuid"
)

// UpdateStatus updates an order's status and delay risk.
func UpdateStatus(ctx context.Context, queries *db.Queries, client *http.Client, aiURL string, id uuid.UUID, status string) (db.Order, error) {
	var risk sql.NullFloat64
	if status != "DELIVERED" {
		payload, _ := json.Marshal(map[string]string{"order_id": id.String()})
		resp, err := client.Post(fmt.Sprintf("%s/predict_delay", aiURL), "application/json", bytes.NewReader(payload))
		if err != nil {
			return db.Order{}, err
		}
		defer resp.Body.Close()
		var out struct {
			Risk float64 `json:"risk"`
		}
		if err := json.NewDecoder(resp.Body).Decode(&out); err != nil {
			return db.Order{}, err
		}
		risk = sql.NullFloat64{Float64: out.Risk, Valid: true}
	}
	return queries.UpdateOrderStatus(ctx, db.UpdateOrderStatusParams{ID: id, Status: status, DelayRisk: risk})
}
