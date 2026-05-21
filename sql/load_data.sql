\copy suppliers FROM 'data/raw/suppliers.csv' DELIMITER ',' CSV HEADER;
\copy products FROM 'data/raw/products.csv' DELIMITER ',' CSV HEADER;
\copy orders FROM 'data/raw/orders.csv' DELIMITER ',' CSV HEADER;
\copy shipments FROM 'data/raw/shipments.csv' DELIMITER ',' CSV HEADER;
\copy inventory FROM 'data/raw/inventory.csv' DELIMITER ',' CSV HEADER;
\copy disruptions FROM 'data/raw/disruptions.csv' DELIMITER ',' CSV HEADER;