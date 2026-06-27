import React, { useState } from 'react';
import { Plus, Trash2, Wallet, FileText } from 'lucide-react';
import Drawer from '../components/Drawer';
import ConfirmDialog from '../components/ConfirmDialog';
import EmptyState from '../components/EmptyState';

// Dummy data based on V2 structure
const initialSimpanan = [
  { id: 'SMP-001', tanggal_transaksi: '2026-06-01', nama_lengkap: 'Budi Santoso', jenis_simpanan: 'pokok', nominal: 500000, status_approval: 'approved' },
  { id: 'SMP-002', tanggal_transaksi: '2026-06-15', nama_lengkap: 'Siti Aminah', jenis_simpanan: 'wajib', nominal: 100000, status_approval: 'approved' },
  { id: 'SMP-003', tanggal_transaksi: '2026-06-20', nama_lengkap: 'Agus Pratama', jenis_simpanan: 'sukarela', nominal: 250000, status_approval: 'pending' },
];

const Simpanan: React.FC = () => {
  const [dataList, setDataList] = useState(initialSimpanan);
  const [simpananTab, setSimpananTab] = useState('pokok');
  
  const [isDrawerOpen, setIsDrawerOpen] = useState(false);
  const [isConfirmOpen, setIsConfirmOpen] = useState(false);
  const [deleteId, setDeleteId] = useState<string | null>(null);

  const [formData, setFormData] = useState({ nama_lengkap: '', jenis_simpanan: 'pokok', nominal: '' });

  const handleDeleteClick = (id: string) => {
    setDeleteId(id);
    setIsConfirmOpen(true);
  };

  const confirmDelete = () => {
    setDataList(dataList.filter(item => item.id !== deleteId));
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    const newId = `SMP-00${dataList.length + 1}`;
    setDataList([
      { 
        id: newId, 
        tanggal_transaksi: new Date().toISOString().split('T')[0], 
        nama_lengkap: formData.nama_lengkap,
        jenis_simpanan: formData.jenis_simpanan,
        nominal: parseInt(formData.nominal.replace(/\D/g, '')) || 0,
        status_approval: 'approved' 
      }, 
      ...dataList
    ]);
    setIsDrawerOpen(false);
  };

  const filteredData = dataList.filter(item => item.jenis_simpanan === simpananTab);

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
        <div>
          <h1 className="text-3xl font-bold text-primary font-outfit flex items-center gap-3">
            <Wallet size={32} className="text-secondary" />
            Simpanan Anggota
          </h1>
          <p className="text-slate-500 mt-1">Daftar pencatatan kas simpanan pokok, wajib, dan sukarela anggota.</p>
        </div>
        
        <div className="flex gap-2">
          <button onClick={() => setIsDrawerOpen(true)} className="btn btn-primary flex items-center gap-2 shadow-lg">
            <Plus size={16} /> Tambah Simpanan
          </button>
          <button className="px-4 py-2 bg-white/80 border border-white/50 shadow-sm text-primary rounded-xl text-sm font-semibold flex items-center gap-2 hover:bg-slate-50 transition-colors">
            <FileText size={16} /> Laporan
          </button>
        </div>
      </div>

      <div className="glass-panel overflow-hidden">
        {/* Tab Selection */}
        <div className="flex border-b border-slate-200/50 bg-white/30">
          {['pokok', 'wajib', 'sukarela'].map((tab) => (
            <button
              key={tab}
              onClick={() => setSimpananTab(tab)}
              className={`px-6 py-4 text-sm font-bold uppercase transition-all relative ${simpananTab === tab ? 'text-primary' : 'text-slate-400 hover:text-slate-600 hover:bg-white/20'}`}
            >
              Simpanan {tab}
              {simpananTab === tab && (
                <div className="absolute bottom-0 left-0 w-full h-0.5 bg-secondary shadow-[0_0_8px_rgba(212,175,55,0.8)]"></div>
              )}
            </button>
          ))}
        </div>

        {filteredData.length === 0 ? (
          <div className="py-12">
            <EmptyState icon={Wallet} title="Belum ada transaksi" description={`Tidak ada riwayat transaksi simpanan ${simpananTab} saat ini.`} actionText="Catat Simpanan" onAction={() => setIsDrawerOpen(true)} />
          </div>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="bg-primary/5 text-primary text-xs uppercase tracking-wider border-b border-primary/10">
                  <th className="px-6 py-4 font-bold">No</th>
                  <th className="px-6 py-4 font-bold">Tanggal</th>
                  <th className="px-6 py-4 font-bold">Nama Anggota</th>
                  <th className="px-6 py-4 font-bold">Jenis</th>
                  <th className="px-6 py-4 font-bold">Nominal</th>
                  <th className="px-6 py-4 font-bold text-center">Status</th>
                  <th className="px-6 py-4 font-bold text-center">Aksi</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100/50 text-sm">
                {filteredData.map((item, index) => (
                  <tr key={item.id} className="hover:bg-white/40 transition-colors group">
                    <td className="px-6 py-3.5 font-semibold text-slate-500">{index + 1}</td>
                    <td className="px-6 py-3.5 text-slate-600 font-mono">{new Date(item.tanggal_transaksi).toLocaleDateString('id-ID')}</td>
                    <td className="px-6 py-3.5 font-semibold text-slate-800">{item.nama_lengkap}</td>
                    <td className="px-6 py-3.5 capitalize text-slate-600">{item.jenis_simpanan}</td>
                    <td className="px-6 py-3.5 font-bold text-emerald-600">Rp {item.nominal.toLocaleString('id-ID')}</td>
                    <td className="px-6 py-3.5 text-center">
                      <span className={`px-2.5 py-1 rounded-md text-[10px] font-bold uppercase tracking-wider ${
                        item.status_approval === 'approved' ? 'bg-emerald-100 text-emerald-700' :
                        item.status_approval === 'pending' ? 'bg-amber-100 text-amber-700' : 'bg-red-100 text-red-700'
                      }`}>
                        {item.status_approval}
                      </span>
                    </td>
                    <td className="px-6 py-3.5 text-center">
                       <button onClick={() => handleDeleteClick(item.id)} className="p-1.5 text-slate-400 hover:text-red-500 hover:bg-red-50 rounded-lg transition-colors opacity-0 group-hover:opacity-100" title="Hapus">
                        <Trash2 size={16} />
                      </button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </div>

      {/* Action Drawer */}
      <Drawer isOpen={isDrawerOpen} onClose={() => setIsDrawerOpen(false)} title="Catat Simpanan Anggota" onSubmit={handleSubmit}>
        <div className="space-y-4">
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Nama Anggota</label>
            <input 
              type="text" required value={formData.nama_lengkap} onChange={e => setFormData({...formData, nama_lengkap: e.target.value})}
              className="w-full px-4 py-2 bg-white border border-slate-300 rounded-xl outline-none focus:border-primary" placeholder="Contoh: Budi Santoso"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Jenis Simpanan</label>
            <select 
              value={formData.jenis_simpanan} onChange={e => setFormData({...formData, jenis_simpanan: e.target.value})}
              className="w-full px-4 py-2 bg-white border border-slate-300 rounded-xl outline-none focus:border-primary"
            >
              <option value="pokok">Pokok</option>
              <option value="wajib">Wajib</option>
              <option value="sukarela">Sukarela</option>
            </select>
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Jumlah Nominal (Rp)</label>
            <input 
              type="text" required value={formData.nominal} onChange={e => setFormData({...formData, nominal: e.target.value})}
              className="w-full px-4 py-2 bg-white border border-slate-300 rounded-xl outline-none focus:border-primary font-mono" placeholder="500000"
            />
          </div>
        </div>
      </Drawer>

      <ConfirmDialog isOpen={isConfirmOpen} onClose={() => setIsConfirmOpen(false)} onConfirm={confirmDelete} title="Hapus Data Simpanan" message="Yakin ingin menghapus catatan simpanan ini secara permanen?" />
    </div>
  );
};

export default Simpanan;
