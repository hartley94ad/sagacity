::tee.cmd, by Ken Henderson
:: http://blogs.msdn.com/khen1234/archive/2005/10/27/486031.aspx
:: modified to append the file rather than over-write
@echo off

IF (%1)==() GOTO help
IF (%1)==(-a) (SET FILE=%2) || (SET FILE=%1)

::Overwrite the file (W2K/XP require /Y)
:: SET slash_y=
:: ver � find "Windows NT" >nul
:: if ERRORLEVEL 1 set slash_y=/Y

:: ::Overwrite the file
:: copy %slash_y% nul %1 >nul 2>&1

for /f "tokens=1* delims=]" %%A in ('find /V /N ""') do (
 >con echo.%%B
 >>%FILE% echo.%%B
)

GOTO :eof

:help
ECHO.
ECHO Pipe text to the console and redirect to a file simultaneously
ECHO.
ECHO Usage:  command | tee filename