CREATE OR REPLACE PACKAGE BODY order_mgmt
AS
  -- get net value of a order
  FUNCTION get_net_value(
      p_order_id NUMBER)
    RETURN NUMBER
  IS
    ln_net_value NUMBER := 0;
  BEGIN
    SELECT
      SUM(unit_price * quantity)
    INTO
      ln_net_value
    FROM
      order_items
    WHERE
      order_id = p_order_id;
 
    RETURN p_order_id;
 
  EXCEPTION
  WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE( SQLERRM );
  END get_net_value;
 
-- Get net value by customer
  FUNCTION get_net_value_by_customer(
      p_customer_id NUMBER,
      p_year        NUMBER)
    RETURN NUMBER
  IS
    ln_net_value NUMBER := 0;
  BEGIN
    SELECT
      SUM(quantity * unit_price)
    INTO
      ln_net_value
    FROM
      order_items
    INNER JOIN orders USING (order_id)
    WHERE
      extract(YEAR FROM order_date) = p_year
    AND customer_id                 = p_customer_id
    AND status                      = gc_shipped_status;
    RETURN ln_net_value;
  EXCEPTION
  WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE( SQLERRM );
  END get_net_value_by_customer;
 
END order_mgmt;
