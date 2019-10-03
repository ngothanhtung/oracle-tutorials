SELECT * FROM salesman_performance ORDER BY SALES DESC;
1323237.445
SELECT MEDIAN(SALES)
from salesman_performance;

SELECT (1335817.98+ 1310656.91)/ 2 FROM dual;

select DISTINCT Year, MEDIAN(SALES) OVER (PARTITION BY Year) 
from salesman_performance ORDER BY Year;

SELECT Year, MEDIAN(SALES)
from salesman_performance 
GROUP BY YEAR
ORDER BY Year;


