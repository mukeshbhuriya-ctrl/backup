@echo off
setlocal

set DB_HOST=localhost
set DB_PORT=5432
set DB_USER=postgres
set NEW_DB=dms_restore
set BACKUP_FILE=D:\DMS\backup\dms_20260723_154530.sql

echo Creating database...
createdb -h %DB_HOST% -p %DB_PORT% -U %DB_USER% %NEW_DB%

echo Restoring backup...
psql ^
-h %DB_HOST% ^
-p %DB_PORT% ^
-U %DB_USER% ^
-d %NEW_DB% ^
-f "%BACKUP_FILE%"

echo Restore completed.
pause
