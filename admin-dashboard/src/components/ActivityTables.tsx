import React from 'react';
import { FileText, CheckCircle, XCircle } from 'lucide-react';

interface ActivityTablesProps {
  onOpenModal: () => void;
  pendingApprovals?: any[];
  recentActivities?: any[];
}

const ActivityTables: React.FC<ActivityTablesProps> = ({ onOpenModal, pendingApprovals = [], recentActivities = [] }) => {
  return (
    <div className="grid grid-cols-1 xl:grid-cols-2 gap-6">
      {/* Menunggu Persetujuan */}
      <div className="glass-panel p-6">
        <div className="flex justify-between items-center mb-6">
          <h3 className="font-outfit text-lg font-bold text-primary">Menunggu Persetujuan</h3>
          <button className="text-sm text-secondary hover:text-secondary-hover font-medium">Lihat Semua</button>
        </div>
        
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="border-b border-slate-100 text-slate-500 text-sm">
                <th className="pb-3 font-medium">ID Transaksi</th>
                <th className="pb-3 font-medium">Anggota</th>
                <th className="pb-3 font-medium">Tipe</th>
                <th className="pb-3 font-medium">Nominal</th>
                <th className="pb-3 font-medium text-right">Aksi</th>
              </tr>
            </thead>
            <tbody>
              {pendingApprovals.length === 0 ? (
                <tr>
                  <td colSpan={5} className="py-8 text-center text-slate-500">
                    Tidak ada persetujuan yang tertunda
                  </td>
                </tr>
              ) : (
                pendingApprovals.map((item, idx) => (
                  <tr key={idx} className="border-b border-slate-50 hover:bg-slate-50/50 transition-colors">
                    <td className="py-4 text-sm font-medium text-slate-700">{item.id}</td>
                    <td className="py-4 text-sm text-slate-600">
                      <div className="flex items-center gap-2">
                        <div className="w-8 h-8 rounded-full bg-slate-200 flex items-center justify-center text-xs font-bold text-slate-500">
                          {item.name.charAt(0)}
                        </div>
                        {item.name}
                      </div>
                    </td>
                    <td className="py-4">
                      <span className={`px-2 py-1 rounded-full text-xs font-medium ${item.type === 'Pinjaman' ? 'bg-amber-100 text-amber-700' : 'bg-emerald-100 text-emerald-700'}`}>
                        {item.type}
                      </span>
                    </td>
                    <td className="py-4 text-sm font-semibold text-slate-700">{item.amount}</td>
                    <td className="py-4 text-right">
                      <div className="flex justify-end gap-2">
                        <button 
                          onClick={onOpenModal}
                          className="p-1.5 text-slate-400 hover:text-primary bg-white shadow-sm border border-slate-200 rounded-md transition-colors"
                          title="Lihat Detail & Lampiran"
                        >
                          <FileText size={16} />
                        </button>
                      </div>
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
      </div>

      {/* Aktivitas Transaksi Terakhir */}
      <div className="glass-panel p-6">
        <div className="flex justify-between items-center mb-6">
          <h3 className="font-outfit text-lg font-bold text-primary">Aktivitas Transaksi Terakhir</h3>
        </div>
        
        <div className="space-y-6">
          {recentActivities.length === 0 ? (
            <div className="text-center text-slate-500 py-8">Belum ada aktivitas</div>
          ) : (
            recentActivities.map((activity) => (
              <div key={activity.id} className="flex items-start gap-4">
                <div className={`mt-1 flex-shrink-0 w-2.5 h-2.5 rounded-full ${activity.status === 'success' ? 'bg-emerald-500 shadow-[0_0_8px_rgba(16,185,129,0.5)]' : 'bg-amber-500 shadow-[0_0_8px_rgba(245,158,11,0.5)]'}`}></div>
                <div className="flex-1">
                  <p className="text-sm text-slate-700">
                    <span className="font-semibold">{activity.name}</span> {activity.action}
                  </p>
                  <p className="text-xs text-slate-400 mt-1">{new Date(activity.time).toLocaleString('id-ID')}</p>
                </div>
              </div>
            ))
          )}
          
          <div className="pt-4 border-t border-slate-100 text-center">
            <button className="text-sm text-primary font-medium hover:underline">Lihat Log Lengkap</button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ActivityTables;
