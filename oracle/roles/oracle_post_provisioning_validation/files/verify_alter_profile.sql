spool verify_alter_profile.lst
set line 200
Col profile format a50
Col LIMIT format a20
Col autoextensible format a10
Col bytes format 9999999.999
Col maxbytes format 9999999.999
select profile, LIMIT from dba_profiles where profile = 'DEFAULT' and RESOURCE_NAME = 'PASSWORD_LIFE_TIME';
Spool off
EXIT
