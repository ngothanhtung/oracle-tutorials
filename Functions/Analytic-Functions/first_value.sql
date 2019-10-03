SELECT * FROM products WHERE 
    category_id = 1 ORDER BY list_price;
    
    
    
SELECT 
    product_id, 
    product_name,
    list_price, 
    FIRST_VALUE(product_name)   
    OVER (ORDER BY list_price) first_product,
    
    FIRST_VALUE(list_price)   
    OVER (ORDER BY list_price) first_product_list_price
FROM 
    products
WHERE 
    category_id = 1;
    
    
    
SELECT 
    product_id, 
    product_name,
    category_id,
    list_price, 
    FIRST_VALUE(product_name) 
        OVER (
            PARTITION BY category_id
            ORDER BY list_price
        ) first_product
FROM 
    products;  