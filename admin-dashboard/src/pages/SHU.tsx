import React, { useState, useEffect } from 'react';
import { Landmark, Calculator, Users, DollarSign } from 'lucide-react';
import { api } from '../lib/api';
import { toast } from '../lib/toast';

const SHU: React.FC = () => {
  const [data, setData] = useState({
    totalLabaBersih: 0,
    persenShuDibagikan: 0,
    anggotaAktif: 0,
    simulasi: [] as any[]
  });
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchSimulasi = async () => {
      try {
        const response = await api.get('/shu/simulasi');
        setData(response);
      } catch (error) {
        toast.error('Gagal mengambil data simulasi SHU');
      } finally {
        setLoading(false);
      }
    };
    fetchSimulasi();
  }, []);

  const formatCurrency = (val: number) => {
    return new Intl.NumberFormat('id-ID', { style: 'currency', currency: 'IDR' }).format(val);
  };

  if (loading) {
    return <div className="p-6 text-center text-slate-500 animate-pulse">Memuat data simulasi SHU...</div>;
  }

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
        <div>
          <h1 className="text-3xl font-bold text-primary font-outfit flex items-center gap-3">
            <Landmark size={32} className="text-secondary" />
            Sisa Hasil Usaha (SHU)
          </h1>
          <p className="text-slate-500 mt-1">Kalkulasi otomatis dan pembagian SHU kepada anggota Koperasi berjalan.</p>
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <div className="glass-card p-6 border-b-4 border-emerald-500">
          <div className="flex justify-between items-center mb-4">
            <h3 className="font-bold text-slate-200">Total Laba Bersih (Tahun Berjalan)</h3>
            <div className="p-2 bg-emerald-100/20 text-emerald-300 rounded-lg"><DollarSign size={20} /></div>
          </div>
          <h2 className="text-3xl font-bold text-emerald-400">{formatCurrency(data.totalLabaBersih)}</h2>
          <p className="text-xs text-slate-400 mt-2">Dari Bunga, Biaya Pinjaman, & Toko Koperasi (Dikurangi Beban Operasional)</p>
        </div>
        <div className="glass-card p-6 border-b-4 border-blue-500">
          <div className="flex justify-between items-center mb-4">
            <h3 className="font-bold text-slate-200">Alokasi SHU untuk Anggota</h3>
            <div className="p-2 bg-blue-100/20 text-blue-300 rounded-lg"><Calculator size={20} /></div>
          </div>
          <h2 className="text-3xl font-bold text-blue-400">{data.persenShuDibagikan}%</h2>
          <p className="text-xs text-slate-400 mt-2">Dari {formatCurrency(data.totalLabaBersih)} = {formatCurrency(data.totalLabaBersih * (data.persenShuDibagikan/100))} akan dibagikan</p>
        </div>
        <div className="glass-card p-6 border-b-4 border-purple-500">
          <div className="flex justify-between items-center mb-4">
            <h3 className="font-bold text-slate-200">Total Anggota Aktif</h3>
            <div className="p-2 bg-purple-100/20 text-purple-300 rounded-lg"><Users size={20} /></div>
          </div>
          <h2 className="text-3xl font-bold text-purple-400">{data.anggotaAktif} Orang</h2>
          <p className="text-xs text-slate-400 mt-2">Berhak menerima pembagian Jasa Modal & Jasa Anggota</p>
        </div>
      </div>

      <div className="glass-panel p-6">
        <div className="flex justify-between items-center mb-4">
          <div>
            <h3 className="font-bold text-primary">Simulasi Pembagian SHU (Top 50)</h3>
            <p className="text-sm text-slate-500">Pembagian didasarkan pada besaran simpanan (Jasa Modal 40%) serta transaksi pinjaman/toko (Jasa Anggota 60%).</p>
          </div>
          <button className="btn btn-primary text-sm whitespace-nowrap" onClick={() => toast.info('Fitur Distribusi ke Saldo Sukarela segera hadir!')}>
            Bagikan SHU
          </button>
        </div>
        
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse text-sm">
            <thead>
              <tr className="bg-primary/5 text-primary text-xs uppercase tracking-wider border-b border-primary/10">
                <th className="px-6 py-4 font-bold">Nama Anggota</th>
                <th className="px-6 py-4 font-bold text-right">Saldo Simpanan (Poin)</th>
                <th className="px-6 py-4 font-bold text-right">Nilai Transaksi (Poin)</th>
                <th className="px-6 py-4 font-bold text-emerald-600 text-right">Estimasi SHU Diterima</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {data.simulasi.map((sim, idx) => (
                <tr key={idx} className="hover:bg-white/40 transition-colors">
                  <td className="px-6 py-4 font-semibold text-slate-800">{sim.nama}</td>
                  <td className="px-6 py-4 text-right font-mono text-slate-600">{formatCurrency(sim.poinSimpanan)}</td>
                  <td className="px-6 py-4 text-right font-mono text-slate-600">{formatCurrency(sim.poinTransaksi)}</td>
                  <td className="px-6 py-4 text-right font-bold text-emerald-600 font-mono bg-emerald-50/30">{formatCurrency(sim.estimasiShu)}</td>
                </tr>
              ))}
              {data.simulasi.length === 0 && (
                <tr>
                  <td colSpan={4} className="px-6 py-8 text-center text-slate-500">Belum ada data anggota aktif.</td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
};

export default SHU;
