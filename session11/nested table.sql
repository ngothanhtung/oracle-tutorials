-- Nested tables differ from arrays in two important ways:
-- Arrays have a fixed upper bound, but nested tables are unbounded (see Figure 5-1). So, the size of a nested table can increase dynamically.

DECLARE
    -- declare a cursor that return customer name
    CURSOR c_customer IS 
        SELECT name 
        FROM customers
        ORDER BY name 
        FETCH FIRST 10 ROWS ONLY;
    -- declare a nested table type   
    TYPE t_customer_name_type 
        IS TABLE OF customers.name%TYPE;
    
    -- declare and initialize a nested table variable
    t_customer_names t_customer_name_type := t_customer_name_type(); 
    
BEGIN
    -- populate customer names from a cursor
    FOR r_customer IN c_customer 
    LOOP
        -- To add an element to a nested table, you first use the EXTEND method:
        t_customer_names.EXTEND;
        -- Then, use the assignment operator (:=) to add an element to the nested table:
        t_customer_names(t_customer_names.LAST) := r_customer.name;
    END LOOP;
    
    -- REF: Collection Methods: https://docs.oracle.com/cd/B19306_01/appdev.102/b14261/collection_method.htm#i33024
    -- t_customer_names.DELETE(5, 1);
    -- t_customer_names.TRIM(5);    
    
    -- display customer names
    FOR l_index IN t_customer_names.FIRST..t_customer_names.LAST 
    LOOP        
        dbms_output.put_line(t_customer_names(l_index));
    END LOOP;
END;