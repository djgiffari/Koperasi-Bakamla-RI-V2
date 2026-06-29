import React, { useState, useEffect } from 'react';
import { Users, Search, Edit2, Trash2, Plus, Upload, Download, Eye } from 'lucide-react';
import ConfirmDialog from '../components/ConfirmDialog';
import Drawer from '../components/Drawer';
import EmptyState from '../components/EmptyState';
import Pagination from '../components/Pagination';
import { api } from '../lib/api';
import { toast } from '../lib/toast';

const Anggota: React.FC = () => {
  const [anggotaList, setAnggotaList] = useState<any[]>([]);
  const [masterData, setMasterData] = useState<any[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState('');
  const [statusFilter, setStatusFilter] = useState('Semua');
  
  // Pagination State
  const [currentPage, setCurrentPage] = useState(1);
  const [itemsPerPage, setItemsPerPage] = useState(10);
  
  // Tab State
  const [activeTab, setActiveTab] = useState<'semua' | 'menunggu'>('semua');
  
  // Drawer State
  const [isDrawerOpen, setIsDrawerOpen] = useState(false);
  const [editingId, setEditingId] = useState<string | null>(null);
  
  // Dialog State
  const [isConfirmOpen, setIsConfirmOpen] = useState(false);
  const [deleteId, setDeleteId] = useState<string | null>(null);

  // Form State
  const initialForm = { 
    namaLengkap: '', tempatLahir: '', tanggalLahir: '', nip: '', pangkat: '', unitKerja: '', 
    alamatKantor: '', noKtp: '', alamatRumah: '', noHp: '', noRekening: '', fcSkStatus: 'belum' 
  };
  const [formData, setFormData] = useState(initialForm);
  const [fcSkFile, setFcSkFile] = useState<File | null>(null);

  // Fetch data
  const fetchData = async () => {
    setIsLoading(true);
    try {
      const [anggotaData, masterRes] = await Promise.all([
        api.get('/anggota'),
        api.get('/pengaturan')
      ]);
      setAnggotaList(anggotaData);
      setMasterData(masterRes);
    } catch (error) {
      console.error('Error fetching data:', error);
    } finally {
      setIsLoading(false);
    }
  };

  useEffect(() => {
    fetchData();
  }, []);

  // Handlers
  const handleOpenAdd = () => {
    setEditingId(null);
    setFormData(initialForm);
    setFcSkFile(null);
    setIsDrawerOpen(true);
  };

  const handleOpenEdit = (anggota: any) => {
    setEditingId(anggota.id);
    setFormData({ 
      namaLengkap: anggota.namaLengkap || '', 
      tempatLahir: anggota.tempatLahir || '', 
      tanggalLahir: anggota.tanggalLahir ? anggota.tanggalLahir.split('T')[0] : '', 
      nip: anggota.nip || '', 
      pangkat: anggota.pangkat || '', 
      unitKerja: anggota.unitKerja || '', 
      alamatKantor: anggota.alamatKantor || '', 
      noKtp: anggota.noKtp || '', 
      alamatRumah: anggota.alamatRumah || '', 
      noHp: anggota.noHp || '', 
      noRekening: anggota.noRekening || anggota.rekeningBni || '', 
      fcSkStatus: anggota.fcSkStatus || 'belum' 
    });
    setFcSkFile(null);
    setIsDrawerOpen(true);
  };

  const handleDeleteClick = (id: string) => {
    setDeleteId(id);
    setIsConfirmOpen(true);
  };

  const confirmDelete = async () => {
    if (!deleteId) return;
    try {
      await api.delete(`/anggota/${deleteId}`);
      setAnggotaList(anggotaList.filter(a => a.id !== deleteId));
      setIsConfirmOpen(false);
      setDeleteId(null);
      toast.success('Anggota berhasil dihapus');
    } catch (error) {
      console.error('Error deleting anggota:', error);
      toast.error('Gagal menghapus anggota');
    }
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    try {
      const submitData = new FormData();
      Object.entries(formData).forEach(([key, value]) => {
        if (value) submitData.append(key, value);
      });
      if (fcSkFile) {
        submitData.append('fcSkFile', fcSkFile);
      }

      const token = localStorage.getItem('koperasi_token');
      const fetchOpts = {
        method: editingId ? 'PUT' : 'POST',
        headers: {
          'Authorization': `Bearer ${token}`
        },
        body: submitData
      };

      const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:3000/api';
      const response = await fetch(`${API_URL}/anggota${editingId ? `/${editingId}` : ''}`, fetchOpts);

      if (!response.ok) {
        throw new Error('Gagal menyimpan data');
      }
      
      setIsDrawerOpen(false);
      fetchData();
      toast.success('Anggota berhasil disimpan');
    } catch (error) {
      console.error('Error saving anggota:', error);
      toast.error('Gagal menyimpan data anggota');
    }
  };

  const handleApprove = async (id: string) => {
    try {
      await api.put(`/anggota/${id}/status`, { status: 'AKTIF' });
      toast.success('Pendaftaran anggota berhasil disetujui');
      fetchData();
    } catch (error) {
      toast.error('Gagal menyetujui anggota');
    }
  };

  const filteredData = anggotaList.filter(a => {
    const matchSearch = (a.namaLengkap || '').toLowerCase().includes(searchTerm.toLowerCase()) || 
                        (a.nip || '').toLowerCase().includes(searchTerm.toLowerCase());
    
    if (activeTab === 'menunggu') {
      return matchSearch && a.status === 'MENUNGGU_PERSETUJUAN';
    }
    
    const matchStatus = statusFilter === 'Semua' ? a.status !== 'MENUNGGU_PERSETUJUAN' : a.status === statusFilter;
    return matchSearch && matchStatus;
  });
  
  const paginatedData = filteredData.slice((currentPage - 1) * itemsPerPage, currentPage * itemsPerPage);

  const pangkatOptions = masterData.filter(d => d.kategori === 'PANGKAT');
  const unitKerjaOptions = masterData.filter(d => d.kategori === 'UNIT_KERJA');

  const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:3000/api';
  const BASE_URL = API_URL.replace('/api', '');

  const handleResetDevice = async (id: string) => {
    if (!window.confirm('Yakin ingin mereset ikatan perangkat anggota ini? Anggota akan dapat login dari perangkat baru setelah ini.')) return;
    try {
      await api.put(`/anggota/${id}/reset-device`, {});
      toast.success('Perangkat berhasil direset');
      fetchData();
    } catch (error) {
      toast.error('Gagal mereset perangkat');
    }
  };

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex flex-col xl:flex-row justify-between items-start xl:items-center gap-4">
        <div>
          <h1 className="text-3xl font-bold text-primary font-outfit flex items-center gap-3">
            <Users size={32} className="text-secondary" />
            Master Data Anggota
          </h1>
          <p className="text-slate-500 mt-1">Kelola data keanggotaan Koperasi Bakamla RI.</p>
        </div>
        
        <div className="flex flex-wrap items-center gap-2">
          <div className="relative w-64 mr-2">
            <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
              <Search size={16} className="text-slate-400" />
            </div>
            <input
              type="text"
              placeholder="Cari nama atau NIP..."
              className="w-full pl-10 pr-4 py-2.5 bg-white/70 backdrop-blur border border-white/50 shadow-sm rounded-xl text-sm focus:ring-2 focus:ring-secondary focus:border-secondary outline-none"
              value={searchTerm}
              onChange={(e) => { setSearchTerm(e.target.value); setCurrentPage(1); }}
            />
          </div>
          
          <select 
            className="px-4 py-2.5 bg-white/70 backdrop-blur border border-white/50 shadow-sm text-slate-600 rounded-xl text-sm font-semibold focus:outline-none focus:ring-2 focus:ring-secondary mr-2"
            value={statusFilter}
            onChange={(e) => { setStatusFilter(e.target.value); setCurrentPage(1); }}
          >
            <option value="Semua">Semua Status</option>
            <option value="AKTIF">Aktif</option>
            <option value="NONAKTIF">Non-Aktif</option>
            <option value="KELUAR">Keluar</option>
          </select>
          
          <button onClick={handleOpenAdd} className="px-4 py-2.5 bg-primary text-white rounded-xl text-sm font-semibold flex items-center gap-2 shadow-lg hover:shadow-xl hover:bg-primary/90 transition-all">
            <Plus size={16} /> Tambah Baru
          </button>
          
          <button onClick={() => toast.info('Silakan pilih file CSV/Excel untuk diimpor.')} className="px-4 py-2.5 bg-white/80 border border-white/50 shadow-sm text-primary rounded-xl text-sm font-semibold flex items-center gap-2 hover:bg-slate-50 transition-colors">
            <Upload size={18} /> Impor
          </button>
          
          <button onClick={() => toast.info('Mengekspor data ke CSV/Excel...')} className="px-4 py-2 bg-white/80 border border-white/50 shadow-sm text-primary rounded-xl text-sm font-semibold flex items-center gap-2 hover:bg-slate-50 transition-colors">
            <Download size={16} /> Ekspor
          </button>
        </div>
      </div>

      {/* Main Content */}
      {isLoading ? (
        <div className="flex justify-center py-12">
          <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-primary"></div>
        </div>
      ) : anggotaList.length === 0 ? (
        <EmptyState 
          icon={Users} title="Belum ada anggota terdaftar" description="Data anggota koperasi akan ditampilkan di sini." actionText="Tambah Anggota Baru" onAction={handleOpenAdd}
        />
      ) : (
        <div className="glass-panel overflow-hidden">
          {/* Tabs */}
          <div className="flex border-b border-slate-200/60">
            <button 
              onClick={() => { setActiveTab('semua'); setCurrentPage(1); }} 
              className={`px-6 py-4 text-sm font-bold transition-all border-b-2 ${activeTab === 'semua' ? 'text-primary border-primary bg-primary/5' : 'text-slate-500 border-transparent hover:text-primary hover:bg-primary/5'}`}
            >
              Data Anggota
            </button>
            <button 
              onClick={() => { setActiveTab('menunggu'); setCurrentPage(1); }} 
              className={`px-6 py-4 text-sm font-bold transition-all border-b-2 flex items-center gap-2 ${activeTab === 'menunggu' ? 'text-secondary border-secondary bg-secondary/5' : 'text-slate-500 border-transparent hover:text-secondary hover:bg-secondary/5'}`}
            >
              Menunggu Konfirmasi
              {anggotaList.filter(a => a.status === 'MENUNGGU_PERSETUJUAN').length > 0 && (
                <span className="bg-red-500 text-white text-[10px] px-2 py-0.5 rounded-full">
                  {anggotaList.filter(a => a.status === 'MENUNGGU_PERSETUJUAN').length}
                </span>
              )}
            </button>
          </div>

          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="bg-primary/5 text-primary text-xs uppercase tracking-wider border-b border-primary/10">
                  <th className="px-3 py-4 font-bold">No</th>
                  <th className="px-4 py-4 font-bold min-w-[200px]">Nama<br/>NIP<br/>Pangkat</th>
                  <th className="px-4 py-4 font-bold min-w-[150px]">Tempat, Tgl Lahir</th>
                  <th className="px-4 py-4 font-bold">Unit Kerja</th>
                  <th className="px-4 py-4 font-bold">Alamat Kantor</th>
                  <th className="px-4 py-4 font-bold">No. KTP</th>
                  <th className="px-4 py-4 font-bold">Alamat Rumah</th>
                  <th className="px-4 py-4 font-bold">No. Telepon/HP</th>
                  <th className="px-4 py-4 font-bold">No. Rekening</th>
                  <th className="px-4 py-4 font-bold min-w-[120px]">Perangkat Aktif</th>
                  <th className="px-4 py-4 font-bold">FC. SK</th>
                  <th className="px-4 py-4 font-bold text-center">Aksi</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-200/60 text-sm">
                {paginatedData.map((row, index) => (
                  <tr key={row.id} className="hover:bg-white/60 transition-colors align-top">
                    <td className="px-3 py-4 text-slate-500 font-mono">{(currentPage - 1) * itemsPerPage + index + 1}</td>
                    <td className="px-4 py-4">
                      <div className="font-semibold text-slate-800">{row.namaLengkap}</div>
                      <div className="text-slate-500 text-xs mt-1 font-mono">{row.nip || '-'}</div>
                      <div className="text-slate-500 text-xs mt-1">{row.pangkat || '-'}</div>
                    </td>
                    <td className="px-4 py-4 text-slate-600">
                      <div>{row.tempatLahir || '-'}</div>
                      <div className="text-xs text-slate-400 mt-1">
                        {row.tanggalLahir ? new Date(row.tanggalLahir).toLocaleDateString('id-ID') : '-'}
                      </div>
                    </td>
                    <td className="px-4 py-4 text-slate-600">{row.unitKerja || '-'}</td>
                    <td className="px-4 py-4 text-slate-600 text-xs max-w-[150px] truncate" title={row.alamatKantor || ''}>{row.alamatKantor || '-'}</td>
                    <td className="px-4 py-4 text-slate-600 font-mono">{row.noKtp || '-'}</td>
                    <td className="px-4 py-4 text-slate-600 text-xs max-w-[150px] truncate" title={row.alamatRumah || ''}>{row.alamatRumah || '-'}</td>
                    <td className="px-4 py-4 text-slate-600 font-mono">{row.noHp || '-'}</td>
                    <td className="px-4 py-4 text-slate-600 font-mono">{row.noRekening || row.rekeningBni || '-'}</td>
                    <td className="px-4 py-4 text-slate-600 text-xs">
                      {row.deviceName ? (
                        <div className="flex flex-col items-start gap-1">
                          <span className="font-semibold text-slate-800">{row.deviceName}</span>
                          <button onClick={() => handleResetDevice(row.id)} className="text-[10px] bg-red-100 text-red-600 px-2 py-0.5 rounded hover:bg-red-200 transition-colors">Reset Perangkat</button>
                        </div>
                      ) : '-'}
                    </td>
                    <td className="px-4 py-4">
                      <div className="flex flex-col items-start gap-1.5">
                        <span className={`px-2 py-1 rounded-md text-[10px] font-bold uppercase tracking-wider ${row.fcSkStatus === 'sudah' ? 'bg-emerald-100 text-emerald-700' : 'bg-red-100 text-red-700'}`}>
                          {row.fcSkStatus || 'belum'}
                        </span>
                        {row.fcSkUrl && (
                          <a href={`${BASE_URL}${row.fcSkUrl}`} target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:text-blue-800 hover:underline text-xs flex items-center gap-1 mt-1 font-medium">
                            <Eye size={14} /> Lihat PDF
                          </a>
                        )}
                      </div>
                    </td>
                    <td className="px-4 py-4">
                      {activeTab === 'semua' ? (
                        <div className="flex items-center justify-center gap-2">
                          <button onClick={() => handleOpenEdit(row)} className="p-2 text-blue-600 hover:bg-blue-50 border border-transparent hover:border-blue-100 rounded-lg transition-all" title="Edit Profil">
                            <Edit2 size={16} />
                          </button>
                          <button onClick={() => handleDeleteClick(row.id)} className="p-2 text-red-500 hover:bg-red-50 border border-transparent hover:border-red-100 rounded-lg transition-all" title="Hapus Anggota">
                            <Trash2 size={16} />
                          </button>
                        </div>
                      ) : (
                        <div className="flex items-center justify-center gap-2">
                          <button onClick={() => handleApprove(row.id)} className="px-3 py-1.5 bg-emerald-500 text-white hover:bg-emerald-600 rounded-lg text-xs font-bold transition-all shadow-sm">
                            Terima
                          </button>
                          <button onClick={() => handleDeleteClick(row.id)} className="px-3 py-1.5 bg-red-500 text-white hover:bg-red-600 rounded-lg text-xs font-bold transition-all shadow-sm">
                            Tolak
                          </button>
                        </div>
                      )}
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
        </div>
      )}

      {/* Action Drawer */}
      <Drawer isOpen={isDrawerOpen} onClose={() => setIsDrawerOpen(false)} title={editingId ? "Edit Data Anggota" : "Tambah Anggota Baru"} onSubmit={handleSubmit}>
        <div className="space-y-4">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-slate-700 mb-1">Nama Lengkap</label>
              <input type="text" required value={formData.namaLengkap} onChange={e => setFormData({...formData, namaLengkap: e.target.value})} className="w-full px-3 py-2 bg-white border border-slate-300 rounded-lg focus:border-primary outline-none text-sm" />
            </div>
            <div>
              <label className="block text-sm font-medium text-slate-700 mb-1">N.I.P / N.R.P</label>
              <input type="text" value={formData.nip} onChange={e => setFormData({...formData, nip: e.target.value})} className="w-full px-3 py-2 bg-white border border-slate-300 rounded-lg focus:border-primary outline-none text-sm" />
            </div>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-slate-700 mb-1">Tempat Lahir</label>
              <input type="text" value={formData.tempatLahir} onChange={e => setFormData({...formData, tempatLahir: e.target.value})} className="w-full px-3 py-2 bg-white border border-slate-300 rounded-lg focus:border-primary outline-none text-sm" />
            </div>
            <div>
              <label className="block text-sm font-medium text-slate-700 mb-1">Tanggal Lahir (dd-mm-yyyy)</label>
              <input type="date" value={formData.tanggalLahir} onChange={e => setFormData({...formData, tanggalLahir: e.target.value})} className="w-full px-3 py-2 bg-white border border-slate-300 rounded-lg focus:border-primary outline-none text-sm" />
            </div>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-slate-700 mb-1">Pangkat / Golongan</label>
              <input list="pangkat-list" value={formData.pangkat} onChange={e => setFormData({...formData, pangkat: e.target.value})} className="w-full px-3 py-2 bg-white border border-slate-300 rounded-lg focus:border-primary outline-none text-sm" placeholder="Ketik atau pilih..." />
              <datalist id="pangkat-list">
                {pangkatOptions.map(p => <option key={p.id} value={p.nilai} />)}
              </datalist>
            </div>
            <div>
              <label className="block text-sm font-medium text-slate-700 mb-1">Instansi / Unit Kerja</label>
              <input list="unit-list" value={formData.unitKerja} onChange={e => setFormData({...formData, unitKerja: e.target.value})} className="w-full px-3 py-2 bg-white border border-slate-300 rounded-lg focus:border-primary outline-none text-sm" placeholder="Ketik atau pilih..." />
              <datalist id="unit-list">
                {unitKerjaOptions.map(u => <option key={u.id} value={u.nilai} />)}
              </datalist>
            </div>
          </div>

          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Alamat Kantor</label>
            <textarea rows={2} value={formData.alamatKantor} onChange={e => setFormData({...formData, alamatKantor: e.target.value})} className="w-full px-3 py-2 bg-white border border-slate-300 rounded-lg focus:border-primary outline-none text-sm resize-none" />
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-slate-700 mb-1">No. KTP</label>
              <input type="text" value={formData.noKtp} onChange={e => setFormData({...formData, noKtp: e.target.value})} className="w-full px-3 py-2 bg-white border border-slate-300 rounded-lg focus:border-primary outline-none text-sm" />
            </div>
            <div>
              <label className="block text-sm font-medium text-slate-700 mb-1">No. Telepon / HP</label>
              <input type="text" value={formData.noHp} onChange={e => setFormData({...formData, noHp: e.target.value})} className="w-full px-3 py-2 bg-white border border-slate-300 rounded-lg focus:border-primary outline-none text-sm" />
            </div>
          </div>
          
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Alamat Rumah</label>
            <textarea rows={2} value={formData.alamatRumah} onChange={e => setFormData({...formData, alamatRumah: e.target.value})} className="w-full px-3 py-2 bg-white border border-slate-300 rounded-lg focus:border-primary outline-none text-sm resize-none" />
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-slate-700 mb-1">No. Rekening</label>
              <input type="text" value={formData.noRekening} onChange={e => setFormData({...formData, noRekening: e.target.value})} className="w-full px-3 py-2 bg-white border border-slate-300 rounded-lg focus:border-primary outline-none text-sm" />
            </div>
            <div>
              <label className="block text-sm font-medium text-slate-700 mb-1">FC. SK</label>
              <select value={formData.fcSkStatus} onChange={e => setFormData({...formData, fcSkStatus: e.target.value})} className="w-full px-3 py-2 bg-white border border-slate-300 rounded-lg focus:border-primary outline-none text-sm">
                <option value="belum">Belum</option>
                <option value="sudah">Sudah</option>
              </select>
            </div>
          </div>
          
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Lampiran FC. SK (PDF)</label>
            <input type="file" accept="application/pdf" onChange={e => setFcSkFile(e.target.files ? e.target.files[0] : null)} className="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg text-sm text-slate-600 focus:outline-none" />
          </div>
        </div>
      </Drawer>

      <ConfirmDialog isOpen={isConfirmOpen} onClose={() => setIsConfirmOpen(false)} onConfirm={confirmDelete} title="Hapus Data Anggota" message="Yakin ingin menghapus anggota ini secara permanen?" />
    </div>
  );
};

export default Anggota;
