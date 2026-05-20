import pandas as pd
import numpy as np
from datetime import datetime, timedelta
import random
import os

np.random.seed(42)
random.seed(42)

# -----------------------------
# CREATE OUTPUT DIRECTORY
# -----------------------------
output_path = "../data/raw/"
os.makedirs(output_path, exist_ok=True)

# -----------------------------
# 1. SUPPLIERS
# -----------------------------
num_suppliers = 20

suppliers = pd.DataFrame({
    "supplier_id": range(1, num_suppliers + 1),
    "supplier_name": [f"Supplier_{i}" for i in range(1, num_suppliers + 1)],
    "country": np.random.choice(["China", "USA", "Germany", "India", "Nigeria"], num_suppliers),
    "reliability_score": np.round(np.random.uniform(0.7, 0.98, num_suppliers), 2),
    "lead_time_avg": np.random.randint(5, 30, num_suppliers)
})

# -----------------------------
# 2. PRODUCTS
# -----------------------------
num_products = 50

products = pd.DataFrame({
    "product_id": range(1, num_products + 1),
    "product_name": [f"Product_{i}" for i in range(1, num_products + 1)],
    "category": np.random.choice(["Electronics", "Clothing", "Food", "Furniture"], num_products),
    "unit_cost": np.round(np.random.uniform(10, 500, num_products), 2)
})

# -----------------------------
# 3. ORDERS
# -----------------------------
num_orders = 1000
start_date = datetime(2023, 1, 1)

orders_list = []

for i in range(1, num_orders + 1):
    order_date = start_date + timedelta(days=int(random.randint(0, 365)))
    supplier_id = random.randint(1, num_suppliers)
    product_id = random.randint(1, num_products)

    lead_time = int(
        suppliers.loc[suppliers["supplier_id"] == supplier_id, "lead_time_avg"].values[0]
    )

    expected_delivery = order_date + timedelta(days=lead_time)

    orders_list.append([
        i,
        order_date,
        supplier_id,
        product_id,
        random.randint(10, 200),
        expected_delivery
    ])

orders = pd.DataFrame(orders_list, columns=[
    "order_id", "order_date", "supplier_id", "product_id",
    "order_quantity", "expected_delivery_date"
])

# -----------------------------
# 4. DISRUPTIONS
# -----------------------------
num_disruptions = 100

disruptions = pd.DataFrame({
    "disruption_id": range(1, num_disruptions + 1),
    "date": [start_date + timedelta(days=int(random.randint(0, 365))) for _ in range(num_disruptions)],
    "type": np.random.choice(["Weather", "Fuel", "Strike", "Port Delay"], num_disruptions),
    "severity": np.random.choice(["Low", "Medium", "High"], num_disruptions),
    "affected_region": np.random.choice(["Asia", "Europe", "Africa", "America"], num_disruptions)
})

# -----------------------------
# 5. SHIPMENTS (FIXED SECTION)
# -----------------------------
shipments_list = []

for _, row in orders.iterrows():
    base_delay = int(np.random.randint(-2, 10))  # FIXED
    disruption_effect = int(np.random.choice([0, 2, 5], p=[0.7, 0.2, 0.1]))  # FIXED

    delay_days = int(base_delay + disruption_effect)  # FIXED

    actual_delivery = row["expected_delivery_date"] + timedelta(days=delay_days)

    if delay_days > 2:
        status = "Delayed"
    elif delay_days < 0:
        status = "Early"
    else:
        status = "On-time"

    shipments_list.append([
        row["order_id"],
        actual_delivery,
        round(float(np.random.uniform(50, 500)), 2),
        delay_days,
        status
    ])

shipments = pd.DataFrame(shipments_list, columns=[
    "order_id", "actual_delivery_date", "shipping_cost",
    "delay_days", "status"
])

shipments.insert(0, "shipment_id", range(1, len(shipments) + 1))

# -----------------------------
# 6. INVENTORY
# -----------------------------
inventory_list = []

for product_id in products["product_id"]:
    stock = random.randint(50, 200)

    for day in range(30):
        date = datetime(2023, 12, 1) + timedelta(days=int(day))

        stock -= random.randint(0, 10)

        if stock < 20:
            stock += random.randint(50, 100)

        inventory_list.append([
            product_id,
            date,
            max(int(stock), 0),
            30
        ])

inventory = pd.DataFrame(inventory_list, columns=[
    "product_id", "date", "stock_level", "reorder_point"
])

inventory.insert(0, "inventory_id", range(1, len(inventory) + 1))

# -----------------------------
# SAVE FILES
# -----------------------------
suppliers.to_csv(os.path.join(output_path, "suppliers.csv"), index=False)
products.to_csv(os.path.join(output_path, "products.csv"), index=False)
orders.to_csv(os.path.join(output_path, "orders.csv"), index=False)
shipments.to_csv(os.path.join(output_path, "shipments.csv"), index=False)
inventory.to_csv(os.path.join(output_path, "inventory.csv"), index=False)
disruptions.to_csv(os.path.join(output_path, "disruptions.csv"), index=False)

