-- select DIRECTORY_PATH,DIRECTORY_NAME from dba_directories;
spool profile_check.lst
Set pagesize 500
Set line 200
col limit format a15
col profile format a20
col resource_name format a40

select distinct profile, resOURCe_name, limit from dba_profiles where profile like '%ACCOUNT%' and resource_type = 'PASSWORD' order by 1;
 Spool off
EXIT
