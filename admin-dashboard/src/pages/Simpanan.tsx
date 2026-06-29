import React, { useState, useEffect } from 'react';
import { Plus, Trash2, Wallet, FileText, Check, X, Eye, Search, Pencil } from 'lucide-react';
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

  const [isEditDrawerOpen, setIsEditDrawerOpen] = useState(false);
  const [editId, setEditId] = useState<number | null>(null);

  const [isLaporanModalOpen, setIsLaporanModalOpen] = useState(false);
  const [laporanConfig, setLaporanConfig] = useState({ type: 'all', startDate: '', endDate: '', sortBy: 'tanggal' });
  const [laporanData, setLaporanData] = useState<any>(null);
  const [isPrinting, setIsPrinting] = useState(false);

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

  const handleEditClick = (item: any) => {
    setEditId(item.id);
    const dateStr = new Date(item.createdAt).toISOString().slice(0, 16);
    setFormData({
      anggotaSearch: `${item.anggota?.nip || ''} - ${item.anggota?.namaLengkap || ''}`,
      jenisSimpanan: item.jenisSimpanan,
      kodeAkun: item.kodeAkun || '',
      nominal: item.saldo.toString(),
      tanggal: dateStr
    });
    setIsEditDrawerOpen(true);
  };

  const handleCetakLaporan = async () => {
    try {
      const query = new URLSearchParams();
      if (laporanConfig.type === 'range') {
        query.append('startDate', laporanConfig.startDate);
        query.append('endDate', laporanConfig.endDate);
      }
      query.append('sortBy', laporanConfig.sortBy);
      
      const res = await api.get(`/simpanan/laporan/data?${query.toString()}`);
      setLaporanData(res);
      setIsLaporanModalOpen(false);
      setIsPrinting(true);
      setTimeout(() => {
        window.print();
        setIsPrinting(false);
      }, 500);
    } catch (error) {
      toast.error('Gagal mengambil data laporan');
    }
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

  const handleEditSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!editId) return;

    try {
      const submitData = new FormData();
      submitData.append('jenisSimpanan', formData.jenisSimpanan);
      submitData.append('keterangan', formData.kodeAkun);
      submitData.append('nominal', formData.nominal.replace(/\D/g, ''));
      if (formData.tanggal) submitData.append('tanggal', formData.tanggal);
      if (buktiFile) submitData.append('buktiFile', buktiFile);

      const token = localStorage.getItem('koperasi_token');
      const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:3000/api';
      
      const response = await fetch(`${API_URL}/simpanan/${editId}`, {
        method: 'PUT',
        headers: { 'Authorization': `Bearer ${token}` },
        body: submitData
      });

      if (!response.ok) throw new Error('Gagal mengupdate');
      
      setIsEditDrawerOpen(false);
      setFormData(initialForm);
      setBuktiFile(null);
      setEditId(null);
      fetchData(); 
      toast.success('Simpanan berhasil diupdate');
    } catch (error) {
      console.error('Error updating simpanan:', error);
      toast.error('Gagal mengupdate data simpanan');
    }
  };

  // Extract unique Jenis Simpanan from master data
  const jenisOptions = masterData.filter(d => d.kategori === 'JENIS_SIMPANAN');
  const akunOptions = masterData.filter(d => d.kategori === 'KODE_AKUN');
  
  // Extract all unique jenis from current data to build the tabs
  const availableTabs = ['Semua', ...Array.from(new Set(dataList.map(item => item.jenisSimpanan)))];
  
  const filteredData = dataList.filter(item => {
    const matchSearch = item.anggota?.namaLengkap?.toLowerCase().includes(searchTerm.toLowerCase()) || 
                       item.anggota?.nip?.toLowerCase().includes(searchTerm.toLowerCase()) ||
                       item.kodeInvoice?.toLowerCase().includes(searchTerm.toLowerCase());
                       
    if (simpananTab === 'Verifikasi') {
      return matchSearch && item.status === 'MENUNGGU_VERIFIKASI';
    }
    
    const matchTab = simpananTab === 'Semua' ? item.status !== 'MENUNGGU_VERIFIKASI' : item.jenisSimpanan === simpananTab;
    const matchStatus = statusFilter === 'Semua' ? true : item.status === statusFilter;
    
    return matchSearch && matchTab && matchStatus;
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

  if (isPrinting && laporanData) {
    return (
      <div className="bg-white min-h-screen text-black p-8">
        <div className="max-w-4xl mx-auto">
          <div className="text-center mb-8 pb-4 border-b-2 border-black">
            <h1 className="text-2xl font-bold uppercase tracking-wider">Koperasi Bakamla RI</h1>
            <p className="text-sm mt-1">Laporan Riwayat Transaksi Simpanan Anggota</p>
            <p className="text-xs text-gray-500 mt-1">
              {laporanConfig.type === 'range' ? `Periode: ${laporanConfig.startDate} s/d ${laporanConfig.endDate}` : 'Periode: Semua Waktu'}
            </p>
          </div>

          <div className="mb-8 p-4 border border-gray-300 rounded-lg bg-gray-50">
            <h2 className="text-lg font-bold mb-3 border-b border-gray-200 pb-2">Ringkasan Total Simpanan</h2>
            <div className="grid grid-cols-4 gap-4 text-sm">
              <div>
                <div className="text-gray-500">Total Simpanan Pokok</div>
                <div className="font-bold text-lg">Rp {laporanData.summary.totalPokok.toLocaleString('id-ID')}</div>
              </div>
              <div>
                <div className="text-gray-500">Total Simpanan Wajib</div>
                <div className="font-bold text-lg">Rp {laporanData.summary.totalWajib.toLocaleString('id-ID')}</div>
              </div>
              <div>
                <div className="text-gray-500">Total Simpanan Sukarela</div>
                <div className="font-bold text-lg">Rp {laporanData.summary.totalSukarela.toLocaleString('id-ID')}</div>
              </div>
              <div className="border-l border-gray-300 pl-4">
                <div className="text-gray-500 font-bold">TOTAL KESELURUHAN</div>
                <div className="font-bold text-xl text-black">Rp {laporanData.summary.totalSemua.toLocaleString('id-ID')}</div>
              </div>
            </div>
          </div>

          <table className="w-full text-sm border-collapse border border-gray-300">
            <thead>
              <tr className="bg-gray-100">
                <th className="border border-gray-300 p-2 text-left">No</th>
                <th className="border border-gray-300 p-2 text-left">Tanggal</th>
                <th className="border border-gray-300 p-2 text-left">Nama Anggota</th>
                <th className="border border-gray-300 p-2 text-left">Jenis Simpanan</th>
                <th className="border border-gray-300 p-2 text-right">Mutasi Nominal</th>
              </tr>
            </thead>
            <tbody>
              {laporanData.data.map((item: any, idx: number) => (
                <tr key={item.id}>
                  <td className="border border-gray-300 p-2 text-center">{idx + 1}</td>
                  <td className="border border-gray-300 p-2">{new Date(item.createdAt).toLocaleDateString('id-ID')}</td>
                  <td className="border border-gray-300 p-2">{item.anggota?.namaLengkap || '-'}</td>
                  <td className="border border-gray-300 p-2">{item.jenisSimpanan}</td>
                  <td className="border border-gray-300 p-2 text-right font-mono">
                    {item.jenisMutasi === 'PENARIKAN' ? '-' : ''}Rp {item.saldo.toLocaleString('id-ID')}
                  </td>
                </tr>
              ))}
              {laporanData.data.length === 0 && (
                <tr>
                  <td colSpan={5} className="border border-gray-300 p-4 text-center text-gray-500">Tidak ada data transaksi pada periode ini.</td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </div>
    );
  }

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
            <option value="MENUNGGU_VERIFIKASI">Menunggu</option>
            <option value="DITOLAK">Ditolak</option>
          </select>

          <button onClick={() => { setFormData(initialForm); setBuktiFile(null); setIsDrawerOpen(true); }} className="px-4 py-2.5 bg-primary text-white rounded-xl text-sm font-semibold flex items-center gap-2 shadow-lg hover:shadow-xl hover:bg-primary/90 transition-all">
            <Plus size={16} /> Tambah Simpanan
          </button>
          <button onClick={() => setIsLaporanModalOpen(true)} className="bg-slate-100 text-slate-700 hover:bg-slate-200 px-5 py-2.5 rounded-xl font-semibold flex items-center gap-2 transition-all">
            <FileText size={16} /> Laporan
          </button>
        </div>
      </div>

      <div className="glass-panel overflow-hidden">
        {/* Tab Selection */}
        <div className="flex overflow-x-auto no-scrollbar">
          {['Semua', 'POKOK', 'WAJIB', 'SUKARELA', 'Verifikasi'].map(tab => (
            <button
              key={tab}
              onClick={() => { setSimpananTab(tab); setCurrentPage(1); }}
              className={`px-6 py-4 text-sm font-bold transition-all border-b-2 flex items-center gap-2 whitespace-nowrap ${
                simpananTab === tab 
                  ? tab === 'Verifikasi' ? 'text-secondary border-secondary bg-secondary/5' : 'text-primary border-primary bg-primary/5'
                  : 'text-slate-400 border-transparent hover:text-primary hover:bg-slate-50'
              }`}
            >
              {tab === 'Verifikasi' ? 'Verifikasi' : tab}
              {tab === 'Verifikasi' && dataList.filter(d => d.status === 'MENUNGGU_VERIFIKASI').length > 0 && (
                <span className="bg-red-500 text-white text-[10px] px-2 py-0.5 rounded-full">
                  {dataList.filter(d => d.status === 'MENUNGGU_VERIFIKASI').length}
                </span>
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
                          {item.status === 'MENUNGGU_VERIFIKASI' && (
                            <>
                              <button onClick={() => handleUpdateStatus(item.id, 'DISETUJUI')} className="p-2 text-emerald-600 hover:bg-emerald-50 border border-transparent hover:border-emerald-100 rounded-lg transition-all" title="Setujui"><Check size={16} /></button>
                              <button onClick={() => handleUpdateStatus(item.id, 'DITOLAK')} className="p-2 text-red-600 hover:bg-red-50 border border-transparent hover:border-red-100 rounded-lg transition-all" title="Tolak"><X size={16} /></button>
                            </>
                          )}
                          <button onClick={() => handleEditClick(item)} className="p-2 text-slate-400 hover:text-blue-500 hover:bg-blue-50 border border-transparent hover:border-blue-100 rounded-lg transition-all" title="Edit">
                            <Pencil size={16} />
                          </button>
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
              type="text" required value={formData.nominal} onChange={e => { let val = e.target.value.replace(/\D/g, ''); setFormData({...formData, nominal: val ? parseInt(val).toLocaleString('id-ID') : ''}); }}
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
      
      {/* Edit Drawer */}
      <Drawer isOpen={isEditDrawerOpen} onClose={() => { setIsEditDrawerOpen(false); setEditId(null); setFormData(initialForm); }} title="Edit Simpanan Anggota" onSubmit={handleEditSubmit}>
        <div className="space-y-4">
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Anggota (Tidak bisa diubah)</label>
            <input 
              disabled value={formData.anggotaSearch}
              className="w-full px-4 py-2 bg-slate-100 border border-slate-300 rounded-xl outline-none text-sm cursor-not-allowed" 
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Jenis Simpanan</label>
            <input 
              list="jenis-list" required value={formData.jenisSimpanan} onChange={e => setFormData({...formData, jenisSimpanan: e.target.value})}
              className="w-full px-4 py-2 bg-white border border-slate-300 rounded-xl outline-none focus:border-primary text-sm" 
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Kode Akun / Jurnal</label>
            <input 
              list="akun-list" value={formData.kodeAkun} onChange={e => setFormData({...formData, kodeAkun: e.target.value})}
              className="w-full px-4 py-2 bg-white border border-slate-300 rounded-xl outline-none focus:border-primary text-sm"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Jumlah Nominal (Rp)</label>
            <input 
              type="text" required value={formData.nominal} onChange={e => { let val = e.target.value.replace(/\D/g, ''); setFormData({...formData, nominal: val ? parseInt(val).toLocaleString('id-ID') : ''}); }}
              className="w-full px-4 py-2 bg-white border border-slate-300 rounded-xl outline-none focus:border-primary font-mono text-sm"
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
            <label className="block text-sm font-medium text-slate-700 mb-1">Bukti Dukung Baru (Opsional)</label>
            <input 
              type="file" accept="image/*,.pdf" onChange={e => setBuktiFile(e.target.files ? e.target.files[0] : null)}
              className="w-full px-4 py-2 bg-slate-50 border border-slate-300 rounded-xl text-sm focus:outline-none"
            />
          </div>
        </div>
      </Drawer>

      {/* Laporan Modal */}
      {isLaporanModalOpen && (
        <div className="fixed inset-0 bg-slate-900/50 backdrop-blur-sm z-50 flex items-center justify-center p-4">
          <div className="bg-white rounded-2xl w-full max-w-md overflow-hidden shadow-2xl">
            <div className="p-6 border-b border-slate-100 flex justify-between items-center bg-slate-50">
              <h2 className="text-xl font-bold text-slate-800">Cetak Laporan Simpanan</h2>
              <button onClick={() => setIsLaporanModalOpen(false)} className="text-slate-400 hover:text-slate-600 bg-white p-1 rounded-full shadow-sm">
                <X size={20} />
              </button>
            </div>
            <div className="p-6 space-y-4">
              <div>
                <label className="block text-sm font-semibold text-slate-700 mb-2">Periode Data</label>
                <div className="flex gap-4">
                  <label className="flex items-center gap-2 cursor-pointer">
                    <input type="radio" checked={laporanConfig.type === 'all'} onChange={() => setLaporanConfig({...laporanConfig, type: 'all'})} className="accent-primary" />
                    <span className="text-sm">Semua Waktu</span>
                  </label>
                  <label className="flex items-center gap-2 cursor-pointer">
                    <input type="radio" checked={laporanConfig.type === 'range'} onChange={() => setLaporanConfig({...laporanConfig, type: 'range'})} className="accent-primary" />
                    <span className="text-sm">Pilih Tanggal</span>
                  </label>
                </div>
              </div>
              
              {laporanConfig.type === 'range' && (
                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <label className="block text-xs font-medium text-slate-500 mb-1">Dari Tanggal</label>
                    <input type="date" value={laporanConfig.startDate} onChange={e => setLaporanConfig({...laporanConfig, startDate: e.target.value})} className="w-full p-2 border border-slate-200 rounded-lg text-sm outline-none focus:border-primary" />
                  </div>
                  <div>
                    <label className="block text-xs font-medium text-slate-500 mb-1">Sampai Tanggal</label>
                    <input type="date" value={laporanConfig.endDate} onChange={e => setLaporanConfig({...laporanConfig, endDate: e.target.value})} className="w-full p-2 border border-slate-200 rounded-lg text-sm outline-none focus:border-primary" />
                  </div>
                </div>
              )}

              <div>
                <label className="block text-sm font-semibold text-slate-700 mb-2">Urutkan Berdasarkan</label>
                <select value={laporanConfig.sortBy} onChange={e => setLaporanConfig({...laporanConfig, sortBy: e.target.value})} className="w-full p-2 border border-slate-200 rounded-lg text-sm outline-none focus:border-primary">
                  <option value="tanggal">Waktu Transaksi (Terbaru)</option>
                  <option value="nama">Nama Anggota (A-Z)</option>
                </select>
              </div>
            </div>
            <div className="p-4 bg-slate-50 border-t border-slate-100 flex justify-end gap-3">
              <button onClick={() => setIsLaporanModalOpen(false)} className="px-4 py-2 text-slate-600 font-medium hover:bg-slate-200 rounded-lg transition-colors text-sm">Batal</button>
              <button onClick={handleCetakLaporan} className="px-4 py-2 bg-primary text-white font-bold rounded-lg shadow hover:bg-secondary transition-colors text-sm flex items-center gap-2">
                <FileText size={16} /> Cetak Laporan
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

export default Simpanan;
