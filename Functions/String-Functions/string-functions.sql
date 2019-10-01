 -- https://theasciicode.com.ar/ascii-printable-characters/number-nine-ascii-code-57.html
 -- The Oracle ASCII function returns an ASCII code value of a character or character expression.
 
SELECT
  ASCII( 'A' ),
  ASCII( 'B' ),
  ASCII( 'C' )
FROM
  dual;
  
  
  
SELECT
  CHR( 83 ),
  CHR( 115 )
FROM
  dual;
  
  
  
-- The following statement uses the  CHR() function to output the first five employees of the company:
SELECT
  first_name  || ' '  || last_name  || 
  CHR( 9 )  || ' joined on '  || CHR( 9 )  || 
  to_char(hire_date,'DD-MON-YYYY') first_5_employees
FROM
  employees
ORDER BY
  hire_date
FETCH
  FIRST 5 ROWS ONLY;
  
  
-- https://www.databasestar.com/oracle-dump/
SELECT 
    DUMP('Oracle DUMP') AS result
FROM 
    DUAL; 
    
SELECT 
    DUMP('Oracle DUMP', 17) AS result
FROM 
    DUAL; 
    
    
SELECT 
    name, 
    DUMP(name, 17) result
FROM 
    customers
ORDER BY 
    name;
    
-- https://www.oracletutorial.com/oracle-string-functions/oracle-regexp_like/    
-- match_parameter
-- 'c'	Perform case-sensitive matching.
-- 'i'	Perform case-insensitive matching.
-- 'n'	Allows the period character (.) to match the newline character. By default, the period is a wildcard.
-- 'm'	expression is assumed to have multiple lines, where ^ is the start of a line and $ is the end of a line, regardless of the position of those characters in expression. By default, expression is assumed to be a single line.
-- 'x'	Whitespace characters are ignored. By default, whitespace characters are matched like any other character.
SELECT
  last_name
FROM
  employees
WHERE
  REGEXP_LIKE( last_name, '^a', 'i'); 


-- 
1
2
3
4
SELECT
  TRANSLATE( '5*[2+6]/{9-3}', '[]{}', '()()' )
FROM
  DUAL;

