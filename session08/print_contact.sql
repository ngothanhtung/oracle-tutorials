CREATE OR REPLACE PROCEDURE yomqVp3htVVC52VLlkM9LmlPfWRrsUKBbbQK(
    in_customer_id NUMBER 
)
IS
  r_contact contacts%ROWTYPE;
BEGIN
  -- get contact based on customer id
  SELECT *
  INTO r_contact
  FROM contacts
  WHERE customer_id = in_customer_id;
 
  -- print out contact's information
  dbms_output.put_line( r_contact.first_name || ' ' ||
  r_contact.last_name || '<' || r_contact.email ||'>' );
 
EXCEPTION
   WHEN OTHERS THEN
      dbms_output.put_line( SQLERRM );
END;

SET SERVEROUTPUT ON;

EXEC print_contact(100);