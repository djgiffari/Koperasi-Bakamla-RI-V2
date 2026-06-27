import React, { useState } from 'react';
import { Radio, Send, Bell } from 'lucide-react';
import ConfirmDialog from '../components/ConfirmDialog';
import { api } from '../lib/api';
import { toast } from '../lib/toast';

const Broadcast: React.FC = () => {
  const [title, setTitle] = useState('');
  const [message, setMessage] = useState('');
  const [isConfirmOpen, setIsConfirmOpen] = useState(false);

  const handleSend = (e: React.FormEvent) => {
    e.preventDefault();
    if (!title || !message) return;
    setIsConfirmOpen(true);
  };

  const confirmSend = async () => {
    try {
      await api.post('/broadcast', { title, message });
      toast.success('Pesan siaran berhasil dikirim ke seluruh anggota');
      setTitle('');
      setMessage('');
    } catch (error) {
      toast.error('Gagal mengirim pesan siaran');
    } finally {
      setIsConfirmOpen(false);
    }
  };

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
        <div>
          <h1 className="text-3xl font-bold text-primary font-outfit flex items-center gap-3">
            <Radio size={32} className="text-secondary" />
            Pesan Siaran (Broadcast)
          </h1>
          <p className="text-slate-500 mt-1">Kirim notifikasi pengumuman massal ke seluruh perangkat anggota.</p>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
        {/* Form Send */}
        <div className="glass-panel p-6 space-y-4">
          <h3 className="font-bold text-primary uppercase text-sm mb-4">Buat Pengumuman Baru</h3>
          <form onSubmit={handleSend} className="space-y-4">
            <div>
              <label className="block text-sm font-semibold text-slate-600 mb-1">Judul Pengumuman</label>
              <input 
                type="text" required value={title} onChange={e => setTitle(e.target.value)}
                placeholder="Contoh: Rapat Anggota Tahunan 2026" 
                className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-xl outline-none focus:border-secondary text-sm" 
              />
            </div>
            <div>
              <label className="block text-sm font-semibold text-slate-600 mb-1">Isi Pesan (Maks. 250 karakter)</label>
              <textarea 
                required rows={5} value={message} onChange={e => setMessage(e.target.value)}
                placeholder="Tuliskan isi pesan siaran di sini..." 
                className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-xl outline-none focus:border-secondary text-sm resize-none" 
              ></textarea>
            </div>
            <button type="submit" className="w-full btn btn-primary flex justify-center items-center gap-2">
              <Send size={16} /> Kirim ke Seluruh Anggota
            </button>
          </form>
        </div>

        {/* Preview Device */}
        <div className="flex items-center justify-center p-6 bg-slate-100 rounded-3xl border-8 border-slate-200 shadow-inner relative overflow-hidden">
          <div className="absolute top-4 w-20 h-4 bg-slate-300 rounded-full"></div>
          
          <div className="w-full max-w-[300px] h-[500px] bg-white rounded-xl shadow-lg relative overflow-hidden">
            {/* Mobile Header */}
            <div className="bg-primary text-white p-4 h-16 flex items-center justify-between">
              <span className="font-bold">Koperasi Bakamla</span>
              <Bell size={18} />
            </div>

            {/* Notification Bubble Preview */}
            <div className="p-4 h-full bg-slate-50">
              {title || message ? (
                <div className="bg-white border border-slate-200 p-4 rounded-xl shadow-sm animate-pulse">
                  <div className="flex items-center gap-2 text-primary font-bold text-sm mb-1">
                    <Radio size={14} className="text-secondary" /> Pengumuman
                  </div>
                  <h4 className="font-bold text-slate-800 text-sm mb-1">{title || 'Judul Pengumuman'}</h4>
                  <p className="text-xs text-slate-500 leading-relaxed">{message || 'Isi pesan akan tampil di sini sebagai preview notifikasi di aplikasi mobile anggota.'}</p>
                </div>
              ) : (
                <div className="flex items-center justify-center h-full text-xs text-slate-400 text-center px-4">
                  Ketik judul dan pesan di form sebelah kiri untuk melihat preview notifikasi.
                </div>
              )}
            </div>
          </div>
        </div>
      </div>

      <ConfirmDialog 
        isOpen={isConfirmOpen} onClose={() => setIsConfirmOpen(false)} onConfirm={confirmSend} 
        title="Kirim Pesan Siaran" message={`Anda akan mengirimkan notifikasi ke ratusan perangkat anggota. Lanjutkan?`} 
      />
    </div>
  );
};

export default Broadcast;
