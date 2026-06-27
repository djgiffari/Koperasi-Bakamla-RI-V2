import React, { useState, useEffect } from 'react';
import { Plus, Trash2, Wallet, FileText, Check, X, Eye, Search } from 'lucide-react';
import Drawer from '../components/Drawer';
import ConfirmDialog from '../components/ConfirmDialog';
import EmptyState from '../components/EmptyState';
import Pagination from '../components/Pagination';
import { api } from '../lib/api';
import { toast } from '../lib/toast';

const Simpanan: React.FC = () => {
  const [dataList, setDataList] = useState<any[]>([]);
  const [anggotaList, setAnggotaList] = useState<any[]>([]);
  const [masterData, setMasterData] = useState<any[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [simpananTab, setSimpananTab] = useState<string>('Semua');
  const [searchTerm, setSearchTerm] = useState('');
  const [statusFilter, setStatusFilter] = useState('Semua');
  
  // Pagination State
  const [currentPage, setCurrentPage] = useState(1);
  const [itemsPerPage, setItemsPerPage] = useState(10);
  
  const [isDrawerOpen, setIsDrawerOpen] = useState(false);
  const [isConfirmOpen, setIsConfirmOpen] = useState(false);
  const [deleteId, setDeleteId] = useState<number | null>(null);

  const initialForm = { 
    anggotaSearch: '', 
    jenisSimpanan: '', 
    kodeAkun: '', 
    nominal: '', 
    tanggal: '' 
  };
  const [formData, setFormData] = useState(initialForm);
  const [buktiFile, setBuktiFile] = useState<File | null>(null);

  const fetchData = async () => {
    setIsLoading(true);
    try {
      const [simpananData, anggotaData, masterRes] = await Promise.all([
        api.get('/simpanan'),
        api.get('/anggota'),
        api.get('/pengaturan')
      ]);
      setDataList(simpananData);
      setAnggotaList(anggotaData);
      setMasterData(masterRes);
    } catch (error) {
      console.error('Error fetching data:', error);
      toast.error('Gagal mengambil data simpanan.');
    } finally {
      setIsLoading(false);
    }
  };

  useEffect(() => {
    fetchData();
  }, []);

  const handleDeleteClick = (id: number) => {
    setDeleteId(id);
    setIsConfirmOpen(true);
  };

  const confirmDelete = async () => {
    if (!deleteId) return;
    try {
      await api.delete(`/simpanan/${deleteId}`);
      setDataList(dataList.filter(item => item.id !== deleteId));
      setIsConfirmOpen(false);
      setDeleteId(null);
      toast.success('Simpanan berhasil dihapus');
    } catch (error) {
      console.error('Error deleting simpanan:', error);
      toast.error('Gagal menghapus simpanan');
    }
  };

  const handleUpdateStatus = async (id: number, newStatus: string) => {
    try {
      await api.put(`/simpanan/${id}/status`, { status: newStatus });
      toast.success(`Status simpanan diubah menjadi ${newStatus}`);
      fetchData();
    } catch (error) {
      toast.error('Gagal mengubah status simpanan');
    }
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    
    // Parse Anggota ID from search string (Format: "NIP - NamaLengkap")
    const nipMatch = formData.anggotaSearch.split(' - ')[0];
    const selectedAnggota = anggotaList.find(a => a.nip === nipMatch || a.namaLengkap === formData.anggotaSearch);
    
    if (!selectedAnggota) {
      toast.error('Anggota tidak ditemukan, mohon pilih dari daftar');
      return;
    }
    
    try {
      const submitData = new FormData();
      submitData.append('anggotaId', selectedAnggota.id.toString());
      submitData.append('jenisSimpanan', formData.jenisSimpanan);
      submitData.append('kodeAkun', formData.kodeAkun);
      submitData.append('saldo', formData.nominal.replace(/\D/g, ''));
      if (formData.tanggal) submitData.append('tanggal', formData.tanggal);
      if (buktiFile) submitData.append('buktiFile', buktiFile);

      const token = localStorage.getItem('koperasi_token');
      const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:3000/api';
      
      const response = await fetch(`${API_URL}/simpanan`, {
        method: 'POST',
        headers: { 'Authorization': `Bearer ${token}` },
        body: submitData
      });

      if (!response.ok) throw new Error('Gagal menyimpan');
      
      setIsDrawerOpen(false);
      setFormData(initialForm);
      setBuktiFile(null);
      fetchData(); 
      toast.success('Simpanan berhasil dicatat');
    } catch (error) {
      console.error('Error saving simpanan:', error);
      toast.error('Gagal menyimpan data simpanan');
    }
  };

  // Extract unique Jenis Simpanan from master data
  const jenisOptions = masterData.filter(d => d.kategori === 'JENIS_SIMPANAN');
  const akunOptions = masterData.filter(d => d.kategori === 'KODE_AKUN');
  
  // Extract all unique jenis from current data to build the tabs
  const availableTabs = ['Semua', ...Array.from(new Set(dataList.map(item => item.jenisSimpanan)))];
  
  const filteredData = dataList.filter(item => {
    const matchTab = simpananTab === 'Semua' || item.jenisSimpanan === simpananTab;
    const searchStr = (item.anggota?.namaLengkap || '') + (item.anggota?.nip || '') + (item.kodeInvoice || '');
    const matchSearch = searchStr.toLowerCase().includes(searchTerm.toLowerCase());
    const matchStatus = statusFilter === 'Semua' || item.status === statusFilter;
    return matchTab && matchSearch && matchStatus;
  });

  const paginatedData = filteredData.slice((currentPage - 1) * itemsPerPage, currentPage * itemsPerPage);

  const getStatusBadge = (status: string) => {
    switch (status) {
      case 'DISETUJUI': return <span className="px-2.5 py-1 rounded-md text-[10px] font-bold uppercase tracking-wider bg-emerald-100 text-emerald-700">Disetujui</span>;
      case 'DITOLAK': return <span className="px-2.5 py-1 rounded-md text-[10px] font-bold uppercase tracking-wider bg-red-100 text-red-700">Ditolak</span>;
      default: return <span className="px-2.5 py-1 rounded-md text-[10px] font-bold uppercase tracking-wider bg-amber-100 text-amber-700">Menunggu</span>;
    }
  };

  const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:3000/api';
  const BASE_URL = API_URL.replace('/api', '');

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
        <div>
          <h1 className="text-3xl font-bold text-primary font-outfit flex items-center gap-3">
            <Wallet size={32} className="text-secondary" />
            Pencatatan Simpanan
          </h1>
          <p className="text-slate-500 mt-1">Daftar pencatatan kas simpanan dan invoice transaksi.</p>
        </div>
        
        <div className="flex flex-wrap items-center gap-2">
          <div className="relative w-64">
            <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
              <Search size={16} className="text-slate-400" />
            </div>
            <input
              type="text"
              placeholder="Cari nama, NIP, invoice..."
              className="w-full pl-10 pr-4 py-2.5 bg-white/70 backdrop-blur border border-white/50 shadow-sm rounded-xl text-sm focus:ring-2 focus:ring-secondary focus:border-secondary outline-none"
              value={searchTerm}
              onChange={(e) => { setSearchTerm(e.target.value); setCurrentPage(1); }}
            />
          </div>

          <select 
            className="px-4 py-2.5 bg-white/70 backdrop-blur border border-white/50 shadow-sm text-slate-600 rounded-xl text-sm font-semibold focus:outline-none focus:ring-2 focus:ring-secondary"
            value={statusFilter}
            onChange={(e) => { setStatusFilter(e.target.value); setCurrentPage(1); }}
          >
            <option value="Semua">Semua Status</option>
            <option value="DISETUJUI">Disetujui</option>
            <option value="MENUNGGU_PERSETUJUAN">Menunggu</option>
            <option value="DITOLAK">Ditolak</option>
          </select>

          <button onClick={() => { setFormData(initialForm); setBuktiFile(null); setIsDrawerOpen(true); }} className="px-4 py-2.5 bg-primary text-white rounded-xl text-sm font-semibold flex items-center gap-2 shadow-lg hover:shadow-xl hover:bg-primary/90 transition-all">
            <Plus size={16} /> Tambah Simpanan
          </button>
          <button className="px-4 py-2.5 bg-white/80 border border-white/50 shadow-sm text-primary rounded-xl text-sm font-semibold flex items-center gap-2 hover:bg-slate-50 transition-colors">
            <FileText size={16} /> Laporan
          </button>
        </div>
      </div>

      <div className="glass-panel overflow-hidden">
        {/* Tab Selection */}
        <div className="flex overflow-x-auto border-b border-slate-200/50 bg-white/30 scrollbar-hide">
          {availableTabs.map((tab) => (
            <button
              key={tab}
              onClick={() => setSimpananTab(tab)}
              className={`whitespace-nowrap px-6 py-4 text-sm font-bold uppercase transition-all relative ${simpananTab === tab ? 'text-primary' : 'text-slate-400 hover:text-slate-600 hover:bg-white/20'}`}
            >
              {tab}
              {simpananTab === tab && (
                <div className="absolute bottom-0 left-0 w-full h-0.5 bg-secondary shadow-[0_0_8px_rgba(212,175,55,0.8)]"></div>
              )}
            </button>
          ))}
        </div>

        {isLoading ? (
          <div className="flex justify-center py-12">
            <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-primary"></div>
          </div>
        ) : filteredData.length === 0 ? (
          <div className="py-12">
            <EmptyState icon={Wallet} title="Belum ada transaksi" description={`Tidak ada riwayat transaksi simpanan ${simpananTab} saat ini.`} actionText="Catat Simpanan" onAction={() => setIsDrawerOpen(true)} />
          </div>
        ) : (
          <>
            <div className="overflow-x-auto">
              <table className="w-full text-left border-collapse">
                <thead>
                  <tr className="bg-primary/5 text-primary text-xs uppercase tracking-wider border-b border-primary/10">
                    <th className="px-4 py-4 font-bold">No</th>
                    <th className="px-4 py-4 font-bold">Invoice & Tanggal</th>
                    <th className="px-4 py-4 font-bold">Anggota</th>
                    <th className="px-4 py-4 font-bold">Jenis / Akun</th>
                    <th className="px-4 py-4 font-bold">Nominal</th>
                    <th className="px-4 py-4 font-bold">Status</th>
                    <th className="px-4 py-4 font-bold">Waktu Dibuat</th>
                    <th className="px-4 py-4 font-bold text-center">Aksi</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-slate-200/60 text-sm">
                  {paginatedData.map((item, index) => (
                    <tr key={item.id} className="hover:bg-white/60 transition-colors align-top group">
                      <td className="px-4 py-4 font-semibold text-slate-500">{(currentPage - 1) * itemsPerPage + index + 1}</td>
                      <td className="px-4 py-4">
                        <div className="font-bold text-primary font-mono text-xs">{item.kodeInvoice || '-'}</div>
                        <div className="text-slate-500 text-xs mt-1">{new Date(item.createdAt).toLocaleDateString('id-ID')}</div>
                      </td>
                      <td className="px-4 py-4">
                        <div className="font-semibold text-slate-800">{item.anggota?.namaLengkap || '-'}</div>
                        <div className="text-slate-500 text-xs font-mono">{item.anggota?.nip || '-'}</div>
                      </td>
                      <td className="px-4 py-4 text-slate-600">
                        <div className="font-semibold">{item.jenisSimpanan}</div>
                        <div className="text-xs text-slate-400 mt-1">{item.kodeAkun || '-'}</div>
                      </td>
                      <td className="px-4 py-4 font-bold text-emerald-600">Rp {item.saldo.toLocaleString('id-ID')}</td>
                      <td className="px-4 py-4">
                        <div className="flex flex-col items-start gap-1.5">
                          {getStatusBadge(item.status)}
                          {item.buktiUrl && (
                            <a href={`${BASE_URL}${item.buktiUrl}`} target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:text-blue-800 hover:underline text-xs flex items-center gap-1 mt-1 font-medium">
                              <Eye size={14} /> Lihat Bukti
                            </a>
                          )}
                        </div>
                      </td>
                      <td className="px-4 py-4 text-slate-500 text-xs">
                        {new Date(item.createdAt).toLocaleString('id-ID')}
                      </td>
                      <td className="px-4 py-4">
                        <div className="flex items-center justify-center gap-2">
                          {item.status === 'MENUNGGU_PERSETUJUAN' && (
                            <>
                              <button onClick={() => handleUpdateStatus(item.id, 'DISETUJUI')} className="p-2 text-emerald-600 hover:bg-emerald-50 border border-transparent hover:border-emerald-100 rounded-lg transition-all" title="Setujui"><Check size={16} /></button>
                              <button onClick={() => handleUpdateStatus(item.id, 'DITOLAK')} className="p-2 text-red-600 hover:bg-red-50 border border-transparent hover:border-red-100 rounded-lg transition-all" title="Tolak"><X size={16} /></button>
                            </>
                          )}
                          <button onClick={() => handleDeleteClick(item.id)} className="p-2 text-slate-400 hover:text-red-500 hover:bg-red-50 border border-transparent hover:border-red-100 rounded-lg transition-all" title="Hapus">
                            <Trash2 size={16} />
                          </button>
                        </div>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
            <Pagination 
              currentPage={currentPage}
              totalItems={filteredData.length}
              itemsPerPage={itemsPerPage}
              onPageChange={setCurrentPage}
              onLimitChange={setItemsPerPage}
            />
          </>
        )}
      </div>

      {/* Action Drawer */}
      <Drawer isOpen={isDrawerOpen} onClose={() => setIsDrawerOpen(false)} title="Catat Simpanan Anggota" onSubmit={handleSubmit}>
        <div className="space-y-4">
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Jenis Simpanan</label>
            <input 
              list="jenis-list" required value={formData.jenisSimpanan} onChange={e => setFormData({...formData, jenisSimpanan: e.target.value})}
              className="w-full px-4 py-2 bg-white border border-slate-300 rounded-xl outline-none focus:border-primary text-sm" placeholder="Ketik atau pilih jenis..."
            />
            <datalist id="jenis-list">
              {jenisOptions.map(o => <option key={o.id} value={o.nilai} />)}
            </datalist>
          </div>
          
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Anggota</label>
            <input 
              list="anggota-list" required value={formData.anggotaSearch} onChange={e => setFormData({...formData, anggotaSearch: e.target.value})}
              className="w-full px-4 py-2 bg-white border border-slate-300 rounded-xl outline-none focus:border-primary text-sm" placeholder="Cari NIP atau Nama Anggota..."
            />
            <datalist id="anggota-list">
              {anggotaList.map(a => <option key={a.id} value={`${a.nip} - ${a.namaLengkap}`} />)}
            </datalist>
          </div>
          
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Kode Akun / Jurnal</label>
            <input 
              list="akun-list" value={formData.kodeAkun} onChange={e => setFormData({...formData, kodeAkun: e.target.value})}
              className="w-full px-4 py-2 bg-white border border-slate-300 rounded-xl outline-none focus:border-primary text-sm" placeholder="Contoh: 111.01 - Kas Tunai"
            />
            <datalist id="akun-list">
              {akunOptions.map(o => <option key={o.id} value={o.nilai} />)}
            </datalist>
          </div>
          
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Jumlah Nominal (Rp)</label>
            <input 
              type="text" required value={formData.nominal} onChange={e => setFormData({...formData, nominal: e.target.value})}
              className="w-full px-4 py-2 bg-white border border-slate-300 rounded-xl outline-none focus:border-primary font-mono text-sm" placeholder="500000"
            />
          </div>
          
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Waktu Transaksi</label>
            <input 
              type="datetime-local" required value={formData.tanggal} onChange={e => setFormData({...formData, tanggal: e.target.value})}
              className="w-full px-4 py-2 bg-white border border-slate-300 rounded-xl outline-none focus:border-primary text-sm"
            />
          </div>
          
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Bukti Dukung (PDF / Gambar)</label>
            <input 
              type="file" accept="image/*,.pdf" onChange={e => setBuktiFile(e.target.files ? e.target.files[0] : null)}
              className="w-full px-4 py-2 bg-slate-50 border border-slate-300 rounded-xl text-sm focus:outline-none"
            />
          </div>
        </div>
      </Drawer>

      <ConfirmDialog isOpen={isConfirmOpen} onClose={() => setIsConfirmOpen(false)} onConfirm={confirmDelete} title="Hapus Data Simpanan" message="Yakin ingin menghapus catatan simpanan ini secara permanen?" />
    </div>
  );
};

export default Simpanan;
