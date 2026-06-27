import React, { useState } from 'react';
import { User, Mail, Shield, Save, CheckCircle } from 'lucide-react';

const ProfilAdmin: React.FC = () => {
  const [showSuccessPopup, setShowSuccessPopup] = useState(false);

  const handleSave = () => {
    // Simulasi penyimpanan
    setShowSuccessPopup(true);
  };

  return (
    <div className="space-y-6">
      <div className="flex flex-col justify-between items-start gap-4">
        <div>
          <h1 className="text-3xl font-bold text-primary font-outfit flex items-center gap-3">
            <User size={32} className="text-secondary" />
            Profil Saya
          </h1>
          <p className="text-slate-500 mt-1">Ubah informasi akun dan kata sandi Anda.</p>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <div className="glass-card p-6 flex flex-col items-center justify-center text-center space-y-4">
          <div className="w-24 h-24 rounded-full bg-primary flex items-center justify-center text-white text-3xl font-bold shadow-xl border-4 border-white">
            G
          </div>
          <div>
            <h2 className="text-xl font-bold text-white font-outfit">Admin Giffari</h2>
            <span className="text-xs font-bold text-purple-700 bg-purple-100 px-3 py-1 rounded-full uppercase tracking-wider">Super Admin</span>
          </div>
        </div>

        <div className="lg:col-span-2 glass-panel p-6 space-y-6">
          <h3 className="font-bold text-primary border-b border-slate-200 pb-2">Informasi Dasar</h3>
          
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div>
              <label className="block text-sm font-semibold text-slate-600 mb-1">Nama Lengkap</label>
              <div className="relative">
                <User size={16} className="absolute left-3 top-2.5 text-slate-400" />
                <input type="text" defaultValue="Admin Giffari" className="w-full pl-10 pr-4 py-2 bg-slate-50 border border-slate-200 rounded-xl outline-none focus:border-secondary text-sm" />
              </div>
            </div>
            <div>
              <label className="block text-sm font-semibold text-slate-600 mb-1">Email / Username</label>
              <div className="relative">
                <Mail size={16} className="absolute left-3 top-2.5 text-slate-400" />
                <input type="text" defaultValue="admin1" className="w-full pl-10 pr-4 py-2 bg-slate-50 border border-slate-200 rounded-xl outline-none focus:border-secondary text-sm" />
              </div>
            </div>
          </div>

          <h3 className="font-bold text-primary border-b border-slate-200 pb-2 mt-8">Ubah Kata Sandi</h3>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div>
              <label className="block text-sm font-semibold text-slate-600 mb-1">Kata Sandi Baru</label>
              <div className="relative">
                <Shield size={16} className="absolute left-3 top-2.5 text-slate-400" />
                <input type="password" placeholder="••••••••" className="w-full pl-10 pr-4 py-2 bg-slate-50 border border-slate-200 rounded-xl outline-none focus:border-secondary text-sm" />
              </div>
            </div>
            <div>
              <label className="block text-sm font-semibold text-slate-600 mb-1">Konfirmasi Kata Sandi Baru</label>
              <div className="relative">
                <Shield size={16} className="absolute left-3 top-2.5 text-slate-400" />
                <input type="password" placeholder="••••••••" className="w-full pl-10 pr-4 py-2 bg-slate-50 border border-slate-200 rounded-xl outline-none focus:border-secondary text-sm" />
              </div>
            </div>
          </div>

          <div className="pt-4 flex justify-end">
            <button onClick={handleSave} className="btn btn-primary flex items-center gap-2">
              <Save size={16} /> Simpan Perubahan
            </button>
          </div>
        </div>
      </div>

      {/* Custom Success Popup Modal */}
      {showSuccessPopup && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
          <div 
            className="fixed inset-0 bg-primary/40 backdrop-blur-sm transition-opacity" 
            onClick={() => setShowSuccessPopup(false)}
          ></div>
          <div className="relative bg-white rounded-2xl shadow-2xl w-full max-w-sm p-8 text-center modal-bounce">
            <div className="w-20 h-20 bg-emerald-100 text-emerald-500 rounded-full flex items-center justify-center mx-auto mb-6 shadow-inner">
              <CheckCircle size={40} />
            </div>
            <h3 className="text-2xl font-bold text-slate-800 mb-2 font-outfit">Berhasil!</h3>
            <p className="text-slate-500 mb-8">Data profil Anda telah berhasil diperbarui ke dalam sistem.</p>
            <button 
              onClick={() => setShowSuccessPopup(false)} 
              className="w-full btn btn-primary"
            >
              Tutup
            </button>
          </div>
        </div>
      )}
    </div>
  );
};

export default ProfilAdmin;
