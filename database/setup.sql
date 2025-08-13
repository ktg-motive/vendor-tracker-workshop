-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create vendors table
CREATE TABLE vendors (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  category TEXT NOT NULL,
  contact_email TEXT,
  phone TEXT,
  typical_delivery_days INTEGER DEFAULT 3,
  preferred BOOLEAN DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW())
);

-- Create orders table
CREATE TABLE orders (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  vendor_id UUID REFERENCES vendors(id) ON DELETE CASCADE,
  order_date DATE NOT NULL,
  expected_delivery DATE,
  actual_delivery DATE,
  total_amount DECIMAL(10,2) NOT NULL,
  status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'delivered', 'cancelled')),
  items_ordered TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW())
);

-- Create order_ratings table
CREATE TABLE order_ratings (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  order_id UUID REFERENCES orders(id) ON DELETE CASCADE,
  quality_score INTEGER CHECK (quality_score >= 1 AND quality_score <= 5),
  delivery_score INTEGER CHECK (delivery_score >= 1 AND delivery_score <= 5),
  accuracy_score INTEGER CHECK (accuracy_score >= 1 AND accuracy_score <= 5),
  notes TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW())
);

-- Create indexes for better performance
CREATE INDEX idx_orders_vendor_id ON orders(vendor_id);
CREATE INDEX idx_orders_status ON orders(status);
CREATE INDEX idx_order_ratings_order_id ON order_ratings(order_id);

-- Create a view for vendor statistics
CREATE VIEW vendor_stats AS
SELECT 
  v.id,
  v.name,
  COUNT(DISTINCT o.id) as total_orders,
  AVG(o.total_amount) as avg_order_amount,
  AVG(r.quality_score) as avg_quality_score,
  AVG(r.delivery_score) as avg_delivery_score,
  AVG(r.accuracy_score) as avg_accuracy_score,
  AVG(
    CASE 
      WHEN o.actual_delivery IS NOT NULL AND o.expected_delivery IS NOT NULL 
      THEN EXTRACT(DAY FROM (o.actual_delivery - o.expected_delivery))
      ELSE NULL 
    END
  ) as avg_delivery_variance_days
FROM vendors v
LEFT JOIN orders o ON v.id = o.vendor_id
LEFT JOIN order_ratings r ON o.id = r.order_id
GROUP BY v.id, v.name;

-- Enable Row Level Security
ALTER TABLE vendors ENABLE ROW LEVEL SECURITY;
ALTER TABLE orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE order_ratings ENABLE ROW LEVEL SECURITY;

-- Create policies (for now, allow all for authenticated users)
CREATE POLICY "Enable all for authenticated users" ON vendors
  FOR ALL USING (auth.role() = 'authenticated');

CREATE POLICY "Enable all for authenticated users" ON orders
  FOR ALL USING (auth.role() = 'authenticated');

CREATE POLICY "Enable all for authenticated users" ON order_ratings
  FOR ALL USING (auth.role() = 'authenticated');

-- Create updated_at trigger function
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = TIMEZONE('utc', NOW());
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Apply updated_at triggers
CREATE TRIGGER update_vendors_updated_at BEFORE UPDATE ON vendors
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_orders_updated_at BEFORE UPDATE ON orders
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
