SET SERVEROUTPUT ON
SET DEFINE OFF
SPOOL /u01/tmp/postval/post_provisioning_sql_result.lst append;
alter database enable block change tracking using file '+RECO';
SPOOL OFF;
SET DEFINE ON
SET SERVEROUTPUT OFF
EXIT
