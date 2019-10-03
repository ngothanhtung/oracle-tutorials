-- Unlike the RANK() function, the DENSE_RANK() function returns rank values as consecutive integers. 
-- It does not skip rank in case of ties. 
-- Rows with the same values for the rank criteria will receive the same rank values.


CREATE TABLE dense_rank_demo (
    col VARCHAR2(10) NOT NULL
);

INSERT ALL 
    INTO dense_rank_demo(col) VALUES('A')
    INTO dense_rank_demo(col) VALUES('A')
    INTO dense_rank_demo(col) VALUES('B')
    INTO dense_rank_demo(col) VALUES('C')
    INTO dense_rank_demo(col) VALUES('C')
    INTO dense_rank_demo(col) VALUES('C')
    INTO dense_rank_demo(col) VALUES('D')
SELECT 1 FROM dual; 


SELECT col FROM dense_rank_demo;



SELECT
 col,
 DENSE_RANK () OVER ( 
 ORDER BY col ) 
 col
FROM
 dense_rank_demo;
 
 
 
SELECT 
    product_name, 
    list_price, 
    DENSE_RANK() OVER(ORDER BY list_price) 
FROM 
    products;    
    
    
    
WITH cte_products AS(  
SELECT 
    product_name, 
    list_price, 
    DENSE_RANK() OVER(
    ORDER BY list_price
    ) my_rank
FROM 
    products
)
SELECT * FROM cte_products
WHERE my_rank <= 10;



WITH cte_products AS(  
SELECT 
    product_name, 
    category_id,
    list_price, 
    DENSE_RANK() OVER (
    PARTITION BY category_id
    ORDER BY list_price
    ) my_rank
FROM 
    products
)
SELECT * FROM cte_products
WHERE my_rank <= 5;


