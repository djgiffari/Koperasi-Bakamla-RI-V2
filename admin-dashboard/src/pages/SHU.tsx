import React from 'react';
import { Landmark, Calculator, Users, DollarSign } from 'lucide-react';

const SHU: React.FC = () => {
  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
        <div>
          <h1 className="text-3xl font-bold text-primary font-outfit flex items-center gap-3">
            <Landmark size={32} className="text-secondary" />
            Sisa Hasil Usaha (SHU)
          </h1>
          <p className="text-slate-500 mt-1">Kalkulasi dan pembagian SHU kepada anggota Koperasi.</p>
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <div className="glass-card p-6">
          <div className="flex justify-between items-center mb-4">
            <h3 className="font-bold text-slate-200">Total Laba Bersih (Tahun Berjalan)</h3>
            <div className="p-2 bg-emerald-100 text-emerald-600 rounded-lg"><DollarSign size={20} /></div>
          </div>
          <h2 className="text-3xl font-bold text-white">Rp 150.000.000</h2>
        </div>
        <div className="glass-card p-6">
          <div className="flex justify-between items-center mb-4">
            <h3 className="font-bold text-slate-200">Persentase Alokasi SHU Anggota</h3>
            <div className="p-2 bg-blue-100 text-blue-600 rounded-lg"><Calculator size={20} /></div>
          </div>
          <h2 className="text-3xl font-bold text-white">40%</h2>
        </div>
        <div className="glass-card p-6">
          <div className="flex justify-between items-center mb-4">
            <h3 className="font-bold text-slate-200">Total Anggota Aktif</h3>
            <div className="p-2 bg-purple-100 text-purple-600 rounded-lg"><Users size={20} /></div>
          </div>
          <h2 className="text-3xl font-bold text-white">240 Orang</h2>
        </div>
      </div>

      <div className="glass-panel p-6">
        <h3 className="font-bold text-primary mb-4">Simulasi Pembagian SHU</h3>
        <p className="text-sm text-slate-500 mb-6">Pembagian didasarkan pada besaran simpanan (pokok & wajib) serta transaksi (pinjaman/toko) masing-masing anggota.</p>
        
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse text-sm">
            <thead>
              <tr className="bg-primary/5 text-primary text-xs uppercase tracking-wider border-b border-primary/10">
                <th className="px-6 py-4 font-bold">Nama Anggota</th>
                <th className="px-6 py-4 font-bold">Poin Simpanan</th>
                <th className="px-6 py-4 font-bold">Poin Transaksi</th>
                <th className="px-6 py-4 font-bold">Total Poin</th>
                <th className="px-6 py-4 font-bold text-emerald-600 text-right">Estimasi SHU Diterima</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              <tr className="hover:bg-white/40">
                <td className="px-6 py-4 font-semibold text-slate-800">Budi Santoso</td>
                <td className="px-6 py-4 text-slate-600">450</td>
                <td className="px-6 py-4 text-slate-600">120</td>
                <td className="px-6 py-4 font-bold text-slate-700">570</td>
                <td className="px-6 py-4 text-right font-bold text-emerald-600">Rp 1.250.000</td>
              </tr>
              <tr className="hover:bg-white/40">
                <td className="px-6 py-4 font-semibold text-slate-800">Siti Aminah</td>
                <td className="px-6 py-4 text-slate-600">300</td>
                <td className="px-6 py-4 text-slate-600">50</td>
                <td className="px-6 py-4 font-bold text-slate-700">350</td>
                <td className="px-6 py-4 text-right font-bold text-emerald-600">Rp 840.000</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
};

export default SHU;
