@echo off

:: Define the desktop path
set desktopPath=%USERPROFILE%\Desktop
set logFile=%desktopPath%\network_log.txt

echo Logging all output to %logFile%...
echo ------------------------------------------ > %logFile%
echo Network Check Log - %date% %time% >> %logFile%
echo computer Username: %username% >> %logFile%
echo ------------------------------------------ >> %logFile%

:: Redirect all script output to the log file
call :log >> %logFile% 2>&1
exit

:log
:: Step 1: Check Network Connection
echo Checking Network Connection...
ping google.com -n 1
if %errorlevel%==0 (
    echo Network Connection is Active.
) else (
    echo Network Connection Failed.
    echo Press 'S' to continue, or close this window to exit.
    choice /c S /n
)
timeout /t 3

:: Step 2: Check DNS Connection
echo Checking DNS Connection...
ping 8.8.8.8 -n 1
if %errorlevel%==0 (
    echo DNS Connection is Active.
) else (
    echo DNS Connection Failed.
    echo Press 'S' to continue, or close this window to exit.
    choice /c S /n
)
timeout /t 3

:: Step 3: Renew IP Until Network is Restored
:renew_ip
echo Resetting IP Address...
ipconfig /release
timeout /t 2
ipconfig /flushdns
timeout /t 2
ipconfig /renew
timeout /t 3

:: Step 4: Final Ping Test to Verify Connection
echo Running final ping test to confirm network connection...
ping google.com -n 1
if %errorlevel%==0 (
    echo Network Connection has been Restored.
    echo Network Connection has been Restored. >> %logFile%
    echo Irura belle ferme!
    
) else (
    echo Network Connection is still unavailable. Renewing IP address again...
    echo Network Connection is still unavailable. >> %logFile%
    timeout /t 3
    goto renew_ip
)

:: End of Script
pause
exit
