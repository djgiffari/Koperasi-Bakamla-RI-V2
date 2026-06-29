@echo off
title Build APK Koperasi Mobile
color 0B
echo ========================================================
echo MEMBUAT FILE APK (RELEASE) APLIKASI KOPERASI BAKAMLA
echo ========================================================
echo.
echo Proses ini akan merakit aplikasi Anda menjadi file .apk
echo yang siap diinstal di HP Android mana pun.
echo Pastikan koneksi internet stabil (bisa memakan waktu 1-5 menit).
echo.
echo Sedang memproses... (Mohon tunggu dan jangan ditutup)
echo.

cd koperasi_mobile

call flutter build apk --release

if %errorlevel% neq 0 (
    color 0C
    echo.
    echo ========================================================
    echo GAGAL MEMBUAT APK!
    echo Silakan baca pesan error berwarna merah di atas.
    echo ========================================================
    pause
    exit
)

echo.
color 0A
echo ========================================================
echo BUILD APK SUKSES 100%%!
echo ========================================================
echo Membuka folder tempat file APK Anda berada...
echo (Cari file bernama "app-release.apk")
echo.

explorer "build\app\outputs\flutter-apk"

pause
