import React, { useState, useEffect } from 'react';
import EmptyState from '../components/EmptyState';
import { CalendarCheck, Search, CheckCircle, Clock, AlertCircle, Check } from 'lucide-react';
import { api } from '../lib/api';
import { toast } from '../lib/toast';
import ConfirmDialog from '../components/ConfirmDialog';
import Pagination from '../components/Pagination';

const Angsuran: React.FC = () => {
  const [angsuranList, setAngsuranList] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState('');
  const [statusFilter, setStatusFilter] = useState('Semua');
  
  // Pagination State
  const [currentPage, setCurrentPage] = useState(1);
  const [itemsPerPage, setItemsPerPage] = useState(10);
  
  const [isConfirmOpen, setIsConfirmOpen] = useState(false);
  const [selectedAngsuran, setSelectedAngsuran] = useState<any>(null);

  const fetchAngsuran = async () => {
    try {
      const data = await api.get('/pinjaman/angsuran');
      setAngsuranList(data);
    } catch (error) {
      toast.error('Gagal mengambil data angsuran');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchAngsuran();
  }, []);

  const formatCurrency = (val: number) => {
    return new Intl.NumberFormat('id-ID', { style: 'currency', currency: 'IDR' }).format(val);
  };

  const handleBayar = (angsuran: any) => {
    if (angsuran.status === 'LUNAS') {
      toast.error('Angsuran sudah lunas');
      return;
    }
    setSelectedAngsuran(angsuran);
    setIsConfirmOpen(true);
  };

  const confirmBayar = async () => {
    if (!selectedAngsuran) return;
    try {
      // Panggil endpoint bayar (belum ada di pinjaman.ts, tapi bisa asumsikan nanti atau toast info)
      // await api.put(`/pinjaman/angsuran/${selectedAngsuran.id}/bayar`);
      toast.info('Fitur Konfirmasi Pembayaran Manual segera hadir!');
    } catch (error) {
      toast.error('Gagal konfirmasi pembayaran');
    } finally {
      setIsConfirmOpen(false);
      setSelectedAngsuran(null);
    }
  };
  
  const [angsuranTab, setAngsuranTab] = useState<'Semua' | 'Verifikasi'>('Semua');

  const filtered = angsuranList.filter(a => {
    const term = searchTerm.toLowerCase();
    const nama = a.pinjaman?.anggota?.namaLengkap?.toLowerCase() || '';
    const npp = a.pinjaman?.anggota?.nip?.toLowerCase() || '';
    const matchSearch = nama.includes(term) || npp.includes(term);
    
    if (angsuranTab === 'Verifikasi') {
      return matchSearch && a.status === 'MENUNGGU_VERIFIKASI';
    }
    
    const matchStatus = statusFilter === 'Semua' ? a.status !== 'MENUNGGU_VERIFIKASI' : a.status === statusFilter;
    return matchSearch && matchStatus;
  });

  const handleUpdateStatus = async (id: number, status: string) => {
    try {
      await api.put(`/angsuran/${id}/status`, { status });
      toast.success('Status pembayaran berhasil diupdate');
      fetchAngsuran();
    } catch (error) {
      toast.error('Gagal mengupdate status');
    }
  };

  const paginatedData = filtered.slice((currentPage - 1) * itemsPerPage, currentPage * itemsPerPage);

  if (loading) return <div className="p-6 text-center text-slate-500 animate-pulse">Memuat data angsuran...</div>;

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
        <div>
          <h1 className="text-3xl font-bold text-primary font-outfit">Jadwal Angsuran</h1>
          <p className="text-slate-500 mt-1">Pantau pembayaran angsuran anggota setiap bulan.</p>
        </div>
        
        <div className="flex flex-wrap items-center gap-2">
          <div className="relative w-full sm:w-64">
            <Search size={16} className="absolute left-3 top-2.5 text-slate-400" />
            <input 
              type="text" 
              placeholder="Cari nama atau NIP..." 
              value={searchTerm}
              onChange={(e) => { setSearchTerm(e.target.value); setCurrentPage(1); }}
              className="w-full pl-10 pr-4 py-2 bg-white/70 backdrop-blur border border-slate-200 rounded-xl outline-none focus:border-secondary text-sm shadow-sm transition-colors" 
            />
          </div>
          
          <select 
            className="px-4 py-2 bg-white/70 backdrop-blur border border-slate-200 text-slate-600 rounded-xl text-sm font-semibold focus:outline-none focus:border-secondary shadow-sm"
            value={statusFilter}
            onChange={(e) => { setStatusFilter(e.target.value); setCurrentPage(1); }}
          >
            <option value="Semua">Semua Status</option>
            <option value="BELUM_DIBAYAR">Belum Dibayar</option>
            <option value="LUNAS">Lunas</option>
            <option value="TERLAMBAT">Terlambat</option>
          </select>
        </div>
      </div>

      <div className="glass-panel overflow-hidden">
        {/* Tabs */}
        <div className="flex border-b border-slate-200/60">
          <button 
            onClick={() => { setAngsuranTab('Semua'); setCurrentPage(1); }} 
            className={`px-6 py-4 text-sm font-bold transition-all border-b-2 ${angsuranTab === 'Semua' ? 'text-primary border-primary bg-primary/5' : 'text-slate-500 border-transparent hover:text-primary hover:bg-primary/5'}`}
          >
            Semua Angsuran
          </button>
          <button 
            onClick={() => { setAngsuranTab('Verifikasi'); setCurrentPage(1); }} 
            className={`px-6 py-4 text-sm font-bold transition-all border-b-2 flex items-center gap-2 ${angsuranTab === 'Verifikasi' ? 'text-secondary border-secondary bg-secondary/5' : 'text-slate-500 border-transparent hover:text-secondary hover:bg-secondary/5'}`}
          >
            Verifikasi Pembayaran
            {angsuranList.filter(a => a.status === 'MENUNGGU_VERIFIKASI').length > 0 && (
              <span className="bg-red-500 text-white text-[10px] px-2 py-0.5 rounded-full">
                {angsuranList.filter(a => a.status === 'MENUNGGU_VERIFIKASI').length}
              </span>
            )}
          </button>
        </div>

        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse text-sm">
            <thead>
              <tr className="bg-primary/5 text-primary text-xs uppercase tracking-wider border-b border-primary/10">
                <th className="px-6 py-4 font-bold">Anggota</th>
                <th className="px-6 py-4 font-bold text-center">Bulan Ke</th>
                <th className="px-6 py-4 font-bold text-right">Tagihan</th>
                <th className="px-6 py-4 font-bold text-right">Denda</th>
                <th className="px-6 py-4 font-bold text-center">Jatuh Tempo</th>
                <th className="px-6 py-4 font-bold text-center">Status</th>
                <th className="px-6 py-4 text-center font-bold">Aksi</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-200/60 text-sm">
              {paginatedData.map(angsuran => {
                const isLunas = angsuran.status === 'LUNAS';
                const isTerlambat = angsuran.status === 'TERLAMBAT';
                
                return (
                  <tr key={angsuran.id} className="hover:bg-white/60 transition-colors">
                    <td className="px-6 py-4">
                      <div className="font-bold text-slate-800">{angsuran.pinjaman?.anggota?.namaLengkap || '-'}</div>
                      <div className="text-[10px] text-slate-500 uppercase">{angsuran.pinjaman?.anggota?.nip || '-'}</div>
                    </td>
                    <td className="px-6 py-4 text-center font-bold text-slate-700">
                      {angsuran.bulanKe} / {angsuran.pinjaman?.tenor}
                    </td>
                    <td className="px-6 py-4 text-right font-mono font-bold text-slate-800">
                      {formatCurrency(angsuran.totalTagihan)}
                    </td>
                    <td className="px-6 py-4 text-right font-mono text-red-500 font-bold">
                      {angsuran.dendaKeterlambatan > 0 ? formatCurrency(angsuran.dendaKeterlambatan) : '-'}
                    </td>
                    <td className="px-6 py-4 text-center text-xs text-slate-600">
                      {new Date(angsuran.jatuhTempo).toLocaleDateString('id-ID')}
                    </td>
                    <td className="px-6 py-4 text-center">
                      <span className={`px-2 py-1 rounded-md text-[10px] font-bold uppercase flex items-center justify-center gap-1 w-fit mx-auto ${
                        isLunas ? 'bg-emerald-100 text-emerald-700' : 
                        isTerlambat ? 'bg-red-100 text-red-700' : 
                        angsuran.status === 'MENUNGGU_VERIFIKASI' ? 'bg-blue-100 text-blue-700' : 'bg-amber-100 text-amber-700'
                      }`}>
                        {angsuran.status.replace(/_/g, ' ')}
                      </span>
                      {angsuran.lampiranBuktiUrl && (
                        <a href={`${import.meta.env.VITE_API_URL?.replace('/api', '') || 'http://localhost:3000'}${angsuran.lampiranBuktiUrl}`} target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:text-blue-800 hover:underline text-xs flex justify-center items-center gap-1 mt-2 font-medium">
                          Lihat Bukti
                        </a>
                      )}
                    </td>
                    <td className="px-6 py-4">
                      {angsuranTab === 'Verifikasi' && angsuran.status === 'MENUNGGU_VERIFIKASI' ? (
                        <div className="flex items-center justify-center gap-2">
                          <button onClick={() => handleUpdateStatus(angsuran.id, 'LUNAS')} className="px-3 py-1.5 bg-emerald-500 text-white hover:bg-emerald-600 rounded-lg text-xs font-bold transition-all shadow-sm">
                            Terima
                          </button>
                          <button onClick={() => handleUpdateStatus(angsuran.id, 'BELUM_BAYAR')} className="px-3 py-1.5 bg-red-500 text-white hover:bg-red-600 rounded-lg text-xs font-bold transition-all shadow-sm">
                            Tolak
                          </button>
                        </div>
                      ) : (
                        <div className="flex justify-center gap-2">
                          <button onClick={() => handleBayar(angsuran)} disabled={isLunas} className={`px-3 py-1.5 rounded-lg text-xs font-semibold transition-colors flex items-center gap-1 ${isLunas ? 'bg-slate-100 text-slate-400 cursor-not-allowed' : 'bg-emerald-50 text-emerald-600 hover:bg-emerald-100 border border-emerald-200'}`}>
                            <Check size={14} /> Bayar
                          </button>
                        </div>
                      )}
                    </td>
                  </tr>
                );
              })}
              {filtered.length === 0 && (
                <tr>
                  <td colSpan={7}>
                    <EmptyState 
                      icon={CalendarCheck}
                      title="Tidak ada angsuran"
                      description="Data angsuran kosong atau tidak ditemukan."
                    />
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
        <Pagination 
          currentPage={currentPage}
          totalItems={filtered.length}
          itemsPerPage={itemsPerPage}
          onPageChange={setCurrentPage}
          onLimitChange={setItemsPerPage}
        />
      </div>

      <ConfirmDialog 
        isOpen={isConfirmOpen} onClose={() => setIsConfirmOpen(false)} onConfirm={confirmBayar} 
        title="Konfirmasi Pembayaran Manual" 
        message={`Anda akan memproses pembayaran angsuran Bulan ke-${selectedAngsuran?.bulanKe} a/n ${selectedAngsuran?.pinjaman?.anggota?.nama}. Lanjutkan?`} 
      />
    </div>
  );
};

export default Angsuran;
