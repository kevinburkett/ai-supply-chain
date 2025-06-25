package graph

// This file will not be regenerated automatically.
//
// It serves as dependency injection for your app, add any dependencies you require here.

import (
	db "ai-supply-chain/db/sqlc"
	"net/http"
)

type Resolver struct {
	Queries      *db.Queries
	HTTPClient   *http.Client
	AIServiceURL string
}
