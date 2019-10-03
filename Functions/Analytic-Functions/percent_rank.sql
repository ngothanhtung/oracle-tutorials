
-- PERCENT_RANK: Co bao nhieu % greater lon hon > (DESC)
-- CUME_DIST: Co bao nhieu % greater or equal >= (DESC)
SELECT * FROM salesman_performance WHERE YEAR = 2017 ORDER BY SALES ;

SELECT 
    salesman_id,
    sales,  
    ROUND(
       PERCENT_RANK() OVER (
          ORDER BY sales DESC
       ) * 100,2) || '%' percent_rank
FROM 
    salesman_performance
WHERE 
    YEAR = 2017;
    
    
SELECT 
    salesman_id,
    year,
    sales,  
    ROUND(PERCENT_RANK() OVER (
        PARTITION BY year
        ORDER BY sales DESC
    ) * 100,2) || '%' percent_rank
FROM 
    salesman_performance
WHERE 
    year in (2015,2016, 2017);   
    
    
    