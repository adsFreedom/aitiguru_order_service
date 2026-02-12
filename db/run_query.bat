@echo off
if "%~1"=="" (
    echo ERROR Param is empty
    echo Usage: run_sql.bat path/to/file.sql
    exit /b 1
)

set "sql_file=%~1"
set "filename=%~nx1"

echo ==============================================
echo Execute %filename%

docker cp "%sql_file%" order_postgres:/tmp/%filename%
docker exec -i order_postgres psql -U postgres -d order_db -f /tmp/%filename%

echo [OK] %filename%
echo ==============================================