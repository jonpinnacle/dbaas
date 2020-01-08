SET SERVEROUTPUT ON
SET DEFINE OFF

execute dbms_workload_repository.modify_snapshot_settings (interval => 15,retention => 11520);


ET DEFINE ON
SET SERVEROUTPUT OFF
EXIT
