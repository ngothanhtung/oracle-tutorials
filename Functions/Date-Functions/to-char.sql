-- Datetime Format Models
-- https://docs.oracle.com/cd/B19306_01/server.102/b14200/sql_elements004.htm#i34924

SELECT
  TO_CHAR(CURRENT_DATE)
FROM
  dual;

SELECT
  TO_CHAR(CURRENT_DATE, 'YYYY-MM-DD')
FROM  
  dual;
  
-- To convert the current system date to a long date string, you use the DL (DATE LONG) date format as follows:
SELECT
  TO_CHAR( sysdate, 'DL' )
FROM
  dual;
  
SELECT
  TO_NCHAR(sysdate, 'DL', 'NLS_DATE_LANGUAGE = VIETNAMESE')
FROM
  dual;
  
SELECT 
   TO_CHAR(INTERVAL '600' SECOND, 'HH24:MM') result
FROM 
   DUAL;
   
   
   
SELECT
  first_name, 
  last_name, 
  hire_date,
  TO_CHAR( hire_date, 'WW' ) joined_quarter
FROM
  employees
WHERE
  hire_date BETWEEN DATE  '2016-01-01'  AND date '2016-12-31'
ORDER BY
 first_name, last_name;