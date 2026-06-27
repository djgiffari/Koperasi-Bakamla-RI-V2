@echo off
title Koperasi Bakamla RI v2 - Launcher

echo ===================================================
echo   Memulai Layanan Koperasi Bakamla RI v2 (Lokal)
echo ===================================================

echo.
echo [1/2] Menjalankan Backend Server (Port 3000)...
start cmd /k "cd backend && npx prisma generate && npm run dev"

echo [2/2] Menjalankan Frontend Admin Dashboard (Port 5173)...
start cmd /k "cd admin-dashboard && npm run dev"

echo.
echo Semua service sedang berjalan di jendela terminal baru!
echo.
echo - Buka Landing Page & Admin Dashboard : http://localhost:5173
echo - Buka Backend API Server           : http://localhost:3000
echo.
pause
