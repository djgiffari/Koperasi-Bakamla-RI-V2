import React, { useState, useEffect } from 'react';
import { Settings as SettingsIcon, Building, Percent, Shield, Save, Database, Plus, Trash2, CreditCard } from 'lucide-react';
import { toast } from '../lib/toast';
import { Link } from 'react-router-dom';
import { api } from '../lib/api';

const Settings: React.FC = () => {
  const [activeTab, setActiveTab] = useState<'profil' | 'kebijakan' | 'pembayaran' | 'sistem' | 'master'>('profil');

  const [masterData, setMasterData] = useState<any[]>([]);
  const [newMaster, setNewMaster] = useState({ kategori: 'JENIS_SIMPANAN', nilai: '' });

  // States for single settings
  const [singleSettings, setSingleSettings] = useState({
    BUNGA_PINJAMAN: '1.5',
    BIAYA_ADMIN_PINJAMAN: '1',
    BIAYA_ASURANSI_PINJAMAN: '0.5',
    DENDA_KETERLAMBATAN_PER_HARI: '0.5',
    NOMINAL_SIMPANAN_WAJIB: '100000',
    PERSENTASE_SHU_DIBAGIKAN: '80',
    REKENING_BANK_KOPERASI: 'Bank Mandiri - 123456789 a/n Koperasi Bakamla',
    QRIS_IMAGE_URL: ''
  });

  const fetchMasterData = async () => {
    try {
      const data = await api.get('/pengaturan');
      setMasterData(data);
      
      // Parse single settings
      const newSettings = { ...singleSettings };
      data.forEach((item: any) => {
        if (item.kategori in newSettings) {
          (newSettings as any)[item.kategori] = item.nilai;
        }
      });
      setSingleSettings(newSettings);
    } catch (err) {
      console.error(err);
      toast.error('Gagal mengambil data pengaturan');
    }
  };

  useEffect(() => {
    fetchMasterData();
  }, []);

  const handleAddMaster = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!newMaster.nilai) return;
    try {
      await api.post('/pengaturan', newMaster);
      setNewMaster({ ...newMaster, nilai: '' });
      fetchMasterData();
      toast.success('Data master berhasil ditambahkan');
    } catch (error) {
      toast.error('Gagal menambahkan data');
    }
  };

  const handleDeleteMaster = async (id: number) => {
    try {
      await api.delete(`/pengaturan/${id}`);
      fetchMasterData();
      toast.success('Data berhasil dihapus');
    } catch (error) {
      toast.error('Gagal menghapus data');
    }
  };

  const handleSaveSettings = async (e: React.FormEvent) => {
    e.preventDefault();
    try {
      const payload = Object.entries(singleSettings).map(([kategori, nilai]) => ({
        kategori,
        nilai: String(nilai)
      }));
      await api.post('/pengaturan/bulk-update', payload);
      toast.success('Pengaturan berhasil disimpan!');
    } catch (error) {
      toast.error('Gagal menyimpan pengaturan');
    }
  };

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
        <div>
          <h1 className="text-3xl font-bold text-primary font-outfit flex items-center gap-3">
            <SettingsIcon size={32} className="text-secondary" />
            Pengaturan Sistem
          </h1>
          <p className="text-slate-500 mt-1">Atur profil koperasi, kebijakan bunga, biaya, dan preferensi aplikasi.</p>
        </div>
      </div>

      <div className="flex flex-col lg:flex-row gap-6">
        {/* Sidebar Nav */}
        <div className="w-full lg:w-64 space-y-2">
          <button 
            onClick={() => setActiveTab('profil')} 
            className={`w-full flex items-center gap-3 px-4 py-3 rounded-xl font-bold transition-all text-left ${activeTab === 'profil' ? 'bg-primary text-secondary shadow-lg' : 'bg-white/60 text-slate-600 hover:bg-white hover:text-primary'}`}
          >
            <Building size={18} /> Profil Koperasi
          </button>
          <button 
            onClick={() => setActiveTab('kebijakan')} 
            className={`w-full flex items-center gap-3 px-4 py-3 rounded-xl font-bold transition-all text-left ${activeTab === 'kebijakan' ? 'bg-primary text-secondary shadow-lg' : 'bg-white/60 text-slate-600 hover:bg-white hover:text-primary'}`}
          >
            <Percent size={18} /> Kebijakan & Biaya
          </button>
          <button 
            onClick={() => setActiveTab('pembayaran')} 
            className={`w-full flex items-center gap-3 px-4 py-3 rounded-xl font-bold transition-all text-left ${activeTab === 'pembayaran' ? 'bg-primary text-secondary shadow-lg' : 'bg-white/60 text-slate-600 hover:bg-white hover:text-primary'}`}
          >
            <CreditCard size={18} /> Pembayaran & Bank
          </button>
          <button 
            onClick={() => setActiveTab('sistem')} 
            className={`w-full flex items-center gap-3 px-4 py-3 rounded-xl font-bold transition-all text-left ${activeTab === 'sistem' ? 'bg-primary text-secondary shadow-lg' : 'bg-white/60 text-slate-600 hover:bg-white hover:text-primary'}`}
          >
            <Shield size={18} /> Akses Admin
          </button>
          <button 
            onClick={() => setActiveTab('master')} 
            className={`w-full flex items-center gap-3 px-4 py-3 rounded-xl font-bold transition-all text-left ${activeTab === 'master' ? 'bg-primary text-secondary shadow-lg' : 'bg-white/60 text-slate-600 hover:bg-white hover:text-primary'}`}
          >
            <Database size={18} /> Data Master
          </button>
        </div>

        {/* Content Area */}
        <div className="flex-1 glass-panel p-6">
          <form onSubmit={handleSaveSettings} className="space-y-6">
            
            {activeTab === 'profil' && (
              <div className="space-y-4 animate-in fade-in slide-in-from-right-4 duration-300">
                <h3 className="font-bold text-primary uppercase text-sm border-b border-slate-200 pb-2">Informasi Instansi</h3>
                <div>
                  <label className="block text-sm font-semibold text-slate-600 mb-1">Nama Koperasi</label>
                  <input type="text" defaultValue="Koperasi Bakamla RI" className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-xl outline-none focus:border-secondary text-sm font-bold text-slate-800" />
                </div>
                <div>
                  <label className="block text-sm font-semibold text-slate-600 mb-1">Alamat Kantor</label>
                  <textarea rows={3} defaultValue="Gedung Perintis Kemerdekaan, Jl. Proklamasi No.56, Menteng, Jakarta Pusat" className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-xl outline-none focus:border-secondary text-sm resize-none"></textarea>
                </div>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <div>
                    <label className="block text-sm font-semibold text-slate-600 mb-1">Nomor Telepon</label>
                    <input type="text" defaultValue="021-3141234" className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-xl outline-none focus:border-secondary text-sm" />
                  </div>
                  <div>
                    <label className="block text-sm font-semibold text-slate-600 mb-1">Email Koperasi</label>
                    <input type="email" defaultValue="admin@koperasi-bakamla.go.id" className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-xl outline-none focus:border-secondary text-sm" />
                  </div>
                </div>
              </div>
            )}

            {activeTab === 'kebijakan' && (
              <div className="space-y-4 animate-in fade-in slide-in-from-right-4 duration-300">
                <h3 className="font-bold text-primary uppercase text-sm border-b border-slate-200 pb-2">Kebijakan Pinjaman & SHU</h3>
                <div className="p-4 bg-amber-50 border border-amber-200 rounded-xl text-xs text-amber-700 leading-relaxed">
                  <strong>Peringatan:</strong> Perubahan biaya/bunga hanya akan berlaku untuk transaksi atau pengajuan baru setelah tombol simpan ditekan. Transaksi lama tidak akan terpengaruh.
                </div>
                
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div className="bg-white border border-slate-200 p-4 rounded-xl shadow-sm">
                    <label className="block text-sm font-bold text-slate-700 mb-1">Bunga Pinjaman (Flat/Bulan)</label>
                    <p className="text-[10px] text-slate-500 mb-3">Persentase bunga bulanan.</p>
                    <div className="relative">
                      <input type="number" step="0.1" value={singleSettings.BUNGA_PINJAMAN} onChange={e => setSingleSettings({...singleSettings, BUNGA_PINJAMAN: e.target.value})} className="w-full pl-4 pr-10 py-2 bg-slate-50 border border-slate-200 rounded-xl outline-none focus:border-secondary font-bold text-xl text-primary" />
                      <span className="absolute right-4 top-2 text-xl font-bold text-slate-400">%</span>
                    </div>
                  </div>

                  <div className="bg-white border border-slate-200 p-4 rounded-xl shadow-sm">
                    <label className="block text-sm font-bold text-slate-700 mb-1">Denda Keterlambatan (/Hari)</label>
                    <p className="text-[10px] text-slate-500 mb-3">Persentase dari sisa pokok jika telat per hari.</p>
                    <div className="relative">
                      <input type="number" step="0.1" value={singleSettings.DENDA_KETERLAMBATAN_PER_HARI} onChange={e => setSingleSettings({...singleSettings, DENDA_KETERLAMBATAN_PER_HARI: e.target.value})} className="w-full pl-4 pr-10 py-2 bg-slate-50 border border-slate-200 rounded-xl outline-none focus:border-secondary font-bold text-xl text-primary" />
                      <span className="absolute right-4 top-2 text-xl font-bold text-slate-400">%</span>
                    </div>
                  </div>

                  <div className="bg-white border border-slate-200 p-4 rounded-xl shadow-sm">
                    <label className="block text-sm font-bold text-slate-700 mb-1">Biaya Admin Pinjaman</label>
                    <p className="text-[10px] text-slate-500 mb-3">Persentase potongan cair 1x di awal.</p>
                    <div className="relative">
                      <input type="number" step="0.1" value={singleSettings.BIAYA_ADMIN_PINJAMAN} onChange={e => setSingleSettings({...singleSettings, BIAYA_ADMIN_PINJAMAN: e.target.value})} className="w-full pl-4 pr-10 py-2 bg-slate-50 border border-slate-200 rounded-xl outline-none focus:border-secondary font-bold text-xl text-primary" />
                      <span className="absolute right-4 top-2 text-xl font-bold text-slate-400">%</span>
                    </div>
                  </div>

                  <div className="bg-white border border-slate-200 p-4 rounded-xl shadow-sm">
                    <label className="block text-sm font-bold text-slate-700 mb-1">Biaya Asuransi Pinjaman</label>
                    <p className="text-[10px] text-slate-500 mb-3">Persentase potongan cair 1x di awal.</p>
                    <div className="relative">
                      <input type="number" step="0.1" value={singleSettings.BIAYA_ASURANSI_PINJAMAN} onChange={e => setSingleSettings({...singleSettings, BIAYA_ASURANSI_PINJAMAN: e.target.value})} className="w-full pl-4 pr-10 py-2 bg-slate-50 border border-slate-200 rounded-xl outline-none focus:border-secondary font-bold text-xl text-primary" />
                      <span className="absolute right-4 top-2 text-xl font-bold text-slate-400">%</span>
                    </div>
                  </div>
                  
                  <div className="bg-white border border-slate-200 p-4 rounded-xl shadow-sm">
                    <label className="block text-sm font-bold text-slate-700 mb-1">Tagihan Simpanan Wajib (Rp)</label>
                    <p className="text-[10px] text-slate-500 mb-3">Ditagihkan otomatis setiap awal bulan.</p>
                    <div className="relative">
                      <span className="absolute left-4 top-2 text-xl font-bold text-slate-400">Rp</span>
                      <input type="number" value={singleSettings.NOMINAL_SIMPANAN_WAJIB} onChange={e => setSingleSettings({...singleSettings, NOMINAL_SIMPANAN_WAJIB: e.target.value})} className="w-full pl-12 pr-4 py-2 bg-slate-50 border border-slate-200 rounded-xl outline-none focus:border-secondary font-bold text-xl text-primary" />
                    </div>
                  </div>

                  <div className="bg-white border border-slate-200 p-4 rounded-xl shadow-sm">
                    <label className="block text-sm font-bold text-slate-700 mb-1">SHU Dibagikan (%)</label>
                    <p className="text-[10px] text-slate-500 mb-3">Persentase Laba Bersih yang dibagikan ke anggota.</p>
                    <div className="relative">
                      <input type="number" step="1" value={singleSettings.PERSENTASE_SHU_DIBAGIKAN} onChange={e => setSingleSettings({...singleSettings, PERSENTASE_SHU_DIBAGIKAN: e.target.value})} className="w-full pl-4 pr-10 py-2 bg-slate-50 border border-slate-200 rounded-xl outline-none focus:border-secondary font-bold text-xl text-primary" />
                      <span className="absolute right-4 top-2 text-xl font-bold text-slate-400">%</span>
                    </div>
                  </div>
                </div>
              </div>
            )}

            {activeTab === 'pembayaran' && (
              <div className="space-y-4 animate-in fade-in slide-in-from-right-4 duration-300">
                <h3 className="font-bold text-primary uppercase text-sm border-b border-slate-200 pb-2">Informasi Pembayaran</h3>
                <p className="text-sm text-slate-500 mb-4">Informasi ini akan muncul di aplikasi mobile (mobile app) ketika anggota ingin melakukan transfer/top-up manual.</p>
                
                <div>
                  <label className="block text-sm font-semibold text-slate-600 mb-1">Rekening Bank Koperasi</label>
                  <input type="text" value={singleSettings.REKENING_BANK_KOPERASI} onChange={e => setSingleSettings({...singleSettings, REKENING_BANK_KOPERASI: e.target.value})} className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-xl outline-none focus:border-secondary text-sm" placeholder="Contoh: Bank BRI - 1234567 a/n Koperasi" />
                </div>
                <div>
                  <label className="block text-sm font-semibold text-slate-600 mb-1">URL Gambar QRIS (Opsional)</label>
                  <input type="text" value={singleSettings.QRIS_IMAGE_URL} onChange={e => setSingleSettings({...singleSettings, QRIS_IMAGE_URL: e.target.value})} className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-xl outline-none focus:border-secondary text-sm" placeholder="https://contoh.com/qris.jpg" />
                  {singleSettings.QRIS_IMAGE_URL && (
                    <div className="mt-2 p-2 border border-slate-200 rounded-xl inline-block bg-white">
                      <img src={singleSettings.QRIS_IMAGE_URL} alt="QRIS Preview" className="max-h-40" onError={(e) => (e.currentTarget.style.display = 'none')} />
                    </div>
                  )}
                </div>
              </div>
            )}

            {activeTab === 'sistem' && (
              <div className="space-y-4 animate-in fade-in slide-in-from-right-4 duration-300">
                <h3 className="font-bold text-primary uppercase text-sm border-b border-slate-200 pb-2">Manajemen Akses & Keamanan</h3>
                
                <div className="p-6 bg-slate-50 border border-slate-200 rounded-xl flex flex-col items-center justify-center text-center space-y-4">
                  <Shield size={48} className="text-slate-300" />
                  <div>
                    <h4 className="font-bold text-slate-700">Akses Admin & Hak Akses</h4>
                    <p className="text-sm text-slate-500 mt-1">Pengelolaan akun pengurus koperasi dipindahkan ke modul khusus Manajemen User.</p>
                  </div>
                  <Link to="/users" className="btn btn-primary mt-2">
                    Buka Halaman Manajemen User
                  </Link>
                </div>
              </div>
            )}

            {activeTab === 'master' && (
              <div className="space-y-4 animate-in fade-in slide-in-from-right-4 duration-300">
                <h3 className="font-bold text-primary uppercase text-sm border-b border-slate-200 pb-2">Manajemen Data Master</h3>
                <p className="text-xs text-slate-500 mb-4">Tambahkan data referensi untuk Pangkat/Golongan dan Instansi/Unit Kerja yang akan muncul sebagai pilihan di menu Anggota.</p>

                <div className="flex flex-col sm:flex-row gap-4 items-end mb-6 bg-slate-50 p-4 rounded-xl border border-slate-200">
                  <div className="flex-1 w-full">
                    <label className="block text-xs font-semibold text-slate-600 mb-1">Kategori</label>
                    <select 
                      value={newMaster.kategori}
                      onChange={(e) => setNewMaster({...newMaster, kategori: e.target.value})}
                      className="w-full px-3 py-2 bg-white border border-slate-200 rounded-lg outline-none focus:border-secondary text-sm"
                    >
                      <option value="JENIS_SIMPANAN">Jenis Simpanan</option>
                      <option value="KODE_AKUN">Kode Akun / Jurnal</option>
                      <option value="PANGKAT">Pangkat / Golongan</option>
                      <option value="UNIT_KERJA">Instansi / Unit Kerja</option>
                    </select>
                  </div>
                  <div className="flex-1 w-full">
                    <label className="block text-xs font-semibold text-slate-600 mb-1">Nilai / Nama</label>
                    <input 
                      type="text" 
                      value={newMaster.nilai}
                      onChange={(e) => setNewMaster({...newMaster, nilai: e.target.value})}
                      placeholder="Masukkan nama..."
                      className="w-full px-3 py-2 bg-white border border-slate-200 rounded-lg outline-none focus:border-secondary text-sm" 
                    />
                  </div>
                  <button type="button" onClick={handleAddMaster} className="btn btn-primary w-full sm:w-auto flex items-center justify-center gap-2 py-2">
                    <Plus size={16} /> Tambah
                  </button>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                  {/* Jenis Simpanan List */}
                  <div>
                    <h4 className="font-bold text-sm text-slate-700 mb-2">Jenis Simpanan</h4>
                    <div className="bg-white border border-slate-200 rounded-xl max-h-64 overflow-y-auto">
                      {masterData.filter(d => d.kategori === 'JENIS_SIMPANAN').length === 0 ? (
                        <div className="p-4 text-center text-sm text-slate-400">Belum ada data</div>
                      ) : (
                        <ul className="divide-y divide-slate-100">
                          {masterData.filter(d => d.kategori === 'JENIS_SIMPANAN').map(item => (
                            <li key={item.id} className="p-3 flex justify-between items-center hover:bg-slate-50">
                              <span className="text-sm font-medium">{item.nilai}</span>
                              <button type="button" onClick={() => handleDeleteMaster(item.id)} className="text-red-400 hover:text-red-600">
                                <Trash2 size={16} />
                              </button>
                            </li>
                          ))}
                        </ul>
                      )}
                    </div>
                  </div>

                  {/* Kode Akun List */}
                  <div>
                    <h4 className="font-bold text-sm text-slate-700 mb-2">Kode Akun</h4>
                    <div className="bg-white border border-slate-200 rounded-xl max-h-64 overflow-y-auto">
                      {masterData.filter(d => d.kategori === 'KODE_AKUN').length === 0 ? (
                        <div className="p-4 text-center text-sm text-slate-400">Belum ada data</div>
                      ) : (
                        <ul className="divide-y divide-slate-100">
                          {masterData.filter(d => d.kategori === 'KODE_AKUN').map(item => (
                            <li key={item.id} className="p-3 flex justify-between items-center hover:bg-slate-50">
                              <span className="text-sm font-medium">{item.nilai}</span>
                              <button type="button" onClick={() => handleDeleteMaster(item.id)} className="text-red-400 hover:text-red-600">
                                <Trash2 size={16} />
                              </button>
                            </li>
                          ))}
                        </ul>
                      )}
                    </div>
                  </div>

                  {/* Pangkat List */}
                  <div>
                    <h4 className="font-bold text-sm text-slate-700 mb-2">Pangkat/Golongan</h4>
                    <div className="bg-white border border-slate-200 rounded-xl max-h-64 overflow-y-auto">
                      {masterData.filter(d => d.kategori === 'PANGKAT').length === 0 ? (
                        <div className="p-4 text-center text-sm text-slate-400">Belum ada data</div>
                      ) : (
                        <ul className="divide-y divide-slate-100">
                          {masterData.filter(d => d.kategori === 'PANGKAT').map(item => (
                            <li key={item.id} className="p-3 flex justify-between items-center hover:bg-slate-50">
                              <span className="text-sm font-medium">{item.nilai}</span>
                              <button type="button" onClick={() => handleDeleteMaster(item.id)} className="text-red-400 hover:text-red-600">
                                <Trash2 size={16} />
                              </button>
                            </li>
                          ))}
                        </ul>
                      )}
                    </div>
                  </div>

                  {/* Unit Kerja List */}
                  <div>
                    <h4 className="font-bold text-sm text-slate-700 mb-2">Unit Kerja</h4>
                    <div className="bg-white border border-slate-200 rounded-xl max-h-64 overflow-y-auto">
                      {masterData.filter(d => d.kategori === 'UNIT_KERJA').length === 0 ? (
                        <div className="p-4 text-center text-sm text-slate-400">Belum ada data</div>
                      ) : (
                        <ul className="divide-y divide-slate-100">
                          {masterData.filter(d => d.kategori === 'UNIT_KERJA').map(item => (
                            <li key={item.id} className="p-3 flex justify-between items-center hover:bg-slate-50">
                              <span className="text-sm font-medium">{item.nilai}</span>
                              <button type="button" onClick={() => handleDeleteMaster(item.id)} className="text-red-400 hover:text-red-600">
                                <Trash2 size={16} />
                              </button>
                            </li>
                          ))}
                        </ul>
                      )}
                    </div>
                  </div>
                </div>
              </div>
            )}

            {activeTab !== 'master' && activeTab !== 'sistem' && (
              <div className="pt-6 mt-6 border-t border-slate-200 flex justify-end">
                <button type="submit" className="btn btn-primary flex items-center gap-2">
                  <Save size={16} /> Simpan Pengaturan
                </button>
              </div>
            )}
          </form>
        </div>
      </div>
    </div>
  );
};

export default Settings;
