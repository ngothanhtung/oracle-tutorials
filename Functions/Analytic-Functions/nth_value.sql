SELECT
    product_id,
    product_name,
    list_price,
     NTH_VALUE(list_price, 2) OVER (
        ORDER BY list_price DESC
        RANGE BETWEEN 
            UNBOUNDED PRECEDING AND 
            UNBOUNDED FOLLOWING
    ) AS second_most_expensive_product_list_price,
    NTH_VALUE(product_name, 2) OVER (
        ORDER BY list_price DESC
        RANGE BETWEEN 
            UNBOUNDED PRECEDING AND 
            UNBOUNDED FOLLOWING
    ) AS second_most_expensive_product
FROM
    products;
    
    
    
SELECT
    product_id,
    product_name,
    category_id,
    list_price,
    NTH_VALUE(product_name, 1) OVER (
        PARTITION BY category_id
        ORDER BY list_price DESC
        RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS second_most_expensive_product
FROM
    products;  