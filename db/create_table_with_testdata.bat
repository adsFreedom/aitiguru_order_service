echo [START] Create DB...

call .\db\run_query.bat db\sql\tables.sql

echo [START] Fill data...

call .\db\add_test_data.bat