3
4
5
6
7
8
9
10
11
SELECT 
 salesman_id,
 year, 
 sales,
 LEAD(sales) OVER (
 ORDER BY year
 ) following_year_sales
FROM 
 salesman_performance
WHERE
 salesman_id = 55;