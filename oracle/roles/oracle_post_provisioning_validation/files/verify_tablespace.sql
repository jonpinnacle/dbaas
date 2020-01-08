spool db_file_check.lst
set line 200
Col file_name format a50
Col tablespace_name format a20
Col autoextensible format a10
Col bytes format 9999999.999
Col maxbytes format 9999999.999
select tablespace_name,file_name, autoextensible, bytes/1024/1024/1024 bytes, maxbytes/1024/1024/1024 maxbytes from dba_data_files order by file_id;
spool off
EXIT
