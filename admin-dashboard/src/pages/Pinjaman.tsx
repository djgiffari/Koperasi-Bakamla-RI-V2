import React, { useState } from 'react';
import { Search, Plus, Trash2, CreditCard, UserCheck, TrendingUp } from 'lucide-react';
import ConfirmDialog from '../components/ConfirmDialog';
import Drawer from '../components/Drawer';
import EmptyState from '../components/EmptyState';

const initialPinjaman = [
  { id: 'PNJ-001', nama_lengkap: 'Budi Santoso', nominal: 10000000, tenor: 12, angsuran: 933333, status: 'menunggu_verifikasi', date: '25 Jun 2026' },
  { id: 'PNJ-002', nama_lengkap: 'Siti Aminah', nominal: 5000000, tenor: 6, angsuran: 883333, status: 'diproses', date: '20 Jun 2026' },
  { id: 'PNJ-003', nama_lengkap: 'Agus Pratama', nominal: 20000000, tenor: 24, angsuran: 1033333, status: 'dicairkan', date: '15 Jun 2026' },
];

const Pinjaman: React.FC = () => {
  const [dataList, setDataList] = useState(initialPinjaman);
  const [subTab, setSubTab] = useState<'workflow' | 'aktif'>('workflow');
  const [searchTerm, setSearchTerm] = useState('');
  
  const [isDrawerOpen, setIsDrawerOpen] = useState(false);
  const [isConfirmOpen, setIsConfirmOpen] = useState(false);
  const [actionData, setActionData] = useState<{id: string, action: string} | null>(null);

  // Form State
  const [formData, setFormData] = useState({ nama_lengkap: '', nominal: '', tenor: 12, tujuan: '' });

  // Kalkulasi Bunga (1% Flat)
  const nominalVal = parseInt(formData.nominal.replace(/\D/g, '')) || 0;
  const estPokok = nominalVal / formData.tenor;
  const estBunga = nominalVal * 0.01;
  const estTotal = estPokok + estBunga;

  // Handlers
  const handleActionClick = (id: string, action: string) => {
    setActionData({id, action});
    setIsConfirmOpen(true);
  };

  const confirmAction = () => {
    if(!actionData) return;
    if (actionData.action === 'delete') {
      setDataList(dataList.filter(item => item.id !== actionData.id));
    } else {
      setDataList(dataList.map(item => item.id === actionData.id ? { ...item, status: actionData.action } : item));
    }
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    const newId = `PNJ-00${dataList.length + 1}`;
    setDataList([
      { 
        id: newId, 
        nama_lengkap: formData.nama_lengkap, 
        nominal: nominalVal, 
        tenor: formData.tenor,
        angsuran: Math.round(estTotal),
        status: 'menunggu_verifikasi',
        date: new Date().toLocaleDateString('id-ID', {day: 'numeric', month: 'short', year: 'numeric'})
      }, 
      ...dataList
    ]);
    setIsDrawerOpen(false);
  };

  // Filter Data
  const pendingData = dataList.filter(item => !['dicairkan', 'lunas', 'ditolak'].includes(item.status) && item.nama_lengkap.toLowerCase().includes(searchTerm.toLowerCase()));
  const activeData = dataList.filter(item => ['dicairkan', 'lunas', 'ditolak'].includes(item.status) && item.nama_lengkap.toLowerCase().includes(searchTerm.toLowerCase()));
  const displayData = subTab === 'workflow' ? pendingData : activeData;

  const getStatusColor = (status: string) => {
    switch (status) {
      case 'dicairkan': return 'bg-blue-100 text-blue-700';
      case 'lunas': return 'bg-emerald-100 text-emerald-700';
      case 'ditolak': return 'bg-red-100 text-red-700';
      default: return 'bg-amber-100 text-amber-700'; // pending/menunggu dll
    }
  };

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
        <div>
          <h1 className="text-3xl font-bold text-primary font-outfit flex items-center gap-3">
            <CreditCard size={32} className="text-secondary" />
            Data Pinjaman
          </h1>
          <p className="text-slate-500 mt-1">Kelola persetujuan dan riwayat pengajuan pinjaman anggota.</p>
        </div>
        <button onClick={() => setIsDrawerOpen(true)} className="btn btn-primary flex items-center gap-2 shadow-lg">
          <Plus size={16} /> Input Pinjaman
        </button>
      </div>

      <div className="glass-panel overflow-hidden">
        {/* Tab Selection */}
        <div className="flex flex-col sm:flex-row sm:items-center justify-between border-b border-slate-200/50 bg-white/30 px-6">
          <div className="flex">
            <button
              onClick={() => setSubTab('workflow')}
              className={`py-4 mr-6 text-sm font-bold uppercase transition-all relative ${subTab === 'workflow' ? 'text-primary' : 'text-slate-400 hover:text-slate-600'}`}
            >
              <div className="flex items-center gap-2"><UserCheck size={16}/> Workflow Approval</div>
              {subTab === 'workflow' && <div className="absolute bottom-0 left-0 w-full h-0.5 bg-secondary shadow-[0_0_8px_rgba(212,175,55,0.8)]"></div>}
            </button>
            <button
              onClick={() => setSubTab('aktif')}
              className={`py-4 text-sm font-bold uppercase transition-all relative ${subTab === 'aktif' ? 'text-primary' : 'text-slate-400 hover:text-slate-600'}`}
            >
              <div className="flex items-center gap-2"><TrendingUp size={16}/> Pinjaman Aktif</div>
              {subTab === 'aktif' && <div className="absolute bottom-0 left-0 w-full h-0.5 bg-secondary shadow-[0_0_8px_rgba(212,175,55,0.8)]"></div>}
            </button>
          </div>
          
          <div className="relative py-3 sm:py-0">
            <Search size={16} className="absolute left-0 sm:left-3 top-5.5 sm:top-2.5 text-slate-400" />
            <input
              type="text" placeholder="Cari nama peminjam..."
              className="w-full sm:w-64 pl-6 sm:pl-9 pr-4 py-2 bg-transparent sm:bg-white/50 border-b sm:border border-slate-200 sm:rounded-lg text-sm outline-none focus:border-secondary transition-colors"
              value={searchTerm} onChange={(e) => setSearchTerm(e.target.value)}
            />
          </div>
        </div>

        {displayData.length === 0 ? (
          <div className="py-12">
            <EmptyState icon={CreditCard} title={`Belum ada data ${subTab}`} description="Data pengajuan akan muncul di sini sesuai kategori." />
          </div>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="bg-primary/5 text-primary text-xs uppercase tracking-wider border-b border-primary/10">
                  <th className="px-6 py-4 font-bold">Nama Anggota</th>
                  <th className="px-6 py-4 font-bold">Nominal</th>
                  <th className="px-6 py-4 font-bold">Tenor</th>
                  <th className="px-6 py-4 font-bold">Status</th>
                  <th className="px-6 py-4 font-bold text-center">Aksi / Keputusan</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100/50 text-sm">
                {displayData.map((item) => (
                  <tr key={item.id} className="hover:bg-white/40 transition-colors group">
                    <td className="px-6 py-4 font-semibold text-slate-800">{item.nama_lengkap}</td>
                    <td className="px-6 py-4 font-bold text-secondary">Rp {item.nominal.toLocaleString('id-ID')}</td>
                    <td className="px-6 py-4 text-slate-600">{item.tenor} bln</td>
                    <td className="px-6 py-4">
                      <span className={`px-2.5 py-1 rounded-md text-[10px] font-bold uppercase tracking-wider ${getStatusColor(item.status)}`}>
                        {item.status.replace(/_/g, ' ')}
                      </span>
                    </td>
                    <td className="px-6 py-4 text-center">
                      {subTab === 'workflow' ? (
                        <div className="flex items-center justify-center gap-2">
                          {item.status === 'menunggu_verifikasi' && (
                            <button onClick={() => handleActionClick(item.id, 'diproses')} className="px-3 py-1 bg-blue-900 text-blue-100 hover:bg-blue-800 rounded-lg text-[10px] font-semibold transition-colors">
                              Verifikasi
                            </button>
                          )}
                          {item.status === 'diproses' && (
                            <button onClick={() => handleActionClick(item.id, 'disetujui_bendahara')} className="px-3 py-1 bg-purple-900 text-purple-100 hover:bg-purple-800 rounded-lg text-[10px] font-semibold transition-colors">
                              Setujui Bendahara
                            </button>
                          )}
                          {item.status === 'disetujui_bendahara' && (
                            <button onClick={() => handleActionClick(item.id, 'dicairkan')} className="px-3 py-1 bg-secondary text-primary hover:bg-secondary-hover rounded-lg text-[10px] font-bold transition-colors">
                              Cairkan Dana
                            </button>
                          )}
                          <button onClick={() => handleActionClick(item.id, 'ditolak')} className="px-2 py-1 text-red-500 hover:bg-red-50 rounded-lg text-[10px] font-semibold transition-colors">
                            Tolak
                          </button>
                        </div>
                      ) : (
                        <button onClick={() => handleActionClick(item.id, 'delete')} className="p-1.5 text-slate-400 hover:text-red-500 hover:bg-red-50 rounded-lg transition-colors opacity-0 group-hover:opacity-100" title="Hapus">
                          <Trash2 size={16} />
                        </button>
                      )}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </div>

      {/* Action Drawer */}
      <Drawer isOpen={isDrawerOpen} onClose={() => setIsDrawerOpen(false)} title="Input Pinjaman Manual" onSubmit={handleSubmit}>
        <div className="space-y-4">
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Nama Anggota</label>
            <input 
              type="text" required value={formData.nama_lengkap} onChange={e => setFormData({...formData, nama_lengkap: e.target.value})}
              className="w-full px-4 py-2 bg-white border border-slate-300 rounded-xl outline-none focus:border-primary" placeholder="Masukkan nama..."
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Nominal Pinjaman (Rp)</label>
            <input 
              type="text" required value={formData.nominal} onChange={e => setFormData({...formData, nominal: e.target.value})}
              className="w-full px-4 py-2 bg-white border border-slate-300 rounded-xl outline-none focus:border-primary font-mono" placeholder="10000000"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Tenor (Bulan)</label>
            <select 
              value={formData.tenor} onChange={e => setFormData({...formData, tenor: parseInt(e.target.value)})}
              className="w-full px-4 py-2 bg-white border border-slate-300 rounded-xl outline-none focus:border-primary"
            >
              <option value={3}>3 Bulan</option>
              <option value={6}>6 Bulan</option>
              <option value={12}>12 Bulan</option>
              <option value={24}>24 Bulan</option>
            </select>
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Tujuan Penggunaan</label>
            <input 
              type="text" required value={formData.tujuan} onChange={e => setFormData({...formData, tujuan: e.target.value})}
              className="w-full px-4 py-2 bg-white border border-slate-300 rounded-xl outline-none focus:border-primary" placeholder="Tujuan pinjaman..."
            />
          </div>

          {/* Calculator Widget */}
          <div className="bg-slate-50 border border-slate-200 rounded-xl p-4 space-y-2 mt-4">
            <p className="font-bold text-primary text-xs uppercase tracking-wide mb-2">Estimasi Angsuran (1% Flat)</p>
            <div className="flex justify-between text-sm text-slate-600">
              <span>Pokok Bulanan:</span>
              <span>Rp {Math.round(estPokok || 0).toLocaleString('id-ID')}</span>
            </div>
            <div className="flex justify-between text-sm text-slate-600">
              <span>Bunga Bulanan (1%):</span>
              <span>Rp {Math.round(estBunga || 0).toLocaleString('id-ID')}</span>
            </div>
            <div className="border-t border-slate-200 pt-2 flex justify-between font-bold text-primary mt-2">
              <span>Total Cicilan:</span>
              <span>Rp {Math.round(estTotal || 0).toLocaleString('id-ID')} / bln</span>
            </div>
          </div>
        </div>
      </Drawer>

      <ConfirmDialog 
        isOpen={isConfirmOpen} 
        onClose={() => setIsConfirmOpen(false)} 
        onConfirm={confirmAction} 
        title={actionData?.action === 'delete' ? "Hapus Pinjaman" : "Konfirmasi Tindakan"} 
        message={actionData?.action === 'delete' ? "Yakin ingin menghapus data ini secara permanen?" : `Lanjutkan proses pinjaman menjadi status: ${actionData?.action.replace(/_/g, ' ').toUpperCase()}?`}
        confirmText={actionData?.action === 'delete' ? 'Hapus Data' : 'Ya, Lanjutkan'}
      />
    </div>
  );
};

export default Pinjaman;
