@echo off
chcp 65001 >nul

echo [START] Create DB...

docker cp tables/tables.sql order_postgres:/tmp/tables.sql
docker exec -i order_postgres psql -U postgres -d order_db -f /tmp/tables.sql

echo [START] Fill data...
.\tables\test_data\_add_data.bat