SELECT * FROM CUSTOMERS

UPDATE CUSTOMERS SET NAME = 'Unum Group 1' WHERE CUSTOMER_ID =  308


SELECT
    audit_id,
    table_name,
    transaction_name,
    by_user,
    transaction_date
FROM
    audits;