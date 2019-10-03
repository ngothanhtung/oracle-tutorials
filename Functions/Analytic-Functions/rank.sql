CREATE TABLE rank_demo (
 col VARCHAR(10) NOT NULL
);


INSERT ALL 
    INTO rank_demo(col) VALUES('A')
    INTO rank_demo(col) VALUES('A')
    INTO rank_demo(col) VALUES('B')
    INTO rank_demo(col) VALUES('C')
    INTO rank_demo(col) VALUES('C')
    INTO rank_demo(col) VALUES('C')
    INTO rank_demo(col) VALUES('D')
SELECT 1 FROM dual; 


SELECT col FROM rank_demo;


SELECT 
 col, 
 RANK() OVER (ORDER BY col) my_rank
FROM 
 rank_demo;
 
-- 
SELECT 
 product_name, 
 list_price, 
 RANK() OVER(ORDER BY list_price DESC) "RANK"
FROM 
 products;
 
 

 
WITH cte_products AS (
 SELECT 
 product_name, 
 list_price, 
 RANK() OVER(ORDER BY list_price DESC) price_rank
 FROM 
 products
)
SELECT 
 product_name,  
 list_price,
 price_rank
FROM 
 cte_products
WHERE
 price_rank <= 10;
 
 
 
-- Using Oracle RANK() function with PARTITION BY example
-- The following example returns the top-3 most expensive products for each category:
WITH cte_products AS (
    SELECT 
    product_name, 
    list_price, 
    category_id,
    RANK() OVER(
    PARTITION BY category_id
    ORDER BY list_price DESC) 
    price_rank
    FROM 
    products
)
SELECT 
    product_name,  
    list_price,
    category_id,
    price_rank
FROM 
    cte_products
WHERE
    price_rank <= 4;
 
 