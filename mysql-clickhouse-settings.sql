-- show the current settings
SHOW VARIABLES LIKE 'default_authentication_plugin';
SHOW VARIABLES LIKE 'gtid_mode';
SHOW VARIABLES LIKE 'enforce_gtid_consistency';
-- set new settings
-- SET default_authentication_plugin=mysql_native_password;
SET GLOBAL gtid_mode=ON;
-- SET GLOBAL enforce_gtid_consistency=ON;