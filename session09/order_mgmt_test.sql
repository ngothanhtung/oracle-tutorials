
SET SERVEROUTPUT ON;
BEGIN   
  DBMS_OUTPUT.PUT_LINE(order_mgmt.gc_shipped_status);
END;


-- TEXT: CALL FUNCTION FROM PACKAGE
SELECT
  order_mgmt.get_net_value_by_customer(1,2017) sales
FROM
  dual;
  