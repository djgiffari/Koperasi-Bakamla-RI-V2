import React, { useState, useEffect } from 'react';
import { Search, Plus, Trash2, CreditCard, UserCheck, TrendingUp } from 'lucide-react';
import ConfirmDialog from '../components/ConfirmDialog';
import Drawer from '../components/Drawer';
import EmptyState from '../components/EmptyState';
import Pagination from '../components/Pagination';
import { api } from '../lib/api';
import { toast } from '../lib/toast';

const Pinjaman: React.FC = () => {
  const [dataList, setDataList] = useState<any[]>([]);
  const [anggotaList, setAnggotaList] = useState<any[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [subTab, setSubTab] = useState<'workflow' | 'aktif'>('workflow');
  const [searchTerm, setSearchTerm] = useState('');
  const [statusFilter, setStatusFilter] = useState('Semua');
  
  // Pagination State
  const [currentPage, setCurrentPage] = useState(1);
  const [itemsPerPage, setItemsPerPage] = useState(10);
  
  const [isDrawerOpen, setIsDrawerOpen] = useState(false);
  const [isConfirmOpen, setIsConfirmOpen] = useState(false);
  const [actionData, setActionData] = useState<{id: string, action: string} | null>(null);

  // Form State
  const [formData, setFormData] = useState({ anggotaId: '', nominal: '', tenor: 12, tujuan: '' });

  const fetchData = async () => {
    setIsLoading(true);
    try {
      const [pinjamanData, anggotaData] = await Promise.all([
        api.get('/pinjaman'),
        api.get('/anggota')
      ]);
      setDataList(pinjamanData);
      setAnggotaList(anggotaData);
    } catch (error) {
      console.error('Error fetching data:', error);
      // toast.error('Gagal mengambil data pinjaman.');
    } finally {
      setIsLoading(false);
    }
  };

  useEffect(() => {
    fetchData();
  }, []);

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

  const confirmAction = async () => {
    if(!actionData) return;
    try {
      if (actionData.action === 'delete') {
        await api.delete(`/pinjaman/${actionData.id}`);
      } else {
        await api.put(`/pinjaman/${actionData.id}/status`, { status: actionData.action });
      }
      setIsConfirmOpen(false);
      setActionData(null);
      fetchData(); // Refresh data
      toast.success('Berhasil memproses aksi pinjaman');
    } catch (error) {
      console.error('Error handling pinjaman action:', error);
      toast.error('Gagal memproses aksi');
    }
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!formData.anggotaId) {
      toast.error('Pilih anggota terlebih dahulu');
      return;
    }
    try {
      const payload = {
        anggotaId: formData.anggotaId,
        nominal: nominalVal,
        tenor: formData.tenor
      };
      
      await api.post('/pinjaman', payload);
      setIsDrawerOpen(false);
      fetchData(); // Refresh data
      toast.success('Pinjaman berhasil ditambahkan');
    } catch (error) {
      console.error('Error saving pinjaman:', error);
      toast.error('Gagal menyimpan data pinjaman');
    }
  };

  // Filter Data
  // Filter Data
  const pendingData = dataList.filter(item => {
    const matchStatusArr = ['PENDING_ADMIN', 'PENDING_BENDAHARA'].includes(item.status);
    const matchSearch = (item.anggota?.namaLengkap || '').toLowerCase().includes(searchTerm.toLowerCase());
    const matchStatus = statusFilter === 'Semua' || item.status === statusFilter;
    return matchStatusArr && matchSearch && matchStatus;
  });
  
  const activeData = dataList.filter(item => {
    const matchStatusArr = ['DICAIRKAN', 'LUNAS', 'DITOLAK'].includes(item.status);
    const matchSearch = (item.anggota?.namaLengkap || '').toLowerCase().includes(searchTerm.toLowerCase());
    const matchStatus = statusFilter === 'Semua' || item.status === statusFilter;
    return matchStatusArr && matchSearch && matchStatus;
  });
  
  const displayData = subTab === 'workflow' ? pendingData : activeData;
  const paginatedData = displayData.slice((currentPage - 1) * itemsPerPage, currentPage * itemsPerPage);

  const getStatusColor = (status: string) => {
    switch (status) {
      case 'DICAIRKAN': return 'bg-blue-100 text-blue-700';
      case 'LUNAS': return 'bg-emerald-100 text-emerald-700';
      case 'DITOLAK': return 'bg-red-100 text-red-700';
      default: return 'bg-amber-100 text-amber-700'; // pending
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
              onClick={() => { setSubTab('workflow'); setStatusFilter('Semua'); setCurrentPage(1); }}
              className={`py-4 mr-6 text-sm font-bold uppercase transition-all relative ${subTab === 'workflow' ? 'text-primary' : 'text-slate-400 hover:text-slate-600'}`}
            >
              <div className="flex items-center gap-2"><UserCheck size={16}/> Workflow Approval</div>
              {subTab === 'workflow' && <div className="absolute bottom-0 left-0 w-full h-0.5 bg-secondary shadow-[0_0_8px_rgba(212,175,55,0.8)]"></div>}
            </button>
            <button
              onClick={() => { setSubTab('aktif'); setStatusFilter('Semua'); setCurrentPage(1); }}
              className={`py-4 text-sm font-bold uppercase transition-all relative ${subTab === 'aktif' ? 'text-primary' : 'text-slate-400 hover:text-slate-600'}`}
            >
              <div className="flex items-center gap-2"><TrendingUp size={16}/> Pinjaman Aktif</div>
              {subTab === 'aktif' && <div className="absolute bottom-0 left-0 w-full h-0.5 bg-secondary shadow-[0_0_8px_rgba(212,175,55,0.8)]"></div>}
            </button>
          </div>
          
          <div className="flex items-center gap-2 py-3 sm:py-0">
            <div className="relative">
              <Search size={16} className="absolute left-3 top-2.5 text-slate-400" />
              <input
                type="text" placeholder="Cari nama peminjam..."
                className="w-full sm:w-64 pl-9 pr-4 py-2 bg-transparent sm:bg-white/50 border border-slate-200 rounded-xl text-sm outline-none focus:border-secondary transition-colors"
                value={searchTerm} onChange={(e) => { setSearchTerm(e.target.value); setCurrentPage(1); }}
              />
            </div>
            <select 
              className="px-4 py-2 bg-white/70 border border-slate-200 text-slate-600 rounded-xl text-sm font-semibold focus:outline-none focus:border-secondary"
              value={statusFilter}
              onChange={(e) => { setStatusFilter(e.target.value); setCurrentPage(1); }}
            >
              <option value="Semua">Semua Status</option>
              {subTab === 'workflow' ? (
                <>
                  <option value="PENDING_ADMIN">Pending Admin</option>
                  <option value="PENDING_BENDAHARA">Pending Bendahara</option>
                </>
              ) : (
                <>
                  <option value="DICAIRKAN">Dicairkan</option>
                  <option value="LUNAS">Lunas</option>
                  <option value="DITOLAK">Ditolak</option>
                </>
              )}
            </select>
          </div>
        </div>

        {isLoading ? (
          <div className="flex justify-center py-12">
            <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-primary"></div>
          </div>
        ) : displayData.length === 0 ? (
          <div className="py-12">
            <EmptyState icon={CreditCard} title={`Belum ada data ${subTab}`} description="Data pengajuan akan muncul di sini sesuai kategori." />
          </div>
        ) : (
          <>
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
                <tbody className="divide-y divide-slate-200/60 text-sm">
                  {paginatedData.map((item) => (
                    <tr key={item.id} className="hover:bg-white/60 transition-colors group">
                      <td className="px-6 py-4 font-semibold text-slate-800">{item.anggota?.namaLengkap || '-'}</td>
                      <td className="px-6 py-4 font-bold text-emerald-600">Rp {item.nominal.toLocaleString('id-ID')}</td>
                      <td className="px-6 py-4 text-slate-600">{item.tenor} bln</td>
                      <td className="px-6 py-4">
                        <span className={`px-2.5 py-1 rounded-md text-[10px] font-bold uppercase tracking-wider ${getStatusColor(item.status)}`}>
                          {item.status.replace(/_/g, ' ')}
                        </span>
                      </td>
                      <td className="px-6 py-4 text-center">
                        {subTab === 'workflow' ? (
                          <div className="flex items-center justify-center gap-2">
                            {item.status === 'PENDING_ADMIN' && (
                              <button onClick={() => handleActionClick(item.id, 'PENDING_BENDAHARA')} className="px-3 py-1.5 bg-blue-900 text-blue-100 hover:bg-blue-800 rounded-lg text-xs font-semibold transition-colors">
                                Verifikasi
                              </button>
                            )}
                            {item.status === 'PENDING_BENDAHARA' && (
                              <button onClick={() => handleActionClick(item.id, 'DICAIRKAN')} className="px-3 py-1.5 bg-secondary text-primary hover:bg-secondary-hover rounded-lg text-xs font-bold transition-colors shadow-sm">
                                Cairkan Dana
                              </button>
                            )}
                            <button onClick={() => handleActionClick(item.id, 'DITOLAK')} className="px-3 py-1.5 border border-red-200 text-red-600 hover:bg-red-50 hover:border-red-300 rounded-lg text-xs font-semibold transition-colors">
                              Tolak
                            </button>
                          </div>
                        ) : (
                          <button onClick={() => handleActionClick(item.id, 'delete')} className="p-2 text-slate-400 hover:text-red-500 hover:bg-red-50 border border-transparent hover:border-red-100 rounded-lg transition-all opacity-0 group-hover:opacity-100" title="Hapus">
                            <Trash2 size={16} />
                          </button>
                        )}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
            <Pagination 
              currentPage={currentPage}
              totalItems={displayData.length}
              itemsPerPage={itemsPerPage}
              onPageChange={setCurrentPage}
              onLimitChange={setItemsPerPage}
            />
          </>
        )}
      </div>

      {/* Action Drawer */}
      <Drawer isOpen={isDrawerOpen} onClose={() => setIsDrawerOpen(false)} title="Input Pinjaman Manual" onSubmit={handleSubmit}>
        <div className="space-y-4">
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Pilih Anggota</label>
            <select 
              required value={formData.anggotaId} onChange={e => setFormData({...formData, anggotaId: e.target.value})}
              className="w-full px-4 py-2 bg-white border border-slate-300 rounded-xl outline-none focus:border-primary"
            >
              <option value="" disabled>-- Pilih Anggota --</option>
              {anggotaList.map(a => (
                <option key={a.id} value={a.id}>{a.nip} - {a.namaLengkap}</option>
              ))}
            </select>
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
