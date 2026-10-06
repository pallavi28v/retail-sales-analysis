-- Retail Sales Analysis SQL
-- Compatible with MySQL 8+

CREATE TABLE retail_sales (
    sale_date DATE,
    product VARCHAR(100),
    category VARCHAR(100),
    region VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(12,2),
    discount DECIMAL(5,2),
    revenue DECIMAL(12,2)
);

-- 1. Total revenue
SELECT ROUND(SUM(revenue),2) AS total_revenue
FROM retail_sales;

-- 2. Revenue by category
SELECT category, ROUND(SUM(revenue),2) AS revenue
FROM retail_sales
GROUP BY category
ORDER BY revenue DESC;

-- 3. Revenue by region
SELECT region, ROUND(SUM(revenue),2) AS revenue
FROM retail_sales
GROUP BY region
ORDER BY revenue DESC;

-- 4. Top 5 products
SELECT product, ROUND(SUM(revenue),2) AS revenue
FROM retail_sales
GROUP BY product
ORDER BY revenue DESC
LIMIT 5;

-- 5. Monthly revenue trend
SELECT DATE_FORMAT(sale_date,'%Y-%m') AS month,
       ROUND(SUM(revenue),2) AS revenue
FROM retail_sales
GROUP BY month
ORDER BY month;

-- 6. Average order value
SELECT ROUND(AVG(revenue),2) AS avg_order_value
FROM retail_sales;
