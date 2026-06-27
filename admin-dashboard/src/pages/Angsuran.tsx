import React, { useState, useEffect } from 'react';
import EmptyState from '../components/EmptyState';
import { CalendarCheck, Search, CheckCircle, Clock, AlertCircle } from 'lucide-react';
import { api } from '../lib/api';
import { toast } from '../lib/toast';
import ConfirmDialog from '../components/ConfirmDialog';

const Angsuran: React.FC = () => {
  const [angsuranList, setAngsuranList] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState('');
  
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

  const filtered = angsuranList.filter(a => {
    const term = searchTerm.toLowerCase();
    const nama = a.pinjaman?.anggota?.nama?.toLowerCase() || '';
    const npp = a.pinjaman?.anggota?.npp?.toLowerCase() || '';
    return nama.includes(term) || npp.includes(term);
  });

  if (loading) return <div className="p-6 text-center text-slate-500 animate-pulse">Memuat data angsuran...</div>;

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
        <div>
          <h1 className="text-3xl font-bold text-primary font-outfit">Jadwal Angsuran</h1>
          <p className="text-slate-500 mt-1">Pantau pembayaran angsuran anggota setiap bulan.</p>
        </div>
        
        <div className="relative w-full sm:w-72">
          <input 
            type="text" 
            placeholder="Cari nama atau NPP..." 
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            className="w-full pl-10 pr-4 py-2 bg-white border border-slate-200 rounded-xl outline-none focus:border-secondary text-sm shadow-sm" 
          />
          <Search size={16} className="absolute left-4 top-2.5 text-slate-400" />
        </div>
      </div>

      <div className="glass-panel overflow-hidden">
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
            <tbody className="divide-y divide-slate-100">
              {filtered.map(angsuran => {
                const isLunas = angsuran.status === 'LUNAS';
                const isTerlambat = angsuran.status === 'TERLAMBAT';
                
                return (
                  <tr key={angsuran.id} className="hover:bg-white/40">
                    <td className="px-6 py-4">
                      <div className="font-bold text-slate-800">{angsuran.pinjaman?.anggota?.nama}</div>
                      <div className="text-[10px] text-slate-500 uppercase">{angsuran.pinjaman?.anggota?.npp}</div>
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
                        isTerlambat ? 'bg-red-100 text-red-700' : 'bg-amber-100 text-amber-700'
                      }`}>
                        {isLunas ? <CheckCircle size={10} /> : isTerlambat ? <AlertCircle size={10} /> : <Clock size={10} />}
                        {angsuran.status}
                      </span>
                    </td>
                    <td className="px-6 py-4 text-center">
                      {!isLunas && (
                        <button 
                          onClick={() => handleBayar(angsuran)} 
                          className="px-3 py-1 bg-primary text-white rounded-lg text-xs font-bold hover:bg-primary-light"
                        >
                          Bayar Manual
                        </button>
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
