@echo off

:main
cls
echo. batch file
echo.
echo. 1. Fix IP
echo.
echo. 2. DHCP
echo.
echo. 3. IP adatok
echo.
echo. 4. Fix IP Ping
echo.
echo. 5. Exit
echo.
set choice=
set /p choice=My option: 
if "%choice%" == "1" goto fixip
if "%choice%" == "2" goto dhcp
if "%choice%" == "3" goto ipchk
if "%choice%" == "4" goto fixping
if "%choice%" == "5" goto exit
goto main

:fixip
cls
Netsh interface ip set address "Local Area Connection 2" static 192.168.1.100 255.255.255.0 192.168.1.1
Netsh interface ip set dns "Local Area Connection 2" static 192.168.1.10 validate=no
Netsh interface ip add dns "Local Area Connection 2" 8.8.8.8 index=2 validate=no
echo lefutott
pause
goto main

:dhcp
cls
netsh interface ip set address "Local Area Connection 2" dhcp
echo lefutott
pause
goto main

:ipchk
cls
ipconfig /all
pause
goto main

:fixping
cls
ping 192.168.1.100
pause
goto main

:exit
exit