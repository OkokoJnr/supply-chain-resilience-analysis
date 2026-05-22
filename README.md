# Supply Chain Disruption & Resilience Analysis

## 📌 Project Overview
This project analyzes supply chain operations to identify delivery delays, supplier risks, and inventory inefficiencies. It provides actionable insights to improve supply chain resilience.

## 🎯 Objectives
- Identify high-risk suppliers
- Analyze delivery delays and disruptions
- Evaluate inventory stockouts
- Recommend optimization strategies

## 📊 Dataset

This project uses a synthetically generated dataset simulating a real-world supply chain system, including:

- Suppliers
- Orders
- Shipments
- Inventory
- Disruptions

The dataset is generated using a custom Python script to mimic real operational scenarios such as delays and supply chain disruptions.

## ⚙️ Data Pipeline

This project includes a fully reproducible data pipeline:

1. Synthetic data generation using Python
2. Relational schema design in PostgreSQL
3. Data loading using SQL scripts (`\copy`)
4. Structured analysis using SQL queries

To reproduce:
```bash
psql -U postgres -d supply_chain_db -f sql/schema.sql
psql -U postgres -d supply_chain_db -f sql/load_data.sql
```

## 🛠 Tools Used
- SQL (data querying & transformation)
- Python (EDA, simulation, modeling)
- Power BI (dashboard & visualization)

## 📂 Project Structure
- data/ → raw & processed datasets
- sql/ → schema & queries
- python/ → analysis & modeling
- dashboard/ → Power BI file

## 📊 Key Insights 

=================================================================
1. ## 📊 Supplier Risk Analysis

### Objective
    Identify high-risk suppliers using delivery performance and reliability metrics.

### Methodology
    - Combined average delivery delay and supplier reliability
    - Applied weighted scoring (60% delay, 40% reliability)

### Key Findings
    - Supplier_2, Supplier_11, and Supplier_3 exhibit the highest risk scores
    - High delays combined with low reliability significantly increase supplier risk
    - Some suppliers maintain low risk despite high delays due to strong reliability

### Business Impact
    - High-risk suppliers can disrupt operations and increase costs
    - Over-reliance on these suppliers introduces supply chain vulnerability

### ✅ Recommendations 
    - Prioritize high-risk suppliers for performance review
    - Renegotiate service level agreements (SLAs)
    - Diversify supplier base to reduce dependency
    - Implement continuous supplier performance monitoring

=================================================================

2. ## 💰 Cost of Delivery Delays

- Supplier_3 and Supplier_14 contribute the highest delay-related costs
- Delay cost is driven primarily by accumulated delay days, not shipping cost
- A small number of suppliers account for a disproportionate share of total delay cost

### Business Impact
- Delay-related costs represent a significant operational inefficiency
- Targeting top suppliers could yield substantial cost savings

### Recommendations
- Prioritize high-cost suppliers for intervention
- Introduce contractual penalties for delays
- Reallocate order volume to better-performing suppliers

=================================================================

3. ## 📦 Inventory Risk Analysis

Approximately 22% of products are below their reorder point, indicating a moderate stockout risk.

### Findings:
- Multiple products are operating close to or below safety stock levels
- Some products are significantly overstocked, creating inefficiencies
- Inventory imbalance exists across categories

### Business Impact:
- Stockouts may lead to lost sales and customer dissatisfaction
- Overstock ties up capital and increases storage cost

### Recommendation:
- Implement dynamic reorder thresholds
- Introduce early warning stock alerts
- Optimize inventory distribution across categories


=================================================================
## 🌍 Disruption Impact Analysis

### Key Insight:
Port delays are the most frequent disruption type, while weather-related events contribute the highest severity impact.

### Findings:
- Port delays account for the highest number of disruption events
- Weather disruptions are more severe on average
- Fuel disruptions are consistent across severity levels

### Business Impact:
- External disruptions significantly affect supply chain reliability
- Multiple risk sources create unpredictability in operations

### Recommendation:
- Diversify logistics routes and suppliers
- Implement buffer stock strategies for high-risk disruption periods
- Develop contingency plans for weather and port-related disruptions

=================================================================

## 🚀 How to Run
1. Generate dataset using Python
2. Load into SQL database
3. Run queries
4. Open Power BI dashboard