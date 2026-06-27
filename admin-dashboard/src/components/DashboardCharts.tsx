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

interface DashboardChartsProps {
  charts?: {
    cashflow: any[];
    sales: any[];
  },
  availableYears?: number[];
  selectedYear?: number | null;
  onYearChange?: (year: number | null) => void;
}

const defaultCashflowData = [
  { name: 'Jan', Pemasukan: 0, Pengeluaran: 0 },
  { name: 'Feb', Pemasukan: 0, Pengeluaran: 0 },
  { name: 'Mar', Pemasukan: 0, Pengeluaran: 0 },
  { name: 'Apr', Pemasukan: 0, Pengeluaran: 0 },
  { name: 'Mei', Pemasukan: 0, Pengeluaran: 0 },
  { name: 'Jun', Pemasukan: 0, Pengeluaran: 0 },
  { name: 'Jul', Pemasukan: 0, Pengeluaran: 0 },
];

const defaultSalesData = [
  { name: 'Sen', Penjualan: 0 },
  { name: 'Sel', Penjualan: 0 },
  { name: 'Rab', Penjualan: 0 },
  { name: 'Kam', Penjualan: 0 },
  { name: 'Jum', Penjualan: 0 },
  { name: 'Sab', Penjualan: 0 },
  { name: 'Min', Penjualan: 0 },
];

const DashboardCharts: React.FC<DashboardChartsProps> = ({ charts, availableYears = [], selectedYear, onYearChange }) => {
  const cashflowData = charts?.cashflow?.length ? charts.cashflow : defaultCashflowData;
  const salesData = charts?.sales?.length ? charts.sales : defaultSalesData;

  return (
    <div className="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-8">
      {/* Arus Kas Chart */}
      <div className="glass-panel p-6 lg:col-span-2">
        <div className="flex justify-between items-center mb-6">
          <div>
            <h3 className="font-outfit text-lg font-bold text-primary">Arus Kas Koperasi</h3>
            <p className="text-sm text-slate-500">Pemasukan vs Pengeluaran {selectedYear ? `Tahun ${selectedYear}` : '7 bulan terakhir'}</p>
          </div>
          {availableYears.length > 0 && (
            <select 
              className="bg-slate-50 border border-slate-200 text-slate-700 text-sm rounded-lg focus:ring-secondary focus:border-secondary block p-2"
              value={selectedYear || ''}
              onChange={(e) => onYearChange && onYearChange(e.target.value ? parseInt(e.target.value) : null)}
            >
              <option value="">Terbaru (7 Bulan)</option>
              {availableYears.map(year => (
                <option key={year} value={year}>{year}</option>
              ))}
            </select>
          )}
        </div>
        
        <div className="h-[300px] w-full">
          <ResponsiveContainer width="100%" height="100%">
            <BarChart data={cashflowData} margin={{ top: 10, right: 10, left: 0, bottom: 0 }}>
              <CartesianGrid strokeDasharray="3 3" vertical={false} stroke="#E2E8F0" />
              <XAxis dataKey="name" axisLine={false} tickLine={false} tick={{ fill: '#64748B', fontSize: 12 }} dy={10} />
              <YAxis 
                axisLine={false} 
                tickLine={false} 
                tick={{ fill: '#64748B', fontSize: 12 }} 
                width={65}
                tickFormatter={(value) => new Intl.NumberFormat('id-ID', { notation: "compact", compactDisplay: "short" }).format(value)}
              />
              <Tooltip 
                cursor={{ fill: '#F1F5F9' }}
                contentStyle={{ borderRadius: '12px', border: 'none', boxShadow: '0 10px 25px rgba(0,0,0,0.1)' }}
                formatter={(value: number, name: string) => [
                  `Rp ${value.toLocaleString('id-ID')}`, 
                  name === 'Simpanan' ? 'Setoran Simpanan' : 
                  name === 'Angsuran' ? 'Angsuran Pinjaman' : name
                ]}
              />
              <Legend 
                iconType="circle" 
                wrapperStyle={{ paddingTop: '20px' }} 
                formatter={(value) => {
                  if (value === 'Simpanan') return 'Setoran Simpanan';
                  if (value === 'Angsuran') return 'Angsuran Pinjaman';
                  return value;
                }}
              />
              <Bar dataKey="Simpanan" stackId="pemasukan" fill="#0B1E36" barSize={30} />
              <Bar dataKey="Angsuran" stackId="pemasukan" fill="#3B82F6" radius={[4, 4, 0, 0]} barSize={30} />
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
            <AreaChart data={salesData} margin={{ top: 10, right: 0, left: 0, bottom: 0 }}>
              <defs>
                <linearGradient id="colorSales" x1="0" y1="0" x2="0" y2="1">
                  <stop offset="5%" stopColor="#1A365D" stopOpacity={0.3}/>
                  <stop offset="95%" stopColor="#1A365D" stopOpacity={0}/>
                </linearGradient>
              </defs>
              <CartesianGrid strokeDasharray="3 3" vertical={false} stroke="#E2E8F0" />
              <XAxis dataKey="name" axisLine={false} tickLine={false} tick={{ fill: '#64748B', fontSize: 12 }} dy={10} />
              <YAxis 
                axisLine={false} 
                tickLine={false} 
                tick={{ fill: '#64748B', fontSize: 12 }} 
                width={65}
                tickFormatter={(value) => new Intl.NumberFormat('id-ID', { notation: "compact", compactDisplay: "short" }).format(value)}
              />
              <Tooltip 
                contentStyle={{ borderRadius: '12px', border: 'none', boxShadow: '0 10px 25px rgba(0,0,0,0.1)' }}
                formatter={(value: number) => [`Rp ${value.toLocaleString('id-ID')}`, 'Omset']}
              />
              <Area 
                type="monotone" 
                dataKey="Penjualan" 
                stroke="#1A365D" 
                strokeWidth={3} 
                fillOpacity={1} 
                fill="url(#colorSales)" 
              />
            </AreaChart>
          </ResponsiveContainer>
        </div>
      </div>
    </div>
  );
};

export default DashboardCharts;
