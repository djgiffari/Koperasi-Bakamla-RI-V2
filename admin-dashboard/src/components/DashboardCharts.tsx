import React from 'react';
import {
  AreaChart,
  Area,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
  BarChart,
  Bar,
  Legend
} from 'recharts';

const cashflowData = [
  { name: 'Jan', Pemasukan: 400, Pengeluaran: 240 },
  { name: 'Feb', Pemasukan: 300, Pengeluaran: 139 },
  { name: 'Mar', Pemasukan: 200, Pengeluaran: 980 },
  { name: 'Apr', Pemasukan: 278, Pengeluaran: 390 },
  { name: 'Mei', Pemasukan: 189, Pengeluaran: 480 },
  { name: 'Jun', Pemasukan: 239, Pengeluaran: 380 },
  { name: 'Jul', Pemasukan: 349, Pengeluaran: 430 },
];

const salesData = [
  { name: 'Sen', Penjualan: 4000 },
  { name: 'Sel', Penjualan: 3000 },
  { name: 'Rab', Penjualan: 2000 },
  { name: 'Kam', Penjualan: 2780 },
  { name: 'Jum', Penjualan: 1890 },
  { name: 'Sab', Penjualan: 2390 },
  { name: 'Min', Penjualan: 3490 },
];

const DashboardCharts: React.FC = () => {
  return (
    <div className="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-8">
      {/* Arus Kas Chart */}
      <div className="glass-panel p-6 lg:col-span-2">
        <div className="flex justify-between items-center mb-6">
          <div>
            <h3 className="font-outfit text-lg font-bold text-primary">Arus Kas Koperasi</h3>
            <p className="text-sm text-slate-500">Pemasukan vs Pengeluaran 7 bulan terakhir</p>
          </div>
          <select className="bg-slate-50 border border-slate-200 text-slate-700 text-sm rounded-lg focus:ring-secondary focus:border-secondary block p-2">
            <option>Tahun Ini</option>
            <option>Tahun Lalu</option>
          </select>
        </div>
        
        <div className="h-[300px] w-full">
          <ResponsiveContainer width="100%" height="100%">
            <BarChart data={cashflowData} margin={{ top: 10, right: 10, left: -20, bottom: 0 }}>
              <CartesianGrid strokeDasharray="3 3" vertical={false} stroke="#E2E8F0" />
              <XAxis dataKey="name" axisLine={false} tickLine={false} tick={{ fill: '#64748B', fontSize: 12 }} dy={10} />
              <YAxis axisLine={false} tickLine={false} tick={{ fill: '#64748B', fontSize: 12 }} />
              <Tooltip 
                cursor={{ fill: '#F1F5F9' }}
                contentStyle={{ borderRadius: '12px', border: 'none', boxShadow: '0 10px 25px rgba(0,0,0,0.1)' }}
              />
              <Legend iconType="circle" wrapperStyle={{ paddingTop: '20px' }} />
              <Bar dataKey="Pemasukan" fill="#0B1E36" radius={[4, 4, 0, 0]} barSize={30} />
              <Bar dataKey="Pengeluaran" fill="#D4AF37" radius={[4, 4, 0, 0]} barSize={30} />
            </BarChart>
          </ResponsiveContainer>
        </div>
      </div>

      {/* Omset Toko Chart */}
      <div className="glass-panel p-6">
        <div className="mb-6">
          <h3 className="font-outfit text-lg font-bold text-primary">Tren Omset Toko</h3>
          <p className="text-sm text-slate-500">7 Hari Terakhir</p>
        </div>
        
        <div className="h-[300px] w-full">
          <ResponsiveContainer width="100%" height="100%">
            <AreaChart data={salesData} margin={{ top: 10, right: 0, left: -30, bottom: 0 }}>
              <defs>
                <linearGradient id="colorSales" x1="0" y1="0" x2="0" y2="1">
                  <stop offset="5%" stopColor="#1A365D" stopOpacity={0.3}/>
                  <stop offset="95%" stopColor="#1A365D" stopOpacity={0}/>
                </linearGradient>
              </defs>
              <CartesianGrid strokeDasharray="3 3" vertical={false} stroke="#E2E8F0" />
              <XAxis dataKey="name" axisLine={false} tickLine={false} tick={{ fill: '#64748B', fontSize: 12 }} dy={10} />
              <YAxis axisLine={false} tickLine={false} tick={{ fill: '#64748B', fontSize: 12 }} />
              <Tooltip 
                contentStyle={{ borderRadius: '12px', border: 'none', boxShadow: '0 10px 25px rgba(0,0,0,0.1)' }}
              />
              <Area type="monotone" dataKey="Penjualan" stroke="#1A365D" strokeWidth={3} fillOpacity={1} fill="url(#colorSales)" />
            </AreaChart>
          </ResponsiveContainer>
        </div>
      </div>
    </div>
  );
};

export default DashboardCharts;
