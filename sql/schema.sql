
-- SUPPLIERS TABLE
CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(100),
    country VARCHAR(50),
    reliability_score NUMERIC(3,2)
);

-- PRODUCTS TABLE
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price NUMERIC(10,2)
);

-- ORDERS TABLE
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    supplier_id INT REFERENCES suppliers(supplier_id),
    product_id INT REFERENCES products(product_id),
    order_date DATE,
    quantity INT,
    expected_delivery_date DATE
);

-- SHIPMENTS TABLE
CREATE TABLE shipments (
    shipment_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    actual_delivery_date DATE,
    delay_days INT,
    shipping_cost NUMERIC(10,2)
);

-- INVENTORY TABLE
CREATE TABLE inventory (
    inventory_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    stock_level INT,
    reorder_point INT,
    last_updated DATE
);

-- DISRUPTIONS TABLE
CREATE TABLE disruptions (
    disruption_id SERIAL PRIMARY KEY,
    supplier_id INT REFERENCES suppliers(supplier_id),
    disruption_type VARCHAR(50),
    start_date DATE,
    end_date DATE,
    impact_level VARCHAR(20)
);