# Tahap 1: Build aplikasi menggunakan Node.js
FROM node:18-alpine AS builder

# Tentukan direktori kerja di dalam container
WORKDIR /app

# Salin file konfigurasi npm dan install dependensi
COPY package.json package-lock.json* ./
RUN npm install

# Salin seluruh kode proyek ke dalam container
COPY . .

# Jalankan proses build (Vite akan memproses kode dan menghasilkan folder 'dist')
RUN npm run build

# Tahap 2: Menjalankan Web Server menggunakan Nginx
FROM nginx:alpine

# Salin hasil build dari Tahap 1 ke direktori Nginx
COPY --from=builder /app/dist /usr/share/nginx/html

# Ekspos port 80 agar bisa diakses dari luar container
EXPOSE 80

# Jalankan Nginx
CMD ["nginx", "-g", "daemon off;"]
