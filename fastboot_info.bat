@echo off
cls
color 0A
echo ===================================
echo         Fastboot Device Info
echo ===================================
echo            SHUNLOCKER
echo ===================================
echo Select Device Type:
echo ================================
echo 1. Xiaomi
echo 2. Huawei
echo 3. Vivo
echo 4. Moto
echo 5. Exit
echo ================================
set /p choice=Enter your choice (1/2/3/4/5): 

if "%choice%"=="1" (
    cls
    echo You selected Xiaomi device.
    call :xiaomi_info
) else if "%choice%"=="2" (
    cls
    echo You selected Huawei device.
    call :huawei_info
) else if "%choice%"=="3" (
    cls
    echo You selected Vivo device.
    call :vivo_info
) else if "%choice%"=="4" (
    cls
    echo You selected Moto device.
    call :moto_info
) else if "%choice%"=="5" (
    cls
    echo Exiting...
    timeout /t 2 /nobreak >nul
    exit
) else (
    cls
    echo Invalid choice. Please select 1, 2, 3, 4, or 5.
    timeout /t 2 /nobreak >nul
    exit
)

goto :eof

:xiaomi_info
echo Checking for Xiaomi device in Fastboot mode...
fastboot devices
if %errorlevel% neq 0 (
    echo No Xiaomi devices detected in Fastboot mode.
    timeout /t 3 /nobreak >nul
    exit /b
)
echo Device found:
echo ------------------------------
echo Retrieving full Xiaomi device info...
fastboot oem device-info
fastboot getvar all
fastboot oem unlock-info
fastboot oem read_tz
fastboot oem get_unlock_ability
fastboot oem hardware
echo ------------------------------
echo Bootloader status:
fastboot oem bootloader-status
echo ------------------------------
echo Rebooting device...
fastboot reboot
timeout /t 5 /nobreak >nul
goto :eof

:huawei_info
echo Checking for Huawei device in Fastboot mode...
fastboot devices
if %errorlevel% neq 0 (
    echo No Huawei devices detected in Fastboot mode.
    timeout /t 3 /nobreak >nul
    exit /b
)
echo Device found:
echo ------------------------------
echo Retrieving full Huawei device info...
fastboot oem device-info
fastboot getvar all
fastboot oem unlock-info
fastboot oem bootloader-status
echo ------------------------------
echo Rebooting device...
fastboot reboot
timeout /t 5 /nobreak >nul
goto :eof

:vivo_info
echo Checking for Vivo device in Fastboot mode...
fastboot devices
if %errorlevel% neq 0 (
    echo No Vivo devices detected in Fastboot mode.
    timeout /t 3 /nobreak >nul
    exit /b
)
echo Device found:
echo ------------------------------
echo Retrieving full Vivo device info...
fastboot oem device-info
fastboot getvar all
fastboot oem unlock-info
fastboot oem bootloader-status
echo ------------------------------
echo Rebooting device...
fastboot reboot
timeout /t 5 /nobreak >nul
goto :eof

:moto_info
echo Checking for Moto device in Fastboot mode...
fastboot devices
if %errorlevel% neq 0 (
    echo No Moto devices detected in Fastboot mode.
    timeout /t 3 /nobreak >nul
    exit /b
)
echo Device found:
echo ------------------------------
echo Retrieving full Moto device info...
fastboot oem device-info
fastboot getvar all
fastboot oem unlock-info
fastboot oem bootloader-status
echo ------------------------------
echo Rebooting device...
fastboot reboot
timeout /t 5 /nobreak >nul
goto :eof
