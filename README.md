# Order Service (AiTiGuru)

## **Results**

### Queries

#### [dataological data schema](db/sql/tables.sql)
#### [2.1 - Query total amount each client](db/sql/queries/2_1_total_amount_each_client.sql)
#### [2.2 - Query count child elements first level](db/sql/queries/2_2_count_child_elemets_first_lvl.sql)
#### [2.3.1 - View to 5 month products](db/sql/queries/2_3_1_top_5_month_products.sql)

#### 2.3.2 Optimizations
- May add partitions by date
- To [tables.sql](db/sql/tables.sql) added index for order date

After add index and [big data](db/sql/queries/big_test_data.sql) get new explain without Seq:
- [explain no index](db/sql/queries/explains/2_3_1_no_index)
- [explain with index](db/sql/queries/explains/2_3_1_with_index)

## Quick Start

1. **Clone repository**
```commandline
git clone https://github.com/adsFreedom/aitiguru_order_service.git
cd order_service
```

2. **Create environment file**
```commandline
cp .env_example .env
```
Edit .env if you need to customize settings (default values work out of the box).

3. **Build and start services**
```commandline
docker-compose build
docker-compose up -d
```
After start create postgres DB, fill test data(if `INIT_DB=true`) and run FastAPI.

4. **Use FastAPI endpoint**

Use [localhost:8000/docs](http://localhost:8000/docs) for run swagger.

## Directories

### [app](app)
Directory with FastAPI service

### [db](db)
Database files:
- SQL queries
- *.bat files for run sql

### [docker](docker)
Dockerfiles for FastAPI service and custom postgres(for auto make and fill tables) 