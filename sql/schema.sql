DROP TABLE IF EXISTS shipments, orders, inventory, disruptions, products, suppliers CASCADE;

-- SUPPLIERS
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    country VARCHAR(50),
    reliability_score NUMERIC(3,2),
    lead_time_avg INT
);

-- PRODUCTS
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_cost NUMERIC(10,2)
);

-- ORDERS
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    supplier_id INT REFERENCES suppliers(supplier_id),
    product_id INT REFERENCES products(product_id),
    order_quantity INT,
    expected_delivery_date DATE
);

-- SHIPMENTS
CREATE TABLE shipments (
    shipment_id INT PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    actual_delivery_date DATE,
    shipping_cost NUMERIC(10,2),
    delay_days INT,
    status VARCHAR(50)
);

-- INVENTORY
CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    date DATE,
    stock_level INT,
    reorder_point INT
);

-- DISRUPTIONS
CREATE TABLE disruptions (
    disruption_id INT PRIMARY KEY,
    date DATE,
    type VARCHAR(50),
    severity VARCHAR(20),
    affected_region VARCHAR(50)
);