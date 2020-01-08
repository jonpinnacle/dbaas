col member for a80
set linesize 180
select group#, member from v$logfile where member not like '+RECO%';
EXIT
