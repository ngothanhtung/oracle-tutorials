-- Session 2
UPDATE hr.employees 
SET salary = salary * 1.1
WHERE employee_id = 100;

ALTER TABLE hr.employees
ADD (test number) ;
 
ALTER TABLE hr.employees
DROP COLUMN test ;
