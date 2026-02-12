### Example run `*.sql` in docker
```
docker cp db/sql/queries/2_1_total_amount_each_client.sql order_postgres:/tmp/2_1_total_amount_each_client.sql
docker exec -i order_postgres psql -U postgres -d order_db -f /tmp/2_1_total_amount_each_client.sql
```

### from root
```
.\db\add_test_data.bat.bat
```