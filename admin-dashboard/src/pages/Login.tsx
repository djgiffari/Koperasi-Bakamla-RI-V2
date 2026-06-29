import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

const Login: React.FC = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const navigate = useNavigate();

  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault();
    setIsLoading(true);
    setError('');

    try {
      const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:3000/api';
      const response = await fetch(`${API_URL}/auth/login`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ username, password }),
      });

      const data = await response.json();

      if (response.ok) {
        // Save token to localStorage
        localStorage.setItem('koperasi_token', data.token);
        localStorage.setItem('koperasi_user', JSON.stringify(data.user));
        // Redirect to dashboard
        navigate('/dashboard');
      } else {
        setError(data.error || 'Terjadi kesalahan saat login.');
      }
    } catch (err) {
      setError('Koneksi ke server gagal. Pastikan server backend berjalan.');
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <div className="min-h-screen bg-[#F8FAFC] flex items-center justify-center relative overflow-hidden font-outfit">
      {/* Background Shapes for Glassmorphism */}
      <div className="absolute top-[-10%] left-[-10%] w-[40%] h-[40%] bg-[#0B1E36] rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-blob"></div>
      <div className="absolute top-[-10%] right-[-10%] w-[40%] h-[40%] bg-[#D4AF37] rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-blob animation-delay-2000"></div>
      <div className="absolute bottom-[-20%] left-[20%] w-[40%] h-[40%] bg-[#1A365D] rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-blob animation-delay-4000"></div>

      <div className="w-full max-w-md p-8 relative z-10">
        <div className="bg-white/70 backdrop-blur-xl border border-white/50 rounded-3xl p-8 shadow-[0_8px_32px_0_rgba(11,30,54,0.1)]">
          <div className="text-center mb-8">
            <div className="flex justify-center mb-4">
              <img src="/logo.png" alt="Logo Koperasi Bakamla RI" className="w-24 h-24 object-contain drop-shadow-xl" />
            </div>
            <h2 className="text-3xl font-bold text-[#0B1E36] mb-2">Selamat Datang</h2>
            <p className="text-slate-500">Silakan login untuk mengakses Dashboard Admin Koperasi Bakamla RI v2</p>
          </div>

          {error && (
            <div className="mb-6 p-4 bg-red-100 border border-red-200 rounded-xl text-red-600 text-sm text-center animate-pulse">
              {error}
            </div>
          )}

          <form onSubmit={handleLogin} className="space-y-6">
            <div>
              <label className="block text-sm font-medium text-[#0B1E36] mb-2">Username</label>
              <div className="relative">
                <input
                  type="text"
                  value={username}
                  onChange={(e) => setUsername(e.target.value)}
                  className="w-full bg-white/50 border border-slate-200 rounded-xl px-4 py-3 text-[#0B1E36] focus:outline-none focus:ring-2 focus:ring-[#D4AF37] focus:border-transparent transition-all"
                  placeholder="Masukkan username"
                  required
                />
              </div>
            </div>

            <div>
              <label className="block text-sm font-medium text-[#0B1E36] mb-2">Password</label>
              <div className="relative">
                <input
                  type="password"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  className="w-full bg-white/50 border border-slate-200 rounded-xl px-4 py-3 text-[#0B1E36] focus:outline-none focus:ring-2 focus:ring-[#D4AF37] focus:border-transparent transition-all"
                  placeholder="Masukkan password"
                  required
                />
              </div>
            </div>

            <button
              type="submit"
              disabled={isLoading}
              className="w-full bg-[#0B1E36] hover:bg-[#1A365D] text-white font-semibold py-3 px-4 rounded-xl shadow-lg shadow-[#0B1E36]/30 transform transition-all active:scale-95 flex justify-center items-center gap-2 border border-[#D4AF37]/30"
            >
              {isLoading ? (
                <>
                  <svg className="animate-spin -ml-1 mr-3 h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                    <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                    <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                  </svg>
                  Memproses...
                </>
              ) : (
                'Masuk ke Dashboard'
              )}
            </button>
          </form>

          <div className="mt-8 text-center">
            <p className="text-sm text-slate-500">
              Versi 2.1 • Koperasi Bakamla RI
            </p>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Login;
