SET SERVEROUTPUT ON
SET DEFINE OFF
SPOOL /u01/tmp/postval/post_provisioning_sql_result.lst append;
set line 200
Col profile format a50
Col LIMIT format a20
Col autoextensible format a10
Col bytes format 9999999.999
Col maxbytes format 9999999.999
select profile, LIMIT from dba_profiles where profile = 'DEFAULT' and RESOURCE_NAME = 'PASSWORD_LIFE_TIME';
SPOOL OFF;
SET DEFINE ON
SET SERVEROUTPUT OFF
EXIT
