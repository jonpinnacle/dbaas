set line 100
set pagesize 100

col name format a50
col display_value format a40

select name, Display_value from v$parameter
where name in ('shared_pool','large_pool_size','db_cache_size','streams_pool_size','pga_aggregate_target','sga_max_size','sga_target');
EXIT
