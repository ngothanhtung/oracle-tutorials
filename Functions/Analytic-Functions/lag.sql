SELECT 
 salesman_id,
 year, 
 sales
FROM 
 salesman_performance ORDER BY Year, SALES;
 
SELECT 
 salesman_id,
 year, 
 sales,
 LAG(sales) OVER (
 ORDER BY year
 ) py_sales
FROM 
 salesman_performance
WHERE
 salesman_id = 62;
 
 WITH cte_sales (
 salesman_id, 
 year, 
 sales,
 py_sales) 
AS (
 SELECT 
 salesman_id,
 year, 
 sales,
 LAG(sales) OVER (
 ORDER BY year
 ) py_sales
 FROM 
 salesman_performance
 WHERE
 salesman_id = 62
)
SELECT 
 salesman_id,
 year,
 sales,
 py_sales,
 CASE 
     WHEN py_sales IS NULL THEN 'N/A'
   ELSE
     TO_CHAR((sales - py_sales) * 100 / py_sales,'999999.99') || '%'
   END YoY
FROM 
 cte_sales;
 
 
-- Using Oracle LAG() function over partitions example
-- The following statement uses the LAG() function to return YoY sales performance of every salesman:
 WITH cte_sales (
 salesman_id, 
 year, 
 sales,
 py_sales) 
AS (
 SELECT 
 salesman_id,
 year, 
 sales,
 LAG(sales) OVER (
 PARTITION BY salesman_id
 ORDER BY year
 ) py_sales
 FROM 
 salesman_performance
)
SELECT 
 salesman_id,
 year,
 sales,
 py_sales,
 CASE 
     WHEN py_sales IS NULL THEN 'N/A'
   ELSE
     TO_CHAR((sales - py_sales) * 100 / py_sales,'999999.99') || '%'
   END YoY
FROM 
 cte_sales;