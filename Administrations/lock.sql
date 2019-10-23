-- * Shared and Exclusive Locks
 
-- * Exclusive lock: 
--   The first session to request the lock on the row gets it, 
--   Any other sessions requesting write access must wait. 
--   Read access is permitted, though if the row has never been updated by the locking session, 
--   Only one session can take an exclusive lock on a row, or a whole table, at a time.
 
--   First session 

-- Manual locking (first session) 
LOCK TABLE hr.employees IN EXCLUSIVE MODE;
update hr.employees
set salary = salary * 1.2
where hr.employee_id = 100;
 

