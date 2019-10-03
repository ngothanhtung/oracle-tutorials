-- PERCENT_RANK = (RANK - 1)/(COUNT -1)
-- CUME_DIST = RANK/COUNT
SELECT 
    salesman_id,
    sales,  
    --(RANK() OVER(ORDER BY sales DESC)) AS "Rank",
    --(RANK() OVER(ORDER BY sales DESC) -1)*100.0/(COUNT(*) OVER() -1) AS PR,
    --(RANK() OVER(ORDER BY sales DESC)*100.0/(COUNT(*) OVER())) AS CD,
    ROUND(PERCENT_RANK() OVER (ORDER BY sales DESC       ) * 100,2) || '%' percent_rank,
    ROUND(cume_dist() OVER (ORDER BY sales DESC) * 100,2) || '%' cume_dist
FROM 
    salesman_performance
WHERE 
    YEAR = 2017;
    
-- As shown in the output, 33.33 % of salesman have sales amount greater than 1.99 million.

-- PERCENT_RANK: C� bao nhi�u % greater l?n > (DESC)
-- CUME_DIST: C� bao nhi�u % greater or equal >= (DESC)