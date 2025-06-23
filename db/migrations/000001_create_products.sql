CREATE TABLE products (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  price FLOAT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now()
);
