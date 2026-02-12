if "%~1"=="" (
    echo Использование: run_sql.bat путь\к\файлу.sql
    exit /b 1
)

set "sql_file=%~1"
set "filename=%~nx1"

docker cp "%sql_file%" order_postgres:/tmp/%filename%
docker exec -i order_postgres psql -U postgres -d order_db -f /tmp/%filename%