echo [START] Fill database...

docker cp db/sql/test_data/clear.sql order_postgres:/tmp/clear.sql
docker exec -i order_postgres psql -U postgres -d order_db -f /tmp/clear.sql
echo [OK] clear.sql

docker cp db/sql/test_data/01_categories.sql order_postgres:/tmp/01_categories.sql
docker exec -i order_postgres psql -U postgres -d order_db -f /tmp/01_categories.sql
echo [OK] 01_categories.sql

docker cp db/sql/test_data/02_products.sql order_postgres:/tmp/02_products.sql
docker exec -i order_postgres psql -U postgres -d order_db -f /tmp/02_products.sql
echo [OK] 02_products.sql

docker cp db/sql/test_data/03_clients.sql order_postgres:/tmp/03_clients.sql
docker exec -i order_postgres psql -U postgres -d order_db -f /tmp/03_clients.sql
echo [OK] 03_clients.sql

docker cp db/sql/test_data/04_orders.sql order_postgres:/tmp/04_orders.sql
docker exec -i order_postgres psql -U postgres -d order_db -f /tmp/04_orders.sql
echo [OK] 04_orders.sql

docker cp db/sql/test_data/05_order_items.sql order_postgres:/tmp/05_order_items.sql
docker exec -i order_postgres psql -U postgres -d order_db -f /tmp/05_order_items.sql
echo [OK] 05_order_items.sql

docker cp db/sql/test_data/06_verify.sql order_postgres:/tmp/06_verify.sql
docker exec -i order_postgres psql -U postgres -d order_db -f /tmp/06_verify.sql
echo [OK] 06_verify.sql

echo [FINISH] Data loaded.