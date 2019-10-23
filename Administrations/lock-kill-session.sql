ALTER SYSTEM KILL SESSION '743,44547' IMMEDIATE; 

-- * Detecting Lock Conflicts
-----------------------------
 
select SID, SERIAL#, USERNAME, SECONDS_IN_WAIT
from V$SESSION where SID in (select BLOCKING_SESSION from V$SESSION)
 
select *
from v$lock l1, v$lock l2
where l1.block =1 and l2.request > 0
and l1.id1=l2.id1
and l1.id2=l2.id2

 
SELECT sid, serial#, username, program, machine
FROM v$session
WHERE username IN ('SYS' , 'HR')
 
SELECT o.object_name, w.seconds_in_wait, w.sid waiter_sid, w.serial# waiter_sr#, w.machine waiter_machine, w.program waiter_program, 
w.module waiter_module, b.sid blocker_sid, b.serial# blocker_sr#, b.machine blocker_machine, b.program blocker_program, 
b.module blocker_module, sw.sql_text waiter_sql, sb.sql_text blocker_last_sql
FROM v$session w JOIN v$session B
ON (w.blocking_session = b.sid)
JOIN all_objects o
ON (w.ROW_WAIT_OBJ# = o.object_id)
LEFT JOIN v$sql sw
ON (w.sql_id = sw.sql_id)
LEFT JOIN v$sql sb
ON (b.prev_sql_id = sb.sql_id)
WHERE w.blocking_session IS NOT NULL;