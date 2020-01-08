# oracle_acfs_disks
## Required Inputs
- host: the host or group to execute the playbook against.  This can also be a Group from the Inventory
## Optional Inputs
- oracle_version (default: 12.1.0.2)

# oracle_cluster_verify
## Required Inputs
- host: the host or group to execute the playbook against.  This can also be a Group from the Inventory
## Optional Inputs
- grid_version (default: 12.1.0.2)

# oracle_data_pump
## Required Inputs
- host: the host or group to execute the playbook against.  This can also be a Group from the Inventory
- source_db_name - Name of the Source DB
- source_db_home - Home of the Source DB (e.g. db_1)
- dest_db_name - Name of the Destination DB
- dest_db_home - Home of the Destination DB (e.g. db_1)
## Optional Inputs
- oracle_version (default: 12.1.0.2)

# oracle_database_upgrade
## Required Inputs
- host: the host or group to execute the playbook against.  This can also be a Group from the Inventory
- oracle_db_home - This is where the upgrade will be move to (e.g. db_1) 
- oracle_db_name - The db to be upgraded
## Optional Inputs
- oracle_version (default: 12.1.0.2)

# oracle_db_instance
## Required Inputs
- host: the host or group to execute the playbook against.  This can also be a Group from the Inventory
- oracle_db_home - This is where the upgrade will be move to (e.g. db_1) 
- oracle_db_name - The db to be created
## Optional Inputs
- oracle_version (default: 12.1.0.2) 
- oracle_pdb_name
- oracle_pdb_passwd
- db_block_size
- sga_max_size
- sga_target
- sga_unit
- processes
- pga_aggregate_target
- pga_unit
- db_recovery_file_dest_size
- db_recovery_file_dest_unit
- java_pool_size
- java_pool_unit
- db_cache_size
- db_cache_unit
- shared_pool_size
- shared_pool_unit
- streams_pool_size
- streams_pool_unit

#### Apex Inputs for inventory (also all optional)
- application_name
- app_ref_id
- environment
- database_role 
- pci_required
- sox_required
- encryption_required 
- dataguard
- golden_gate
- backup_enabled 
- end_of_life
- db_monitoring_tool 
- monitoring
- comments
- instance_count
- db_source
- dr_solution
- dr_location
- env_category 
- storage_type
- db_home



# oracle_db_upgrade_prechecks
## Required Inputs
- host: the host or group to execute the playbook against.  This can also be a Group from the Inventory
- oracle_db_name - The db to be upgraded
## Optional Inputs
- oracle_version (default: 12.1.0.2) 
- preupgrade_scripts_file (default: preupgrade_12.1.0.2.0_18_lf.zip)

# oracle_deinstall
## Required Inputs    
- deinstall_product: either GRID or DATABASE
- oracle_db_home:  Only required for RDBMS deinstall. Home to deinstall (e.g. db_1)
- host: the host or group to execute the playbook against.  This can also be a Group from the Inventory
## Optional Inputs
- oracle_version (default: 12.1.0.2) 

# oracle_goldengate_install
## Required Inputs
- host: the host or group to execute the playbook against.  This can also be a Group from the Inventory
## Optional Inputs
- oracle_version (default: 12.1.0.2) 

# oracle_grid_install_cluster
## Required Inputs
- host: the host or group to execute the playbook against.  This can also be a Group from the Inventory
- cluster_name - Name of the cluster (i.e. SCAN name)
## Optional Inputs
- grid_version (default: 12.1.0.2)
- grid_images (default: ['linuxamd64_12102_grid_1of2.zip','linuxamd64_12102_grid_2of2.zip'])

# oracle_grid_install_standalone
## Required Inputs
- host: the host or group to execute the playbook against.  This can also be a Group from the Inventory
## Optional Inputs
- grid_version (default: 12.1.0.2)
- grid_images (default: ['linuxamd64_12102_grid_1of2.zip','linuxamd64_12102_grid_2of2.zip'])

# oracle_grid_upgrade
## Required Inputs
- host: the host or group to execute the playbook against.  This can also be a Group from the Inventory
- cluster_name - Name of the cluster. Require if upgrading a cluster only. (i.e. SCAN name)
## Optional Inputs
- grid_version (default: 12.1.0.2)
- grid_images (default: ['linuxamd64_12102_grid_1of2.zip','linuxamd64_12102_grid_2of2.zip'])

# oracle_insert_cluster
## Required Inputs
- host: the host or group to execute the playbook against.  This can also be a Group from the Inventory
- cluster_name - Name of the cluster (i.e. SCAN name)
- env_source - Must be passed in or could be HostVar
## Optional Inputs
- grid_version (default: 12.1.0.2)
- network_type - Possibly HostVar?
- global_zone_solaris - Possibly HostVar?
- server_monitoring_tool - Possibly HostVar?

# oracle_insert_host
## Required Inputs
- host: the host or group to execute the playbook against.  This can also be a Group from the Inventory
- env_source - Must be passed in or could be HostVar
## Optional Inputs
- grid_version (default: 12.1.0.2)
- network_type - Possibly HostVar?
- global_zone_solaris - Possibly HostVar?
- server_monitoring_tool - Possibly HostVar?

# oracle_ojvm_patch
## Required Inputs
- host: the host or group to execute the playbook against.  This can also be a Group from the Inventory
- ojvm_patch - Patch filename
## Optional Inputs
- grid_version (default: 12.1.0.2)
- oracle_version (default: 12.1.0.2)

# oracle_post_provisioning_database
## Required Inputs
- host: the host or group to execute the playbook against.  This can also be a Group from the Inventory
- oracle_db_name - The db to post-provision
## Optional Inputs
- oracle_version (default: 12.1.0.2)

# oracle_post_provisioning_grid
## Required Inputs
- host: the host or group to execute the playbook against.  This can also be a Group from the Inventory
## Optional Inputs
- grid_version (default: 12.1.0.2)
- oracle_version (default: 12.1.0.2)

# oracle_post_validation
## Required Inputs
- host: the host or group to execute the playbook against.  This can also be a Group from the Inventory
- oracle_context - DB or grid
- oracle_db_name - The db to validate (only required if Context is 'DB')
## Optional Inputs
- golden_gate_check (default: False)
- grid_version (default: 12.1.0.2)
- oracle_version (default: 12.1.0.2)

# oracle_prereqs_only
## Required Inputs
- host: the host or group to execute the playbook against.  This can also be a Group from the Inventory
## Optional Inputs
- golden_gate_check (default: False)

# oracle_psu_patch
## Required Inputs
- host: the host or group to execute the playbook against.  This can also be a Group from the Inventory
- patch_file - The full name of the Patch file
- patch_type - GRID or ORACLE (if combined use GRID)
- patch_quarter - The Patch Quarter to use in 3 char format (e.g. Jul)
- patch_year - The Patch Year to use in full format (e.g. 2018)
- opatch_version_required - The expected OPatch Version for this PSU (as returned by `opatch version`)
- opatch_util_installer - The name of the zipfile at '/yum/source/ORACLE_DB/OPATCH/' to install the expected OPatch version
- db_home - database Home for APEX
- host_code -  for APEX 
## Optional Inputs
- opatch_flags - Any flags that need to be passed to the "opatchauto apply" command.

# oracle_rdbms_sw_install.yml
## Required Inputs
- host: the host or group to execute the playbook against.  This can also be a Group from the Inventory
## Optional Inputs
- oracle_version (default: 12.1.0.2) 
- oracle_db_home (default: auto-generated based on next available; e.g. db_2)
- oracle_images (default: ['linuxamd64_12102_database_1of2.zip','linuxamd64_12102_database_2of2.zip'])

# oracle_rman_dataguard.yml
## Required Inputs
- host: the host or group to execute the playbook against.  This can also be a Group from the Inventory
- oracle_db_name: The name of the DB to setup with DataGuard
## Optional Inputs
- oracle_version (default: 12.1.0.2) 
- grid_version (default: 12.1.0.2) 

# oracle_rman_duplicate.yml
## Required Inputs
- host: the host or group to execute the playbook against.  This can also be a Group from the Inventory
- oracle_db_name: The name of the DB to setup RMAN Duplicate with
## Optional Inputs
- oracle_version (default: 12.1.0.2)
- grid_version (default: 12.1.0.2) 

# oracle_rman_registration.yml
## Required Inputs
- host: the host or group to execute the playbook against.  This can also be a Group from the Inventory
- oracle_db_name - The db to register in RMAN
## Optional Inputs
- oracle_version (default: 12.1.0.2) 