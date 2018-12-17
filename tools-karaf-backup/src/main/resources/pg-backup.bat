@ECHO OFF
@setlocal enableextensions
@cd /d "%~dp0"
SET PGPATH=D:\"Program Files"\PostgreSQL\9.5\bin\pg_dump
SET SVPATH=D:\
SET PRJDB=kalix
SET DBUSR=postgres
SET DBROLE=postgres
FOR /F "TOKENS=1,2,3 DELIMS=/ " %%i IN ('DATE /T') DO SET d=%%i-%%j-%%k
FOR /F "TOKENS=1,2,3 DELIMS=: " %%i IN ('TIME /T') DO SET t=%%i%%j%%k
SET DBDUMP=%PRJDB%_%d%_%t%.backup
@ECHO OFF
%PGPATH% -h 127.0.0.1 -p 5432 -U %DBUSR% --role %DBROLE% -w -F c -b -v -f %SVPATH%%DBDUMP% %PRJDB%
echo Backup Taken Complete %SVPATH%%DBDUMP%
pause
