SELECT  country, AVG(reliability_score) most_reliable, AVG(1-reliability_score) AS riskiness FROM suppliers 
GROUP BY country
ORDER BY most_reliable DESC