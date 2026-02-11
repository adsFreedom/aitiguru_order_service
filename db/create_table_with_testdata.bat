echo [START] Create DB...

docker cp db/sql/tables.sql order_postgres:/tmp/tables.sql
docker exec -i order_postgres psql -U postgres -d order_db -f /tmp/tables.sql

echo [START] Fill data...
.\db\add_test_data.bat