-- name: AddOrderStatusUpdate :one
INSERT INTO order_status_updates (id, order_id, status)
VALUES ($1, $2, $3)
RETURNING *;

-- name: ListOrderStatusUpdates :many
SELECT * FROM order_status_updates
WHERE order_id = $1
ORDER BY created_at;
