SET SERVEROUTPUT ON
SET DEFINE OFF
SPOOL /u01/tmp/postval/post_provisioning_sql_result.lst append;
select distinct profile from dba_profiles where profile = 'APP_ACCOUNT_PROFILE' or profile = 'USER_ACCOUNT_PROFILE';
SPOOL OFF;
SET DEFINE ON
SET SERVEROUTPUT OFF
EXIT
