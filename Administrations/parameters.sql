-------------------------------------------------------------------------------
SELECT NAME, VALUE, DESCRIPTION FROM v$parameter WHERE NAME LIKE '%pool%';

-- displays information about the initialization parameters that are currently in effect for the session
-- https://docs.oracle.com/cd/B28359_01/server.111/b28320/dynviews_2085.htm#REFRN30176
desc v$parameter;
-------------------------------------------------------------------------------

-- DATABASE PARAMETERS
show parameter db;
SELECT * FROM v$diag_info;


-------------------------------------------------------------------------------
-- CASE STUDY: ADMINISTERING THE DDL LOG FILE
-------------------------------------------------------------------------------
-- 1. Enable DDL Logging in the Database
show parameter ENABLE_DDL_LOGGING;
ALTER SYSTEM SET ENABLE_DDL_LOGGING=TRUE;

-- 2. DDL
CREATE VIEW TEST1
AS SELECT * FROM DUAL;

-- 3 VIEW LOG FILE
-- $ADR_BASE/diag/rdbms/${DBNAME}/${ORACLE_SID}/log/ddl_${ORACLE_SID}.log
-- There is also a XML version: $ADR_BASE/diag/rdbms/${DBNAME}/${ORACLE_SID}/log/ddl/log.xml

-- To disable:
ALTER SYSTEM SET ENABLE_DDL_LOGGING=FASLE;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- CASE STUDY:
-- Dynamic Performance Views

SELECT sql_text, executions FROM v$sql WHERE cpu_time > 2000000;

SELECT * FROM v$session;

SELECT * FROM v$lock;
-------------------------------------------------------------------------------

SELECT * FROM v$fixed_table;

-------------------------------------------------------------------------------
-- CASE STUDY:
-- Data Dictionary
SELECT * FROM dictionary;

SELECT table_name, tablespace_name FROM user_tables;



