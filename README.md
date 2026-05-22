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
## 📊 Supplier Risk Analysis

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

## 🚀 How to Run
1. Generate dataset using Python
2. Load into SQL database
3. Run queries
4. Open Power BI dashboard
