USE car_dealership;

-- =========================================
-- 1. View All Tables
-- =========================================
SELECT 'branches'   AS table_name, COUNT(*) AS row_count FROM branches
UNION ALL
SELECT 'car_models', COUNT(*) FROM car_models
UNION ALL
SELECT 'customers',  COUNT(*) FROM customers
UNION ALL
SELECT 'inventory',  COUNT(*) FROM inventory
UNION ALL
SELECT 'sales',      COUNT(*) FROM sales;

-- =========================================
-- 2. Low Stock Report
-- =========================================
SELECT
    b.branch_name,
    cm.make,
    cm.model_name,
    cm.model_year,
    i.quantity,
    i.min_threshold
FROM inventory i
JOIN branches b   ON i.branch_id = b.branch_id
JOIN car_models cm ON i.model_id = cm.model_id
WHERE i.quantity < i.min_threshold
ORDER BY b.branch_name, cm.make, cm.model_name;

-- =========================================
-- 3. Total Sales and Revenue per Branch
-- =========================================
SELECT
    b.branch_name,
    COUNT(s.sale_id) AS total_cars_sold,
    SUM(s.sale_price) AS total_revenue
FROM sales s
JOIN branches b ON s.branch_id = b.branch_id
GROUP BY b.branch_id, b.branch_name
ORDER BY total_revenue DESC;

-- =========================================
-- 4. Top-Selling Models
-- =========================================
SELECT
    cm.make,
    cm.model_name,
    cm.model_year,
    COUNT(s.sale_id) AS units_sold,
    SUM(s.sale_price) AS total_revenue
FROM sales s
JOIN car_models cm ON s.model_id = cm.model_id
GROUP BY cm.model_id, cm.make, cm.model_name, cm.model_year
ORDER BY units_sold DESC;

-- =========================================
-- 5. Customer Purchase History
-- =========================================
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(s.sale_id) AS cars_purchased,
    SUM(s.sale_price) AS total_spent
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id, customer_name
ORDER BY total_spent DESC;

-- =========================================
-- 6. Average Sale Price by Model
-- =========================================
SELECT
    cm.make,
    cm.model_name,
    cm.model_year,
    AVG(s.sale_price) AS avg_sale_price,
    COUNT(s.sale_id) AS units_sold
FROM sales s
JOIN car_models cm ON s.model_id = cm.model_id
GROUP BY cm.model_id, cm.make, cm.model_name, cm.model_year
ORDER BY avg_sale_price DESC;

-- =========================================
-- 7. Branch Inventory Summary
-- =========================================
SELECT
    b.branch_name,
    SUM(i.quantity) AS total_units_in_stock,
    COUNT(DISTINCT i.model_id) AS distinct_models_in_stock
FROM inventory i
JOIN branches b ON i.branch_id = b.branch_id
GROUP BY b.branch_id, b.branch_name
ORDER BY total_units_in_stock DESC;

-- =========================================
-- 8. Restock Suggestions
-- =========================================
SELECT
    b.branch_name,
    cm.make,
    cm.model_name,
    cm.model_year,
    i.quantity,
    i.min_threshold,
    (i.min_threshold * 2 - i.quantity) AS suggested_restock_amount
FROM inventory i
JOIN branches b ON i.branch_id = b.branch_id
JOIN car_models cm ON i.model_id = cm.model_id
WHERE i.quantity < i.min_threshold
ORDER BY b.branch_name, cm.make, cm.model_name;
