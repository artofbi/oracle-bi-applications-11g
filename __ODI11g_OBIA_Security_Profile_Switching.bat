@ECHO OFF
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
:: ODI Studio Switch Environment Connection
:: http://artofbi.com

set odiClientSecurityDir=C:\Oracle\FMW11119\Oracle_ODI1\oracledi\client\odi\bin


ECHO.
set /p devEnv="Enter an environment for which to switch security profiles: [windev | obiadev] "

IF [%devEnv%] == [] GOTO NoValue

GOTO SwitchDevEnv

:NoValue
ECHO "Value is Empty. Try Again."
EXIT /B 1000

:SwitchDevEnv
ECHO "Using Value %devEnv%"

2>NUL CALL :CASE_%devEnv% # jump to :CASE_red, :CASE_blue, etc.
IF ERRORLEVEL 1 CALL :DEFAULT_CASE # if label doesn't exist

EXIT /B 500


:CASE_windev
  ECHO Beginning to Load Dev Environment for "%devEnv%"
  ECHO Copying all files in %odiClientSecurityDir%\odi_client_%devEnv%\ to %odiClientSecurityDir%
  xcopy /s/y %odiClientSecurityDir%\odi_client_%devEnv%\* %odiClientSecurityDir%
  GOTO END_CASE
:CASE_obiadev
  ECHO Beginning to Load Dev Environment for "%devEnv%"
  ECHO Copying all files in %odiClientSecurityDir%\odi_client_%devEnv%\ to %odiClientSecurityDir%
  xcopy /s/y %odiClientSecurityDir%\odi_client_%devEnv%\* %odiClientSecurityDir%
  GOTO END_CASE
:DEFAULT_CASE
  ECHO Unknown Dev Env "%devEnv%"
  GOTO END_CASE
:END_CASE
  VER > NUL # reset ERRORLEVEL
  GOTO :EOF # return from CALL

EXIT /B 0
  
PAUSE

ENDLOCAL