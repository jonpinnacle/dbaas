SET SERVEROUTPUT ON
SET DEFINE OFF
SPOOL /u01/tmp/postval/post_provisioning_sql_result.lst append;
select count(job_name) from dba_scheduler_jobs where job_name = 'AUDIT_PURGE';
SPOOL OFF;
SET DEFINE ON
SET SERVEROUTPUT OFF
EXIT
