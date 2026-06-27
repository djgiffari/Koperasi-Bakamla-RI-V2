import React from 'react';
import { Activity, Clock, Terminal } from 'lucide-react';

const logs = [
  { id: 1, action: 'Membuat Simpanan Baru SMP-001', user: 'Admin Giffari', time: '10:45:12 - 27 Jun 2026', type: 'CREATE' },
  { id: 2, action: 'Menyetujui Pinjaman PNJ-002', user: 'Admin Giffari', time: '09:30:00 - 27 Jun 2026', type: 'UPDATE' },
  { id: 3, action: 'Login ke Sistem', user: 'Admin Giffari', time: '08:15:33 - 27 Jun 2026', type: 'LOGIN' },
  { id: 4, action: 'Menghapus Data Anggota ANG-005', user: 'Bapak Ketua', time: '16:20:11 - 26 Jun 2026', type: 'DELETE' },
];

const SystemLogs: React.FC = () => {
  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
        <div>
          <h1 className="text-3xl font-bold text-primary font-outfit flex items-center gap-3">
            <Activity size={32} className="text-secondary" />
            System Logs
          </h1>
          <p className="text-slate-500 mt-1">Pantau seluruh aktivitas pengguna pada Dashboard Koperasi.</p>
        </div>
      </div>

      <div className="glass-panel overflow-hidden">
        <div className="p-4 bg-slate-800 text-slate-300 font-mono text-xs flex items-center gap-2 border-b border-slate-700">
          <Terminal size={14} className="text-emerald-400" /> Server Logs Viewer - Koperasi Bakamla RI
        </div>
        <div className="overflow-x-auto bg-slate-900 p-4 min-h-[400px]">
          <table className="w-full text-left border-collapse text-xs font-mono">
            <tbody className="divide-y divide-slate-800">
              {logs.map(log => (
                <tr key={log.id} className="hover:bg-slate-800/50 transition-colors">
                  <td className="px-4 py-3 text-slate-500 w-48 flex items-center gap-2">
                    <Clock size={12} /> {log.time}
                  </td>
                  <td className="px-4 py-3">
                    <span className={`px-2 py-0.5 rounded text-[9px] font-bold uppercase mr-3 ${
                      log.type === 'DELETE' ? 'bg-red-950 text-red-400' :
                      log.type === 'UPDATE' ? 'bg-blue-950 text-blue-400' :
                      log.type === 'CREATE' ? 'bg-emerald-950 text-emerald-400' : 'bg-slate-700 text-slate-300'
                    }`}>
                      {log.type}
                    </span>
                    <span className="text-slate-300">{log.action}</span>
                  </td>
                  <td className="px-4 py-3 text-right text-secondary">[{log.user}]</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
};

export default SystemLogs;
