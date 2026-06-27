import React, { useState } from 'react';
import { Users, Search, Edit2, Trash2, Plus, Upload, Download, CreditCard, ChevronLeft, ChevronRight } from 'lucide-react';
import ConfirmDialog from '../components/ConfirmDialog';
import Drawer from '../components/Drawer';
import EmptyState from '../components/EmptyState';

// Dummy Data berdasarkan struktur V2
const initialAnggota = [
  { id: 'ANG-001', nama_lengkap: 'Budi Santoso', nip_nrp: '198501012010121001', pangkat: 'Letkol (Bakamla)', satuan_kerja: 'Biro Umum', nomor_rekening: '0987654321', nama_bank: 'BNI', fc_sk: 'sudah' },
  { id: 'ANG-002', nama_lengkap: 'Siti Aminah', nip_nrp: '199002022015032002', pangkat: 'Mayor (Bakamla)', satuan_kerja: 'Direktorat Operasi Laut', nomor_rekening: '1122334455', nama_bank: 'BNI', fc_sk: 'belum' },
];

const Anggota: React.FC = () => {
  const [anggotaList, setAnggotaList] = useState(initialAnggota);
  const [searchTerm, setSearchTerm] = useState('');
  
  // Drawer State
  const [isDrawerOpen, setIsDrawerOpen] = useState(false);
  const [editingId, setEditingId] = useState<string | null>(null);
  
  // Dialog State
  const [isConfirmOpen, setIsConfirmOpen] = useState(false);
  const [deleteId, setDeleteId] = useState<string | null>(null);

  // Form State (Struktur V2)
  const [formData, setFormData] = useState({ 
    nama_lengkap: '', nip_nrp: '', pangkat: '', satuan_kerja: '', nomor_rekening: '', nama_bank: 'BNI', fc_sk: 'belum' 
  });

  // Handlers
  const handleOpenAdd = () => {
    setEditingId(null);
    setFormData({ nama_lengkap: '', nip_nrp: '', pangkat: '', satuan_kerja: '', nomor_rekening: '', nama_bank: 'BNI', fc_sk: 'belum' });
    setIsDrawerOpen(true);
  };

  const handleOpenEdit = (anggota: any) => {
    setEditingId(anggota.id);
    setFormData({ 
      nama_lengkap: anggota.nama_lengkap, nip_nrp: anggota.nip_nrp, pangkat: anggota.pangkat, 
      satuan_kerja: anggota.satuan_kerja, nomor_rekening: anggota.nomor_rekening, 
      nama_bank: anggota.nama_bank || 'BNI', fc_sk: anggota.fc_sk 
    });
    setIsDrawerOpen(true);
  };

  const handleDeleteClick = (id: string) => {
    setDeleteId(id);
    setIsConfirmOpen(true);
  };

  const confirmDelete = () => {
    setAnggotaList(anggotaList.filter(a => a.id !== deleteId));
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (editingId) {
      setAnggotaList(anggotaList.map(a => a.id === editingId ? { ...a, ...formData } : a));
    } else {
      const newId = `ANG-00${anggotaList.length + 1}`;
      setAnggotaList([{ id: newId, ...formData }, ...anggotaList]);
    }
    setIsDrawerOpen(false);
  };

  // Filter
  const filteredData = anggotaList.filter(a => a.nama_lengkap.toLowerCase().includes(searchTerm.toLowerCase()));

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
              placeholder="Cari anggota..."
              className="w-full pl-10 pr-4 py-2 bg-white/70 backdrop-blur border border-white/50 shadow-sm rounded-xl text-sm focus:ring-2 focus:ring-secondary focus:border-secondary outline-none"
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
            />
          </div>
          
          <button onClick={handleOpenAdd} className="btn btn-primary flex items-center gap-2 shadow-lg hover:shadow-xl">
            <Plus size={16} /> Tambah Baru
          </button>
          
          <button onClick={() => alert('Silakan pilih file CSV/Excel untuk diimpor.')} className="px-4 py-2 bg-white/80 border border-white/50 shadow-sm text-primary rounded-xl text-sm font-semibold flex items-center gap-2 hover:bg-slate-50 transition-colors">
            <Upload size={16} /> Impor
          </button>
          
          <button onClick={() => alert('Mengekspor data ke CSV/Excel...')} className="px-4 py-2 bg-white/80 border border-white/50 shadow-sm text-primary rounded-xl text-sm font-semibold flex items-center gap-2 hover:bg-slate-50 transition-colors">
            <Download size={16} /> Ekspor
          </button>
        </div>
      </div>

      {/* Main Content */}
      {anggotaList.length === 0 ? (
        <EmptyState 
          icon={Users} title="Belum ada anggota terdaftar" description="Data anggota koperasi akan ditampilkan di sini." actionText="Tambah Anggota Baru" onAction={handleOpenAdd}
        />
      ) : (
        <div className="glass-panel overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="bg-primary/5 text-primary text-xs uppercase tracking-wider border-b border-primary/10">
                  <th className="px-5 py-4 font-bold">Nama Lengkap</th>
                  <th className="px-5 py-4 font-bold">NIP / NRP</th>
                  <th className="px-5 py-4 font-bold">Pangkat</th>
                  <th className="px-5 py-4 font-bold">Unit Kerja</th>
                  <th className="px-5 py-4 font-bold">No Rek BNI</th>
                  <th className="px-5 py-4 font-bold">FC SK</th>
                  <th className="px-5 py-4 font-bold text-center">Aksi</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100/50 text-sm">
                {filteredData.map((row) => (
                  <tr key={row.id} className="hover:bg-white/40 transition-colors">
                    <td className="px-5 py-3.5 font-semibold text-slate-800">{row.nama_lengkap}</td>
                    <td className="px-5 py-3.5 text-slate-600 font-mono">{row.nip_nrp || '-'}</td>
                    <td className="px-5 py-3.5 text-slate-600">{row.pangkat || '-'}</td>
                    <td className="px-5 py-3.5 text-slate-600">{row.satuan_kerja || '-'}</td>
                    <td className="px-5 py-3.5 text-slate-600 font-mono">{row.nomor_rekening || '-'}</td>
                    <td className="px-5 py-3.5">
                      <span className={`px-2 py-1 rounded-md text-[10px] font-bold uppercase tracking-wider ${row.fc_sk === 'sudah' ? 'bg-emerald-100 text-emerald-700' : 'bg-red-100 text-red-700'}`}>
                        {row.fc_sk || 'belum'}
                      </span>
                    </td>
                    <td className="px-5 py-3.5">
                      <div className="flex items-center justify-center gap-2">
                        <button className="text-xs font-bold text-primary hover:underline hover:text-secondary transition-colors px-2">Detail</button>
                        <button onClick={() => handleOpenEdit(row)} className="p-1.5 text-blue-500 hover:bg-blue-50 rounded-lg transition-colors" title="Edit Profil"><Edit2 size={15} /></button>
                        <button className="p-1.5 text-teal-600 hover:bg-teal-50 rounded-lg transition-colors" title="Cetak Kartu Anggota"><CreditCard size={15} /></button>
                        <button onClick={() => handleDeleteClick(row.id)} className="p-1.5 text-red-500 hover:bg-red-50 rounded-lg transition-colors" title="Hapus Anggota"><Trash2 size={15} /></button>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
          
          {/* Pagination Dummy */}
          <div className="p-4 border-t border-slate-100 flex items-center justify-between text-xs text-slate-500 bg-white/30">
            <p>Menampilkan {filteredData.length} dari {anggotaList.length} data</p>
            <div className="flex items-center gap-2">
              <button className="p-1.5 bg-white border border-slate-200 rounded-lg hover:bg-slate-50"><ChevronLeft size={14}/></button>
              <span className="font-medium">Halaman 1 dari 1</span>
              <button className="p-1.5 bg-white border border-slate-200 rounded-lg hover:bg-slate-50"><ChevronRight size={14}/></button>
            </div>
          </div>
        </div>
      )}

      {/* Action Drawer */}
      <Drawer isOpen={isDrawerOpen} onClose={() => setIsDrawerOpen(false)} title={editingId ? "Edit Data Anggota" : "Tambah Anggota Baru"} onSubmit={handleSubmit}>
        <div className="space-y-4">
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Nama Lengkap</label>
            <input type="text" required value={formData.nama_lengkap} onChange={e => setFormData({...formData, nama_lengkap: e.target.value})} className="w-full px-4 py-2 bg-white border border-slate-300 rounded-xl focus:border-primary outline-none" />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">NIP / NRP</label>
            <input type="text" required value={formData.nip_nrp} onChange={e => setFormData({...formData, nip_nrp: e.target.value})} className="w-full px-4 py-2 bg-white border border-slate-300 rounded-xl focus:border-primary outline-none" />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Pangkat</label>
            <input type="text" value={formData.pangkat} onChange={e => setFormData({...formData, pangkat: e.target.value})} className="w-full px-4 py-2 bg-white border border-slate-300 rounded-xl focus:border-primary outline-none" />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Unit Kerja / Satuan</label>
            <input type="text" value={formData.satuan_kerja} onChange={e => setFormData({...formData, satuan_kerja: e.target.value})} className="w-full px-4 py-2 bg-white border border-slate-300 rounded-xl focus:border-primary outline-none" />
          </div>
          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-slate-700 mb-1">Nomor Rek BNI</label>
              <input type="text" value={formData.nomor_rekening} onChange={e => setFormData({...formData, nomor_rekening: e.target.value})} className="w-full px-4 py-2 bg-white border border-slate-300 rounded-xl focus:border-primary outline-none" />
            </div>
            <div>
              <label className="block text-sm font-medium text-slate-700 mb-1">Status FC SK</label>
              <select value={formData.fc_sk} onChange={e => setFormData({...formData, fc_sk: e.target.value})} className="w-full px-4 py-2 bg-white border border-slate-300 rounded-xl focus:border-primary outline-none">
                <option value="belum">Belum</option>
                <option value="sudah">Sudah</option>
              </select>
            </div>
          </div>
        </div>
      </Drawer>

      <ConfirmDialog isOpen={isConfirmOpen} onClose={() => setIsConfirmOpen(false)} onConfirm={confirmDelete} title="Hapus Data Anggota" message="Yakin ingin menghapus anggota ini secara permanen?" />
    </div>
  );
};

export default Anggota;
