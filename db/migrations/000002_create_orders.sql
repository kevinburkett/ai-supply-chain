CREATE TABLE orders (
  id UUID PRIMARY KEY,
  product_id UUID REFERENCES products(id),
  quantity INT NOT NULL,
  status TEXT NOT NULL,
  delay_risk FLOAT DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT now()
);
