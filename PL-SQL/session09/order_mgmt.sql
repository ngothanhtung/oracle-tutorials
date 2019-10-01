CREATE OR REPLACE PACKAGE order_mgmt
AS
  gc_shipped_status  CONSTANT VARCHAR(10) := 'Shipped';
  gc_pending_status CONSTANT VARCHAR(10) := 'Pending';
  gc_canceled_status CONSTANT VARCHAR(10) := 'Canceled';
 
  -- cursor that returns the order detail
  CURSOR g_cur_order(p_order_id NUMBER)
  IS
    SELECT
      customer_id,
      status,
      salesman_id,
      order_date,
      item_id,
      product_name,
      quantity,
      unit_price
    FROM
      order_items
    INNER JOIN orders USING (order_id)
    INNER JOIN products USING (product_id)
    WHERE
      order_id = p_order_id;
 
  -- get net value of a order
  FUNCTION get_net_value(
      p_order_id NUMBER)
    RETURN NUMBER;
 
  -- Get net value by customer
  FUNCTION get_net_value_by_customer(
      p_customer_id NUMBER,
      p_year        NUMBER)
    RETURN NUMBER;
 
END order_mgmt;

-- C) Compile a package from the source file
@D:\Working\GitHub\oracle-tutorials\session08\order_mgmt;
