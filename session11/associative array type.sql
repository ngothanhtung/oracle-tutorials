DECLARE
    TYPE t_capital_type 
        IS TABLE OF VARCHAR2(100) 
        INDEX BY VARCHAR2(50);
    t_capital t_capital_type;
    -- local variable
    l_country VARCHAR2(50);
BEGIN
    t_capital('USA')            := 'Washington, D.C.';
    t_capital('United Kingdom') := 'London';
    t_capital('Japan')          := 'Tokyo';
    
    -- First item
    l_country := t_capital.FIRST;
    dbms_output.put_line(t_capital.FIRST);
    
    WHILE l_country IS NOT NULL LOOP
        dbms_output.put_line('The capital of ' || l_country || ' is ' || t_capital(l_country));
        
        -- Next item: NEXTNEXT(n)
        l_country := t_capital.NEXT(l_country);
    END LOOP;    
END;
/