#!/bin/bash
set -e

echo "PostgreSQL initialization wrapper started..."

if [ "${INIT_DB:-true}" != "true" ]; then
    echo "INIT_DB=${INIT_DB}: Skipping database initialization"
    exec docker-entrypoint.sh "$@"
fi

if [ -f "/var/lib/postgresql/data/.init_completed" ]; then
    echo "Database already initialized, skipping..."
    exec docker-entrypoint.sh "$@"
fi

echo "Preparing initialization scripts with correct order..."

INIT_TEMP="/tmp/init_scripts"
mkdir -p "$INIT_TEMP"

cp /init_source/tables.sql "$INIT_TEMP/01_tables.sql"
cp /init_source/test_data/01_categories.sql "$INIT_TEMP/02_categories.sql"
cp /init_source/test_data/02_products.sql "$INIT_TEMP/03_products.sql"
cp /init_source/test_data/03_clients.sql "$INIT_TEMP/04_clients.sql"
cp /init_source/test_data/04_orders.sql "$INIT_TEMP/05_orders.sql"
cp /init_source/test_data/05_order_items.sql "$INIT_TEMP/06_order_items.sql"
cp /init_source/queries/2_3_1_top_5_month_products.sql "$INIT_TEMP/07_view_top_5_month_products.sql"

cp "$INIT_TEMP"/*.sql /docker-entrypoint-initdb.d/

echo "Scripts prepared:"
ls -1 /docker-entrypoint-initdb.d/*.sql

exec docker-entrypoint.sh "$@"