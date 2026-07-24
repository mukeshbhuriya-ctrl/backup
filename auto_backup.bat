@echo off
setlocal

:: ============================
:: PostgreSQL Auto Backup
:: ============================

:: Configuration
set DB_HOST=localhost
set DB_PORT=5432
set DB_USER=postgres
set DB_NAME=dms
set BACKUP_DIR=D:\DMS\backup

:: Create backup folder if it doesn't exist
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%"

:: Generate timestamp (yyyyMMdd_HHmmss)
for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyyyMMdd_HHmmss"') do set TIMESTAMP=%%i

:: Backup file
set BACKUP_FILE=%BACKUP_DIR%\%DB_NAME%_%TIMESTAMP%.sql

echo ==========================================
echo PostgreSQL Auto Backup
echo ==========================================
echo Database    : %DB_NAME%
echo Backup File : %BACKUP_FILE%
echo.

pg_dump ^
-h %DB_HOST% ^
-p %DB_PORT% ^
-U %DB_USER% ^
-d %DB_NAME% ^
-f "%BACKUP_FILE%"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo Backup completed successfully.
    echo Saved to: %BACKUP_FILE%
) else (
    echo.
    echo Backup failed!
)

endlocal
