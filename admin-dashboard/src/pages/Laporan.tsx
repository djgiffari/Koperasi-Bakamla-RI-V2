import React, { useState } from 'react';
import { FileText, Download, Calendar, Filter, PieChart, TrendingUp } from 'lucide-react';
import { toast } from '../lib/toast';
import EmptyState from '../components/EmptyState';

const Laporan: React.FC = () => {
  const [reportType, setReportType] = useState('simpanan');

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
        <div>
          <h1 className="text-3xl font-bold text-primary font-outfit flex items-center gap-3">
            <FileText size={32} className="text-secondary" />
            Laporan Keuangan
          </h1>
          <p className="text-slate-500 mt-1">Generate dan unduh laporan aktivitas koperasi.</p>
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
        {/* Filter Panel */}
        <div className="bg-white/60 border border-white rounded-2xl p-6 shadow-sm h-fit space-y-4">
          <h3 className="font-bold text-primary uppercase text-xs flex items-center gap-2 mb-2"><Filter size={14}/> Filter Laporan</h3>
          
          <div>
            <label className="block text-xs font-semibold text-slate-500 mb-1">Jenis Laporan</label>
            <select 
              value={reportType} onChange={e => setReportType(e.target.value)}
              className="w-full bg-white border border-slate-200 rounded-xl px-3 py-2 text-sm outline-none focus:border-secondary"
            >
              <option value="simpanan">Laporan Simpanan</option>
              <option value="pinjaman">Laporan Pinjaman</option>
              <option value="toko">Laporan Toko / POS</option>
            </select>
          </div>
          <div>
            <label className="block text-xs font-semibold text-slate-500 mb-1">Tanggal Mulai</label>
            <input type="date" className="w-full bg-white border border-slate-200 rounded-xl px-3 py-2 text-sm outline-none focus:border-secondary" />
          </div>
          <div>
            <label className="block text-xs font-semibold text-slate-500 mb-1">Tanggal Akhir</label>
            <input type="date" className="w-full bg-white border border-slate-200 rounded-xl px-3 py-2 text-sm outline-none focus:border-secondary" />
          </div>

          <div className="pt-2">
            <button onClick={() => toast.info('Memproses data laporan...')} className="w-full btn btn-primary flex justify-center items-center gap-2">
              <PieChart size={14} /> Generate Data
            </button>
            <button onClick={() => toast.success('Laporan berhasil diunduh ke format Excel.')} className="w-full mt-2 bg-emerald-100 text-emerald-700 hover:bg-emerald-200 font-bold py-2 rounded-xl text-sm flex justify-center items-center gap-2 transition-colors">
              <Download size={14} /> Unduh Excel
            </button>
          </div>
        </div>

        {/* Report Preview */}
        <div className="md:col-span-3 glass-panel p-6 min-h-[400px] flex flex-col justify-center">
           <EmptyState 
            icon={Calendar} 
            title="Pilih filter laporan" 
            description="Silakan atur jenis laporan dan rentang tanggal di panel sebelah kiri lalu klik 'Generate Data'."
          />
        </div>
      </div>
    </div>
  );
};

export default Laporan;
