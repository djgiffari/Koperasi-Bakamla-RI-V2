import React, { useState } from 'react';
import { Users, Wallet, CreditCard, ShoppingBag, ArrowUpRight, ArrowDownRight, X } from 'lucide-react';
import { useNavigate } from 'react-router-dom';

interface MetricsCardsProps {
  metrics?: {
    totalAnggota: number;
    totalSimpanan: number;
    pinjamanAktif: number;
    omsetToko: number;
    simpananBreakdown?: {
      pokok: number;
      wajib: number;
      sukarela: number;
    };
  }
}

const MetricsCards: React.FC<MetricsCardsProps> = ({ metrics: apiMetrics }) => {
  const navigate = useNavigate();
  const [showSimpananDetail, setShowSimpananDetail] = useState(false);
  
  const displayMetrics = [
    {
      title: 'Total Anggota',
      value: apiMetrics?.totalAnggota?.toLocaleString('id-ID') || '0',
      trend: 'Total data anggota',
      isPositive: true,
      icon: Users,
      color: 'from-blue-500 to-blue-700',
      path: '/dashboard/anggota'
    },
    {
      title: 'Simpanan Keseluruhan',
      value: `Rp ${(apiMetrics?.totalSimpanan || 0).toLocaleString('id-ID')}`,
      trend: 'Klik untuk lihat detail',
      isPositive: true,
      icon: Wallet,
      color: 'from-secondary to-yellow-600',
      isSimpanan: true
    },
    {
      title: 'Pinjaman Aktif',
      value: `Rp ${(apiMetrics?.pinjamanAktif || 0).toLocaleString('id-ID')}`,
      trend: 'Total pinjaman disalurkan',
      isPositive: true,
      icon: CreditCard,
      color: 'from-emerald-500 to-emerald-700',
      path: '/dashboard/pinjaman'
    },
    {
      title: 'Omset Toko Koperasi',
      value: `Rp ${(apiMetrics?.omsetToko || 0).toLocaleString('id-ID')}`,
      trend: 'Data bulan ini',
      isPositive: true,
      icon: ShoppingBag,
      color: 'from-purple-500 to-purple-700',
      path: '/dashboard/pos'
    }
  ];

  return (
    <>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
        {displayMetrics.map((metric, index) => {
          const Icon = metric.icon;
          return (
            <div 
              key={index} 
              className="glass-panel p-6 relative overflow-hidden group cursor-pointer hover:shadow-xl hover:-translate-y-1 transition-all duration-300"
              onClick={() => {
                if (metric.isSimpanan) {
                  setShowSimpananDetail(true);
                } else if (metric.path) {
                  navigate(metric.path);
                }
              }}
            >
              {/* Abstract Background Icon */}
              <div className={`absolute -right-6 -top-6 w-24 h-24 rounded-full opacity-10 bg-gradient-to-br ${metric.color} transition-transform group-hover:scale-150`}></div>
              
              <div className="flex justify-between items-start mb-4">
                <div>
                  <p className="text-sm text-slate-500 font-medium mb-1">{metric.title}</p>
                  <h3 className="text-2xl font-bold text-primary font-outfit">{metric.value}</h3>
                </div>
                <div 
                  className={`p-3 rounded-xl bg-gradient-to-br ${metric.color} text-white shadow-lg transition-transform group-hover:scale-110 z-10`}
                >
                  <Icon size={24} />
                </div>
              </div>
              
              <div className="flex items-center gap-1.5 mt-4 z-10 relative">
                <span className={`flex items-center text-xs font-semibold ${metric.isPositive ? 'text-emerald-600' : 'text-red-500'}`}>
                  {metric.isPositive ? <ArrowUpRight size={14} /> : <ArrowDownRight size={14} />}
                  {metric.trend}
                </span>
              </div>
            </div>
          );
        })}
      </div>

      {/* Modal Detail Simpanan */}
      {showSimpananDetail && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-900/50 backdrop-blur-sm" onClick={() => setShowSimpananDetail(false)}>
          <div 
            className="bg-white rounded-2xl shadow-xl w-full max-w-sm overflow-hidden" 
            onClick={e => e.stopPropagation()}
          >
            <div className="p-5 border-b border-slate-100 flex justify-between items-center bg-slate-50">
              <h3 className="font-outfit font-bold text-lg text-primary flex items-center gap-2">
                <Wallet size={20} className="text-secondary" />
                Detail Simpanan
              </h3>
              <button 
                onClick={() => setShowSimpananDetail(false)}
                className="text-slate-400 hover:text-red-500 transition-colors"
              >
                <X size={20} />
              </button>
            </div>
            
            <div className="p-6 space-y-4">
              <div className="flex justify-between items-center p-3 bg-slate-50 rounded-xl">
                <span className="text-sm text-slate-500 font-medium">Simpanan Pokok</span>
                <span className="text-base font-bold text-slate-800">Rp {apiMetrics?.simpananBreakdown?.pokok.toLocaleString('id-ID') || 0}</span>
              </div>
              
              <div className="flex justify-between items-center p-3 bg-slate-50 rounded-xl">
                <span className="text-sm text-slate-500 font-medium">Simpanan Wajib</span>
                <span className="text-base font-bold text-slate-800">Rp {apiMetrics?.simpananBreakdown?.wajib.toLocaleString('id-ID') || 0}</span>
              </div>
              
              <div className="flex justify-between items-center p-3 bg-slate-50 rounded-xl">
                <span className="text-sm text-slate-500 font-medium">Simpanan Sukarela</span>
                <span className="text-base font-bold text-slate-800">Rp {apiMetrics?.simpananBreakdown?.sukarela.toLocaleString('id-ID') || 0}</span>
              </div>
              
              <div className="pt-4 mt-2 border-t border-slate-100 flex justify-between items-center">
                <span className="text-sm font-bold text-primary">Total Simpanan</span>
                <span className="text-lg font-bold text-secondary">Rp {(apiMetrics?.totalSimpanan || 0).toLocaleString('id-ID')}</span>
              </div>
            </div>
            
            <div className="p-4 border-t border-slate-100 bg-slate-50 flex gap-3">
              <button 
                onClick={() => navigate('/dashboard/simpanan')}
                className="flex-1 py-2.5 bg-white border border-slate-200 text-slate-600 rounded-lg text-sm font-medium hover:bg-slate-50 hover:text-primary transition-colors"
              >
                Ke Menu Simpanan
              </button>
              <button 
                onClick={() => setShowSimpananDetail(false)}
                className="flex-1 py-2.5 bg-primary text-white rounded-lg text-sm font-medium hover:bg-primary-dark transition-colors"
              >
                Tutup
              </button>
            </div>
          </div>
        </div>
      )}
    </>
  );
};

export default MetricsCards;
