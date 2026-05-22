/*
   Description: Business-focused analytical queries to
   evaluate supplier performance, cost impact, inventory risk,
   and disruption patterns.
   */


-- 1. SUPPLIER RISK ANALYSIS
-- Objective:
-- Identify high-risk suppliers using delay performance
-- and reliability score.
--
-- Insight:
-- High delay + low reliability = highest risk suppliers

SELECT 
    s.supplier_id,
    s.supplier_name,
    s.country,
    
    ROUND(AVG(sh.delay_days), 2) AS avg_delay,
    COUNT(sh.shipment_id) AS total_shipments,
    ROUND(AVG(s.reliability_score), 2) AS reliability_score,
    
    -- Composite Risk Score
    ROUND(
        (AVG(sh.delay_days) * 0.6) + ((1 - AVG(s.reliability_score)) * 10 * 0.4),
        2
    ) AS risk_score

FROM suppliers s
JOIN orders o 
    ON s.supplier_id = o.supplier_id
JOIN shipments sh 
    ON o.order_id = sh.order_id

GROUP BY s.supplier_id, s.supplier_name, s.country
ORDER BY risk_score DESC;




-- 2. COST OF DELIVERY DELAYS
-- Objective:
-- Estimate financial impact of shipment delays
--
-- Insight:
-- A small number of suppliers typically drive the majority
-- of delay-related costs (Pareto effect)

SELECT 
    s.supplier_name,
    
    SUM(sh.shipping_cost) AS total_shipping_cost,
    SUM(sh.delay_days) AS total_delay_days,
    
    -- Estimated delay cost (business assumption: $50/day)
    SUM(sh.delay_days * 50) AS estimated_delay_cost

FROM shipments sh
JOIN orders o 
    ON sh.order_id = o.order_id
JOIN suppliers s 
    ON o.supplier_id = s.supplier_id

GROUP BY s.supplier_name
ORDER BY estimated_delay_cost DESC;
