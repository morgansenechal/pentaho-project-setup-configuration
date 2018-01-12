@echo off
Set CURRENT_DIR=%CD%

set /p PROJECT_NAME="Enter Project Name: "
set /p ENV="Enter Environment (dev/uat/prd): "
echo IMPORTING %PROJECT_NAME% into Environment %ENV% using installation in %PENTAHO_HOME%

REM load kettle.properties
for /F "usebackq delims=" %%x in ("../config-pdi-%ENV%/.kettle/kettle.properties") do (set %%x)

c:
cd "%PENTAHO_HOME%\server\pentaho-server"
call import-export.bat --import --url=http://%DI_SERVER.HOST%:%DI_SERVER.PORT%/%DI_SERVER.WEBAPP% --path=/public/ --overwrite=true --username=deploy_user --password=password --file-path="%CURRENT_DIR%\%PROJECT_NAME%.zip"
pause