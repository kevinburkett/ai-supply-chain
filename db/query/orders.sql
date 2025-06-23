-- name: CreateOrder :one
INSERT INTO orders (id, product_id, quantity, status, delay_risk)
VALUES ($1, $2, $3, $4, $5)
RETURNING *;

-- name: GetOrder :one
SELECT * FROM orders WHERE id = $1;

-- name: ListOrders :many
SELECT * FROM orders ORDER BY created_at DESC;
