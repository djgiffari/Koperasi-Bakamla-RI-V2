import React from 'react';
import { Users, Wallet, CreditCard, ShoppingBag, ArrowUpRight, ArrowDownRight } from 'lucide-react';

interface MetricsCardsProps {
  metrics?: {
    totalAnggota: number;
    totalSimpanan: number;
    pinjamanAktif: number;
    omsetToko: number;
  }
}

const MetricsCards: React.FC<MetricsCardsProps> = ({ metrics: apiMetrics }) => {
  const displayMetrics = [
    {
      title: 'Total Anggota',
      value: apiMetrics?.totalAnggota?.toLocaleString('id-ID') || '0',
      trend: 'Total data anggota',
      isPositive: true,
      icon: Users,
      color: 'from-blue-500 to-blue-700'
    },
    {
      title: 'Simpanan Keseluruhan',
      value: `Rp ${((apiMetrics?.totalSimpanan || 0) / 1000000).toFixed(1)}M`,
      trend: 'Total saldo simpanan',
      isPositive: true,
      icon: Wallet,
      color: 'from-secondary to-yellow-600'
    },
    {
      title: 'Pinjaman Aktif',
      value: `Rp ${((apiMetrics?.pinjamanAktif || 0) / 1000000).toFixed(1)}M`,
      trend: 'Total pinjaman disalurkan',
      isPositive: true,
      icon: CreditCard,
      color: 'from-emerald-500 to-emerald-700'
    },
    {
      title: 'Omset Toko Koperasi',
      value: `Rp ${((apiMetrics?.omsetToko || 0) / 1000000).toFixed(1)}M`,
      trend: 'Data bulan ini',
      isPositive: true,
      icon: ShoppingBag,
      color: 'from-purple-500 to-purple-700'
    }
  ];

  return (
    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
      {displayMetrics.map((metric, index) => {
        const Icon = metric.icon;
        return (
          <div key={index} className="glass-panel p-6 relative overflow-hidden group">
            {/* Abstract Background Icon */}
            <div className={`absolute -right-6 -top-6 w-24 h-24 rounded-full opacity-10 bg-gradient-to-br ${metric.color} transition-transform group-hover:scale-150`}></div>
            
            <div className="flex justify-between items-start mb-4">
              <div>
                <p className="text-sm text-slate-500 font-medium mb-1">{metric.title}</p>
                <h3 className="text-2xl font-bold text-primary font-outfit">{metric.value}</h3>
              </div>
              <div className={`p-3 rounded-xl bg-gradient-to-br ${metric.color} text-white shadow-lg`}>
                <Icon size={24} />
              </div>
            </div>
            
            <div className="flex items-center gap-1.5 mt-4">
              <span className={`flex items-center text-xs font-semibold ${metric.isPositive ? 'text-emerald-600' : 'text-red-500'}`}>
                {metric.isPositive ? <ArrowUpRight size={14} /> : <ArrowDownRight size={14} />}
                {metric.trend}
              </span>
            </div>
          </div>
        );
      })}
    </div>
  );
};

export default MetricsCards;
