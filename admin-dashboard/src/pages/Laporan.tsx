import React, { useState } from 'react';
import { FileText, Download, Calendar, Filter, PieChart, TrendingUp, TrendingDown, DollarSign } from 'lucide-react';
import { toast } from '../lib/toast';
import EmptyState from '../components/EmptyState';
import { api } from '../lib/api';

const Laporan: React.FC = () => {
  const [reportType, setReportType] = useState('semua');
  const [startDate, setStartDate] = useState('');
  const [endDate, setEndDate] = useState('');
  
  const [jurnalData, setJurnalData] = useState<any[]>([]);
  const [summaryData, setSummaryData] = useState<any>(null);
  const [isGenerated, setIsGenerated] = useState(false);

  const formatCurrency = (val: number) => {
    return new Intl.NumberFormat('id-ID', { style: 'currency', currency: 'IDR' }).format(val);
  };

  const handleGenerate = async () => {
    try {
      let url = `/laporan?`;
      if (startDate && endDate) url += `startDate=${startDate}&endDate=${endDate}&`;
      if (reportType === 'pemasukan') url += `jenis=DEBIT&`;
      if (reportType === 'pengeluaran') url += `jenis=KREDIT&`;

      const data = await api.get(url);
      setJurnalData(data.jurnal || []);
      setSummaryData({
        kasSekarang: data.kasSekarang || 0,
        totalPemasukan: data.totalPemasukan || 0,
        totalPengeluaran: data.totalPengeluaran || 0
      });
      setIsGenerated(true);
      toast.success('Laporan berhasil digenerate');
    } catch (error) {
      toast.error('Gagal mengambil data laporan');
    }
  };

  const downloadCSV = () => {
    if (jurnalData.length === 0) {
      toast.error('Tidak ada data untuk diunduh');
      return;
    }

    const headers = ['Tanggal', 'Keterangan', 'Jenis', 'Nominal', 'Saldo Setelahnya'];
    const rows = jurnalData.map(j => [
      new Date(j.tanggal).toLocaleString('id-ID'),
      j.keterangan.replace(/,/g, ''), // escape commas
      j.jenis,
      j.nominal,
      j.saldoSetelahnya
    ]);

    const csvContent = "data:text/csv;charset=utf-8," 
      + headers.join(",") + "\n"
      + rows.map(e => e.join(",")).join("\n");

    const encodedUri = encodeURI(csvContent);
    const link = document.createElement("a");
    link.setAttribute("href", encodedUri);
    link.setAttribute("download", `laporan_koperasi_${new Date().getTime()}.csv`);
    document.body.appendChild(link);
    link.click();
    link.remove();
    toast.success('Laporan berhasil diunduh (CSV)');
  };

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
        <div>
          <h1 className="text-3xl font-bold text-primary font-outfit flex items-center gap-3">
            <FileText size={32} className="text-secondary" />
            Laporan Keuangan
          </h1>
          <p className="text-slate-500 mt-1">Generate dan unduh rekap jurnal keuangan koperasi.</p>
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
        {/* Filter Panel */}
        <div className="bg-white/60 border border-white rounded-2xl p-6 shadow-sm h-fit space-y-4">
          <h3 className="font-bold text-primary uppercase text-xs flex items-center gap-2 mb-2"><Filter size={14}/> Filter Laporan</h3>
          
          <div>
            <label className="block text-xs font-semibold text-slate-500 mb-1">Jenis Transaksi</label>
            <select 
              value={reportType} onChange={e => setReportType(e.target.value)}
              className="w-full bg-white border border-slate-200 rounded-xl px-3 py-2 text-sm outline-none focus:border-secondary"
            >
              <option value="semua">Semua (Buku Besar)</option>
              <option value="pemasukan">Pemasukan Saja (Debit)</option>
              <option value="pengeluaran">Pengeluaran Saja (Kredit)</option>
            </select>
          </div>
          <div>
            <label className="block text-xs font-semibold text-slate-500 mb-1">Tanggal Mulai</label>
            <input type="date" value={startDate} onChange={e => setStartDate(e.target.value)} className="w-full bg-white border border-slate-200 rounded-xl px-3 py-2 text-sm outline-none focus:border-secondary" />
          </div>
          <div>
            <label className="block text-xs font-semibold text-slate-500 mb-1">Tanggal Akhir</label>
            <input type="date" value={endDate} onChange={e => setEndDate(e.target.value)} className="w-full bg-white border border-slate-200 rounded-xl px-3 py-2 text-sm outline-none focus:border-secondary" />
          </div>

          <div className="pt-2">
            <button onClick={handleGenerate} className="w-full btn btn-primary flex justify-center items-center gap-2">
              <PieChart size={14} /> Generate Data
            </button>
            <button onClick={downloadCSV} className="w-full mt-2 bg-emerald-100 text-emerald-700 hover:bg-emerald-200 font-bold py-2 rounded-xl text-sm flex justify-center items-center gap-2 transition-colors">
              <Download size={14} /> Unduh CSV
            </button>
          </div>
        </div>

        {/* Report Preview */}
        <div className="md:col-span-3 glass-panel p-6 min-h-[400px]">
          {!isGenerated ? (
            <div className="h-full flex flex-col justify-center">
              <EmptyState 
                icon={Calendar} 
                title="Pilih filter laporan" 
                description="Silakan atur jenis laporan dan rentang tanggal di panel sebelah kiri lalu klik 'Generate Data'."
              />
            </div>
          ) : (
            <div className="space-y-6">
              <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                <div className="bg-blue-50 border border-blue-100 p-4 rounded-xl">
                  <div className="flex items-center gap-2 text-blue-600 mb-1"><DollarSign size={16} /> <span className="text-xs font-bold uppercase">Saldo Kas Saat Ini</span></div>
                  <div className="text-xl font-bold text-slate-800 font-mono">{formatCurrency(summaryData?.kasSekarang)}</div>
                </div>
                <div className="bg-emerald-50 border border-emerald-100 p-4 rounded-xl">
                  <div className="flex items-center gap-2 text-emerald-600 mb-1"><TrendingUp size={16} /> <span className="text-xs font-bold uppercase">Total Pemasukan</span></div>
                  <div className="text-xl font-bold text-slate-800 font-mono">{formatCurrency(summaryData?.totalPemasukan)}</div>
                </div>
                <div className="bg-red-50 border border-red-100 p-4 rounded-xl">
                  <div className="flex items-center gap-2 text-red-600 mb-1"><TrendingDown size={16} /> <span className="text-xs font-bold uppercase">Total Pengeluaran</span></div>
                  <div className="text-xl font-bold text-slate-800 font-mono">{formatCurrency(summaryData?.totalPengeluaran)}</div>
                </div>
              </div>

              <div className="overflow-x-auto">
                <table className="w-full text-left border-collapse text-sm">
                  <thead>
                    <tr className="bg-slate-50 text-slate-500 text-xs uppercase">
                      <th className="px-4 py-3 font-bold border-b border-slate-200">Tanggal</th>
                      <th className="px-4 py-3 font-bold border-b border-slate-200">Keterangan</th>
                      <th className="px-4 py-3 font-bold border-b border-slate-200">D/K</th>
                      <th className="px-4 py-3 font-bold border-b border-slate-200 text-right">Nominal</th>
                      <th className="px-4 py-3 font-bold border-b border-slate-200 text-right">Saldo</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-slate-100">
                    {jurnalData.map((jurnal, idx) => (
                      <tr key={idx} className="hover:bg-slate-50">
                        <td className="px-4 py-3 text-slate-500 text-xs">{new Date(jurnal.tanggal).toLocaleString('id-ID')}</td>
                        <td className="px-4 py-3 font-medium text-slate-700 text-xs">{jurnal.keterangan}</td>
                        <td className="px-4 py-3">
                          <span className={`px-2 py-0.5 rounded text-[10px] font-bold ${jurnal.jenis === 'DEBIT' ? 'bg-emerald-100 text-emerald-700' : 'bg-red-100 text-red-700'}`}>
                            {jurnal.jenis}
                          </span>
                        </td>
                        <td className="px-4 py-3 text-right font-mono font-bold text-slate-800">{formatCurrency(jurnal.nominal)}</td>
                        <td className="px-4 py-3 text-right font-mono text-slate-500 text-xs">{formatCurrency(jurnal.saldoSetelahnya)}</td>
                      </tr>
                    ))}
                    {jurnalData.length === 0 && (
                      <tr>
                        <td colSpan={5} className="text-center p-6 text-slate-400">Tidak ada transaksi ditemukan</td>
                      </tr>
                    )}
                  </tbody>
                </table>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default Laporan;
