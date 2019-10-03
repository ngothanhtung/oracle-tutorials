SELECT 
 salesman_id, 
 sales,
 NTILE(4) OVER(
 ORDER BY sales DESC
 ) quartile
FROM 
 salesman_performance
WHERE 
 year = 2017;
 
-- 10 / 4 = 2 du 2
-- 2 + 1 = 3
-- 2 + 1 = 3
-- 2
-- 2

 --9 / 2 = 4 du 1
 
 -- 4 + 1   = 5
 -- 4       = 4    
 
 -- 9 / 4 = 2  du 1

 -- 2 + 1   = 3
 -- 2       = 2
 -- 2       = 2
 -- 2       = 2

 
 
SELECT 
 salesman_id, 
 sales,
 year,
 NTILE(4) OVER(
 PARTITION BY year
 ORDER BY sales DESC
 ) quartile
FROM 
 salesman_performance
WHERE
 year = 2016 OR year = 2017;