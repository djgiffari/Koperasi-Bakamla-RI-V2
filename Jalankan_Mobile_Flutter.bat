@echo off
title Jalankan Aplikasi Koperasi Bakamla Mobile (Flutter)

:start
cls
echo ============================================================
echo  JALANKAN APLIKASI KOPERASI BAKAMLA MOBILE (FLUTTER)
echo ============================================================
echo.
echo Pastikan server backend Anda sudah aktif terlebih dahulu.
echo (Jalankan 'run_koperasi.bat' di folder utama jika belum aktif).
echo.
echo Pilih target perangkat untuk menjalankan aplikasi:
echo  [1] Jalankan di Browser Google Chrome (Web)
echo  [2] Jalankan sebagai Aplikasi Windows Desktop
echo  [3] Jalankan di Android Emulator / Perangkat Fisik (Kabel USB)
echo  [4] Hubungkan dan Jalankan via Wi-Fi (Wireless Debugging)
echo  [5] Keluar
echo.
set pilihan=
set /p pilihan="Masukkan pilihan Anda (1-5): "

if not exist pubspec.yaml (
  cd koperasi_mobile
)

if "%pilihan%"=="1" goto run_chrome
if "%pilihan%"=="2" goto run_desktop
if "%pilihan%"=="3" goto run_usb
if "%pilihan%"=="4" goto wifi_connect
if "%pilihan%"=="5" goto exit

echo.
echo Pilihan tidak valid! Silakan masukkan angka 1 sampai 5.
echo.
pause
goto start

:run_chrome
echo.
echo Menjalankan aplikasi Koperasi Bakamla Mobile di Google Chrome...
call flutter run -d chrome
goto end

:run_desktop
echo.
echo Menjalankan aplikasi Koperasi Bakamla Mobile sebagai Windows Desktop...
call flutter run -d windows
goto end

:run_usb
echo.
echo Menjalankan di Perangkat Android / Emulator terhubung (USB)...
call flutter run
goto end

:wifi_connect
echo.
echo ============================================================
echo        KONEKSI WIRELESS DEBUGGING (ADB VIA WI-FI)
echo ============================================================
echo Pastikan HP dan Laptop Anda terhubung ke Wi-Fi yang sama.
echo Aktifkan "Wireless Debugging" di Opsi Developer HP Anda.
echo.
set pairing=
set /p pairing="Apakah Anda perlu melakukan Pairing perangkat baru? (y/t): "
if /i "%pairing%"=="y" goto do_pairing
goto do_connection

:do_pairing
echo.
echo Klik "Pair device with pairing code" pada menu HP Anda.
set pair_ip=
set /p pair_ip="Masukkan IP dan Port Pairing (Contoh: 192.168.1.50:43215): "
set pair_code=
set /p pair_code="Masukkan Pairing Code (6 angka): "
echo Menghubungkan pairing...
adb pair %pair_ip% %pair_code%
echo.

:do_connection
echo.
echo Masukkan IP dan Port Koneksi utama yang tertera di menu HP Anda.
set connect_ip=
set /p connect_ip="Masukkan IP dan Port Koneksi (Contoh: 192.168.1.50:39853): "
echo Menghubungkan ke %connect_ip%...
adb connect %connect_ip%
echo.
echo Memeriksa status koneksi perangkat:
adb devices
echo.
echo Menjalankan aplikasi Koperasi Bakamla Mobile via Wi-Fi...
call flutter run -d %connect_ip%
goto end

:end
echo.
echo Aplikasi telah berhenti.
pause

:exit
exit
