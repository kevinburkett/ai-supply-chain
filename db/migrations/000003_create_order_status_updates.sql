CREATE TABLE order_status_updates (
  id UUID PRIMARY KEY,
  order_id UUID REFERENCES orders(id),
  status TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now()
);
