SELECT 
    ROW_NUMBER() OVER(
        ORDER BY list_price DESC
    ) row_num, 
    product_name, 
    list_price
FROM 
    products;    
    
-- Using Oracle ROW_NUMBER() function for pagination
WITH cte_products AS (
    SELECT 
        row_number() OVER(
            ORDER BY list_price DESC
        ) row_num, 
        product_name, 
        list_price
    FROM 
        products
)
SELECT * FROM cte_products
WHERE row_num > 30 and row_num <= 40;

-- Using Oracle ROW_NUMBER() function for the top-N query example
-- To get a single most expensive product by category, you can use the ROW_NUMBER() function as shown in the following query:
WITH cte_products AS (
SELECT 
    row_number() OVER(
        PARTITION BY category_id
        ORDER BY list_price DESC
    ) row_num, 
    category_id,
    product_name, 
    list_price
FROM 
    products
)
SELECT * FROM cte_products
WHERE row_num = 1;
-- First, the PARTITION BY clause divided the rows into partitions by category id.
-- Then, the ORDER BY clause sorted the products in each category by list prices in descending order.
-- Next, the ROW_NUMBER() function is applied to each row in a specific category id. It re-initialized the row number for each category.
-- After that, the outer query selected the rows with the row number 1 which is the most expensive product in each category.