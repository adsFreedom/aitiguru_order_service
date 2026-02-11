docker cp db/sql/test_data/clear.sql order_postgres:/tmp/clear.sql
docker exec -i order_postgres psql -U postgres -d order_db -f /tmp/clear.sql
