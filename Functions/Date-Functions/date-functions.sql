-- Oracle's National Language Support (NLS)
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY HH24:MI:SS';

SELECT
  SESSIONTIMEZONE
FROM
  DUAL;
  
-- To get the current date in the session time zone, you use the following statement:
SELECT
  CURRENT_DATE
FROM
  DUAL;
  
  	
ALTER SESSION SET TIME_ZONE = '-09:00';
-- To get the current date in the session time zone, you use the following statement:
SELECT
  CURRENT_DATE
FROM
  DUAL;
  
