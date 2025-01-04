@echo off
chcp 65001 >nul
title IT TOOLBOX - Cenk Karakol

:: ========================================================
::                     Dil Seçimi
:: ========================================================
:LANG_SELECT
cls
echo =============================================
echo              IT TOOLBOX - v2
echo        (Türkçe / English Language Menu)
echo =============================================
echo 1^) Türkçe
echo 2^) English
echo 3^) Çıkış / Exit
echo =============================================
set /p lang=Seçiminiz / Your choice (1-3): 

if "%lang%"=="1" (
    set "LANGUAGE=TR"
    goto SET_MESSAGES
)

if "%lang%"=="2" (
    set "LANGUAGE=EN"
    goto SET_MESSAGES
)

if /i "%lang%"=="3" (
    echo Exiting program...
    pause
    exit
)

echo Hatalı/Geçersiz giriş yaptınız, lütfen tekrar deneyin. / Invalid input, please try again.
pause
goto LANG_SELECT

:: ========================================================
::                Menü Başlıklarını Ayarla
:: ========================================================
:SET_MESSAGES
if "%LANGUAGE%"=="TR" (
    set "MENU_TITLE=ANA MENÜ"
    set "CATEGORY_SYSTEM=1^) Sistem Bilgileri"
    set "CATEGORY_NETWORK=2^) Ağ İşlemleri"
    set "CATEGORY_SECURITY=3^) Güvenlik"
    set "CATEGORY_MAINTENANCE=4^) Bakım"
    set "CATEGORY_HARDWARE=5^) Donanım"
    set "CATEGORY_SHUTDOWN=6^) Sistem Kapatma"
    set "CATEGORY_EXIT=7^) Çıkış Yap"
    set "PROMPT_MENU=Bir işlem numarası seçin (1-7):"
    set "INVALID_INPUT=Hatalı giriş yaptınız, lütfen tekrar deneyin."
    set "EXITING=Program kapatılıyor..."
    set "BACK_OPTION=0^) Geri"
) else (
    set "MENU_TITLE=MAIN MENU"
    set "CATEGORY_SYSTEM=1^) System Information"
    set "CATEGORY_NETWORK=2^) Network Operations"
    set "CATEGORY_SECURITY=3^) Security"
    set "CATEGORY_MAINTENANCE=4^) Maintenance"
    set "CATEGORY_HARDWARE=5^) Hardware"
    set "CATEGORY_SHUTDOWN=6^) Shutdown"
    set "CATEGORY_EXIT=7^) Exit"
    set "PROMPT_MENU=Your choice (1-7):"
    set "INVALID_INPUT=Invalid input, please try again."
    set "EXITING=Exiting program..."
    set "BACK_OPTION=0^) Back"
)

goto MAIN_MENU

:: ========================================================
::                        ANA MENÜ
:: ========================================================
:MAIN_MENU
cls
echo ============================================
echo               %MENU_TITLE%
echo ============================================
echo %CATEGORY_SYSTEM%
echo %CATEGORY_NETWORK%
echo %CATEGORY_SECURITY%
echo %CATEGORY_MAINTENANCE%
echo %CATEGORY_HARDWARE%
echo %CATEGORY_SHUTDOWN%
echo %CATEGORY_EXIT%
echo ============================================
set /p CHOICE=%PROMPT_MENU%

if "%CHOICE%"=="1" goto SYSTEM_MENU
if "%CHOICE%"=="2" goto NETWORK_MENU
if "%CHOICE%"=="3" goto SECURITY_MENU
if "%CHOICE%"=="4" goto MAINTENANCE_MENU
if "%CHOICE%"=="5" goto HARDWARE_MENU
if "%CHOICE%"=="6" goto SHUTDOWN_MENU
if "%CHOICE%"=="7" (
    echo %EXITING%
    pause
    exit
)

:: Hatalı giriş -> Ana menüye dön
echo %INVALID_INPUT%
pause
goto MAIN_MENU

:: ========================================================
::               SİSTEM BİLGİLERİ MENÜSÜ
:: ========================================================
:SYSTEM_MENU
cls
if "%LANGUAGE%"=="TR" (
    echo --- Sistem Bilgileri ---
    echo 1^) Bilgisayar Adı ve Aktif Kullanıcıyı Goster
    echo 2^) Bilgisayar Seri Numarasini Goster ^(Yönetici^)
    echo 3^) Bilgisayarin Marka ve Modelini Goster
    echo 4^) Sistem Bilgilerini Goruntule
    echo 5^) Windows Lisans Durumunu Goster
    echo 6^) Windows Lisans Detaylarini Goster
    echo 7^) Geri / Ana Menü
) else (
    echo --- System Information ---
    echo 1^) Show PC Name and Active User
    echo 2^) Show PC Serial Number ^(Admin^)
    echo 3^) Show PC Manufacturer and Model
    echo 4^) View System Information
    echo 5^) Show Windows License Status
    echo 6^) Show Windows License Details
    echo 7^) Back / Main Menu
)
echo ============================================
set /p sys_choice=Seçiminiz / Your choice (1-7): 

if "%sys_choice%"=="1" (
    if "%LANGUAGE%"=="TR" (
        echo Bilgisayar Adi: %COMPUTERNAME%
        echo Aktif Kullanici: %USERNAME%
    ) else (
        echo Computer Name: %COMPUTERNAME%
        echo Active User: %USERNAME%
    )
    pause
    goto SYSTEM_MENU
)

if "%sys_choice%"=="2" (
    net session >nul 2>&1
    if %errorlevel%==0 (
        if "%LANGUAGE%"=="TR" (
            echo Bilgisayar Seri Numarasi:
        ) else (
            echo PC Serial Number:
        )
        wmic bios get serialnumber
    ) else (
        if "%LANGUAGE%"=="TR" (
            echo Bu komut icin yönetici izni gerekir!
        ) else (
            echo This command requires admin privileges!
        )
    )
    pause
    goto SYSTEM_MENU
)

if "%sys_choice%"=="3" (
    if "%LANGUAGE%"=="TR" (
        echo Bilgisayarin Marka ve Modeli:
    ) else (
        echo PC Manufacturer and Model:
    )
    wmic computersystem get manufacturer,model
    pause
    goto SYSTEM_MENU
)

if "%sys_choice%"=="4" (
    systeminfo
    pause
    goto SYSTEM_MENU
)

if "%sys_choice%"=="5" (
    if "%LANGUAGE%"=="TR" (
        echo Windows Lisans Durumu:
    ) else (
        echo Windows License Status:
    )
    slmgr /xpr
    pause
    goto SYSTEM_MENU
)

if "%sys_choice%"=="6" (
    if "%LANGUAGE%"=="TR" (
        echo Windows Lisans Detaylari:
    ) else (
        echo Windows License Details:
    )
    slmgr /dlv
    pause
    goto SYSTEM_MENU
)

if "%sys_choice%"=="7" goto MAIN_MENU

:: Hatalı giriş -> Sistem Menüye dön
echo %INVALID_INPUT%
pause
goto SYSTEM_MENU

:: ========================================================
::                AĞ İŞLEMLERİ MENÜSÜ
:: ========================================================
:NETWORK_MENU
cls
if "%LANGUAGE%"=="TR" (
    echo --- Ağ İşlemleri ---
    echo 1^) Bagli Wi-Fi Sifresini Goster ^(Yönetici^)
    echo 2^) IP Adresini Goruntule
    echo 3^) IP Yapilandirmasini Tumunu Goruntule
    echo 4^) IP Yapilandirmasini Serbest Birak ^(release^) ^(Yönetici^)
    echo 5^) IP Yapilandirmasini Yenile ^(renew^) ^(Yönetici^)
    echo 6^) Ağ DNS Onbellegini Temizle ^(flushdns^) ^(Yönetici^)
    echo 7^) Ping Testi Yap
    echo 8^) Geri / Ana Menü
) else (
    echo --- Network Operations ---
    echo 1^) Show Connected Wi-Fi Password ^(Admin^)
    echo 2^) Display IP Address
    echo 3^) Display Full IP Configuration
    echo 4^) Release IP Configuration ^(release^) ^(Admin^)
    echo 5^) Renew IP Configuration ^(renew^) ^(Admin^)
    echo 6^) Flush DNS Cache ^(flushdns^) ^(Admin^)
    echo 7^) Perform Ping Test
    echo 8^) Back / Main Menu
)
echo ============================================
set /p net_choice=Seçiminiz / Your choice (1-8): 

if "%net_choice%"=="1" (
    net session >nul 2>&1
    if %errorlevel%==0 (
        if "%LANGUAGE%"=="TR" (
            echo Bagli Wi-Fi Sifresi:
        ) else (
            echo Connected Wi-Fi Password:
        )
        netsh wlan show profile name=* key=clear
    ) else (
        if "%LANGUAGE%"=="TR" (
            echo Bu komut icin yönetici izni gerekir!
        ) else (
            echo This command requires admin privileges!
        )
    )
    pause
    goto NETWORK_MENU
)

if "%net_choice%"=="2" (
    if "%LANGUAGE%"=="TR" (
        echo IP Adresi:
    ) else (
        echo IP Address:
    )
    ipconfig
    pause
    goto NETWORK_MENU
)

if "%net_choice%"=="3" (
    if "%LANGUAGE%"=="TR" (
        echo Tum IP Yapilandirmasi:
    ) else (
        echo Full IP Configuration:
    )
    ipconfig /all
    pause
    goto NETWORK_MENU
)

if "%net_choice%"=="4" (
    net session >nul 2>&1
    if %errorlevel%==0 (
        ipconfig /release
    ) else (
        if "%LANGUAGE%"=="TR" (
            echo Bu komut icin yönetici izni gerekir!
        ) else (
            echo This command requires admin privileges!
        )
    )
    pause
    goto NETWORK_MENU
)

if "%net_choice%"=="5" (
    net session >nul 2>&1
    if %errorlevel%==0 (
        ipconfig /renew
    ) else (
        if "%LANGUAGE%"=="TR" (
            echo Bu komut icin yönetici izni gerekir!
        ) else (
            echo This command requires admin privileges!
        )
    )
    pause
    goto NETWORK_MENU
)

if "%net_choice%"=="6" (
    net session >nul 2>&1
    if %errorlevel%==0 (
        ipconfig /flushdns
    ) else (
        if "%LANGUAGE%"=="TR" (
            echo Bu komut icin yönetici izni gerekir!
        ) else (
            echo This command requires admin privileges!
        )
    )
    pause
    goto NETWORK_MENU
)

if "%net_choice%"=="7" (
    if "%LANGUAGE%"=="TR" (
        set /p ip=Ping atmak istediginiz IP veya adresi girin: 
    ) else (
        set /p ip=Enter the IP or address to ping: 
    )
    echo [DEBUG] Pinging: %ip%
    ping "%ip%"
    pause
    goto NETWORK_MENU
)

if "%net_choice%"=="8" goto MAIN_MENU

:: Hatalı giriş -> Ağ İşlemleri Menüye dön
echo %INVALID_INPUT%
pause
goto NETWORK_MENU
)

if "%net_choice%"=="6" (
    net session >nul 2>&1
    if %errorlevel%==0 (
        ipconfig /flushdns
    ) else (
        if "%LANGUAGE%"=="TR" (
            echo Bu komut icin yönetici izni gerekir!
        ) else (
            echo This command requires admin privileges!
        )
    )
    pause
    goto NETWORK_MENU
)

if "%net_choice%"=="7" (
    if "%LANGUAGE%"=="TR" (
        set /p ip=Ping atmak istediginiz IP veya adresi girin: 
    ) else (
        set /p ip=Enter the IP or address to ping: 
    )
    ping %ip%
    pause
    goto NETWORK_MENU
)

if "%net_choice%"=="8" goto MAIN_MENU

:: Hatalı giriş -> Ağ İşlemleri Menüye dön
echo %INVALID_INPUT%
pause
goto NETWORK_MENU

:: ========================================================
::                 GÜVENLİK MENÜSÜ
:: ========================================================
:SECURITY_MENU
cls
if "%LANGUAGE%"=="TR" (
    echo --- Guvenlik ---
    echo 1^) Guvenlik Duvarini Ac ^(Yönetici^)
    echo 2^) Guvenlik Duvarini Kapat ^(Yönetici^)
    echo 3^) Geri / Ana Menü
) else (
    echo --- Security ---
    echo 1^) Enable Firewall ^(Admin^)
    echo 2^) Disable Firewall ^(Admin^)
    echo 3^) Back / Main Menu
)
echo ============================================
set /p sec_choice=Seçiminiz / Your choice (1-3): 

if "%sec_choice%"=="1" (
    net session >nul 2>&1
    if %errorlevel%==0 (
        netsh advfirewall set allprofiles state on
        if "%LANGUAGE%"=="TR" (
            echo Guvenlik Duvari acildi.
        ) else (
            echo Firewall enabled.
        )
    ) else (
        if "%LANGUAGE%"=="TR" (
            echo Bu komut icin yönetici izni gerekir!
        ) else (
            echo This command requires admin privileges!
        )
    )
    pause
    goto SECURITY_MENU
)

if "%sec_choice%"=="2" (
    net session >nul 2>&1
    if %errorlevel%==0 (
        netsh advfirewall set allprofiles state off
        if "%LANGUAGE%"=="TR" (
            echo Guvenlik Duvari kapatildi.
        ) else (
            echo Firewall disabled.
        )
    ) else (
        if "%LANGUAGE%"=="TR" (
            echo Bu komut icin yönetici izni gerekir!
        ) else (
            echo This command requires admin privileges!
        )
    )
    pause
    goto SECURITY_MENU
)

if "%sec_choice%"=="3" goto MAIN_MENU

:: Hatalı giriş -> Güvenlik Menüye dön
echo %INVALID_INPUT%
pause
goto SECURITY_MENU

:: ========================================================
::                   BAKIM MENÜSÜ
:: ========================================================
:MAINTENANCE_MENU
cls
if "%LANGUAGE%"=="TR" (
    echo --- Bakim ---
    echo 1^) Windows Sistem Dosyalarini Onar ^(Yönetici^)
    echo 2^) Windows Disk Temizligi Yap
    echo 3^) Gereksiz Dosyalari Temizle ^(Yönetici^)
    echo 4^) RAM Optimizasyonu Yap ^(manuel^)
    echo 5^) Grup Politikalarini Guncelle ^(gpupdate /force^)
    echo 6^) Geri / Ana Menü
) else (
    echo --- Maintenance ---
    echo 1^) Repair Windows System Files ^(Admin^)
    echo 2^) Run Windows Disk Cleanup
    echo 3^) Clean Temporary Files ^(Admin^)
    echo 4^) Optimize RAM ^(manual^)
    echo 5^) Update Group Policies ^(gpupdate /force^)
    echo 6^) Back / Main Menu
)
echo ============================================
set /p main_choice=Seçiminiz / Your choice (1-6): 

if "%main_choice%"=="1" (
    net session >nul 2>&1
    if %errorlevel%==0 (
        sfc /scannow
    ) else (
        if "%LANGUAGE%"=="TR" (
            echo Bu komut icin yönetici izni gerekir!
        ) else (
            echo This command requires admin privileges!
        )
    )
    pause
    goto MAINTENANCE_MENU
)

if "%main_choice%"=="2" (
    cleanmgr
    pause
    goto MAINTENANCE_MENU
)

if "%main_choice%"=="3" (
    net session >nul 2>&1
    if %errorlevel%==0 (
        del /q/f/s %temp%\*
        if "%LANGUAGE%"=="TR" (
            echo Gecici dosyalar temizlendi.
        ) else (
            echo Temporary files cleaned.
        )
    ) else (
        if "%LANGUAGE%"=="TR" (
            echo Bu komut icin yönetici izni gerekir!
        ) else (
            echo This command requires admin privileges!
        )
    )
    pause
    goto MAINTENANCE_MENU
)

if "%main_choice%"=="4" (
    if "%LANGUAGE%"=="TR" (
        echo RAM optimizasyonu icin ucuuncu parti yazilim kullanin.
    ) else (
        echo Use third-party software for RAM optimization.
    )
    pause
    goto MAINTENANCE_MENU
)

if "%main_choice%"=="5" (
    gpupdate /force
    pause
    goto MAINTENANCE_MENU
)

if "%main_choice%"=="6" goto MAIN_MENU

:: Hatalı giriş -> Bakım Menüye dön
echo %INVALID_INPUT%
pause
goto MAINTENANCE_MENU

:: ========================================================
::                   DONANIM MENÜSÜ
:: ========================================================
:HARDWARE_MENU
cls
if "%LANGUAGE%"=="TR" (
    echo --- Donanim ---
    echo 1^) CPU Bilgilerini Goster
    echo 2^) RAM Kullanimini Goster
    echo 3^) Sistem Depolama Durumunu Goster
    echo 4^) Sabit Diski Tara ^(chkdsk^) ^(Yönetici^)
    echo 5^) Disk Durumunu Kontrol Et
    echo 6^) Geri / Ana Menü
) else (
    echo --- Hardware ---
    echo 1^) Show CPU Information
    echo 2^) Show RAM Usage
    echo 3^) Show Storage Status
    echo 4^) Scan Hard Disk ^(chkdsk^) ^(Admin^)
    echo 5^) Check Disk Status
    echo 6^) Back / Main Menu
)
echo ============================================
set /p hard_choice=Seçiminiz / Your choice (1-6): 

if "%hard_choice%"=="1" (
    if "%LANGUAGE%"=="TR" (
        echo CPU Bilgileri:
    ) else (
        echo CPU Information:
    )
    wmic cpu get name,CurrentClockSpeed
    pause
    goto HARDWARE_MENU
)

if "%hard_choice%"=="2" (
    if "%LANGUAGE%"=="TR" (
        echo RAM Kullanim durumu:
    ) else (
        echo RAM Usage:
    )
    wmic OS get FreePhysicalMemory /Value
    pause
    goto HARDWARE_MENU
)

if "%hard_choice%"=="3" (
    if "%LANGUAGE%"=="TR" (
        echo Depolama Durumu:
    ) else (
        echo Storage Status:
    )
    wmic logicaldisk get size,freespace,caption
    pause
    goto HARDWARE_MENU
)

if "%hard_choice%"=="4" (
    net session >nul 2>&1
    if %errorlevel%==0 (
        chkdsk
    ) else (
        if "%LANGUAGE%"=="TR" (
            echo Bu komut icin yönetici izni gerekir!
        ) else (
            echo This command requires admin privileges!
        )
    )
    pause
    goto HARDWARE_MENU
)

if "%hard_choice%"=="5" (
    if "%LANGUAGE%"=="TR" (
        echo Disk Durumu:
    ) else (
        echo Disk Status:
    )
    wmic diskdrive get status
    pause
    goto HARDWARE_MENU
)

if "%hard_choice%"=="6" goto MAIN_MENU

:: Hatalı giriş -> Donanım Menüye dön
echo %INVALID_INPUT%
pause
goto HARDWARE_MENU

:: ========================================================
::               SİSTEM KAPATMA MENÜSÜ
:: ========================================================
:SHUTDOWN_MENU
cls
if "%LANGUAGE%"=="TR" (
    echo --- Sistem Kapatma ---
    echo 1^) Bilgisayari Kapat
    echo 2^) Bilgisayari Yeniden Baslat
    echo 3^) Geri / Ana Menü
) else (
    echo --- Shutdown ---
    echo 1^) Shut Down Computer
    echo 2^) Restart Computer
    echo 3^) Back / Main Menu
)
echo ============================================
set /p shut_choice=Seçiminiz / Your choice (1-3): 

if "%shut_choice%"=="1" (
    shutdown /s /t 0
    pause
    goto SHUTDOWN_MENU
)

if "%shut_choice%"=="2" (
    shutdown /r /t 0
    pause
    goto SHUTDOWN_MENU
)

if "%shut_choice%"=="3" goto MAIN_MENU

:: Hatalı giriş -> Kapatma Menüye dön
echo %INVALID_INPUT%
pause
goto SHUTDOWN_MENU
