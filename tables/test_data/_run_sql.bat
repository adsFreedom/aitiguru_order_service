docker cp tables/test_data/clear.sql order_postgres:/tmp/clear.sql
docker exec -i order_postgres psql -U postgres -d order_db -f /tmp/clear.sql

docker cp tables/test_data/05_order_items.sql order_postgres:/tmp/05_order_items.sql
docker exec -i order_postgres psql -U postgres -d order_db -f /tmp/05_order_items.sql
