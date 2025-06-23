-- name: CreateProduct :one
INSERT INTO products (id, name, price)
VALUES ($1, $2, $3)
RETURNING *;

-- name: GetProduct :one
SELECT * FROM products WHERE id = $1;

-- name: ListProducts :many
SELECT * FROM products ORDER BY name;
