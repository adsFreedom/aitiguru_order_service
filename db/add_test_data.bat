echo [START] Fill database...

call .\db\run_query.bat db\sql\test_data\clear.sql

call .\db\run_query.bat db\sql\test_data\01_categories.sql
call .\db\run_query.bat db\sql\test_data\02_products.sql
call .\db\run_query.bat db\sql\test_data\03_clients.sql
call .\db\run_query.bat db\sql\test_data\04_orders.sql
call .\db\run_query.bat db\sql\test_data\05_order_items.sql
call .\db\run_query.bat db\sql\test_data\06_verify.sql

echo [FINISH] Data loaded...