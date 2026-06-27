import React, { useState, useEffect } from 'react';
import { Activity, Clock, Terminal } from 'lucide-react';
import { api } from '../lib/api';

const SystemLogs: React.FC = () => {
  const [logs, setLogs] = useState<any[]>([]);

  useEffect(() => {
    const fetchLogs = async () => {
      try {
        const data = await api.get('/logs');
        setLogs(data);
      } catch (error) {
        console.error('Error fetching logs', error);
      }
    };
    fetchLogs();
  }, []);

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
              {logs.map(log => {
                const actionType = log.action.split(' ')[0]; // GET, POST, PUT, DELETE
                const logTime = new Date(log.createdAt).toLocaleString('id-ID', {
                  hour: '2-digit', minute: '2-digit', second: '2-digit',
                  day: '2-digit', month: 'short', year: 'numeric'
                });

                return (
                  <tr key={log.id} className="hover:bg-slate-800/50 transition-colors">
                    <td className="px-4 py-3 text-slate-500 w-56 flex items-center gap-2">
                      <Clock size={12} /> {logTime}
                    </td>
                    <td className="px-4 py-3">
                      <span className={`px-2 py-0.5 rounded text-[9px] font-bold uppercase mr-3 ${
                        actionType === 'DELETE' ? 'bg-red-950 text-red-400' :
                        actionType === 'PUT' ? 'bg-blue-950 text-blue-400' :
                        actionType === 'POST' ? 'bg-emerald-950 text-emerald-400' : 'bg-slate-700 text-slate-300'
                      }`}>
                        {actionType}
                      </span>
                      <span className="text-slate-300">
                        {log.action} {log.entityName} {log.entityId !== 'UNKNOWN' ? `(ID: ${log.entityId})` : ''}
                      </span>
                    </td>
                    <td className="px-4 py-3 text-right text-secondary">[{log.user?.name || log.userId || 'SYSTEM'}]</td>
                  </tr>
                );
              })}
              {logs.length === 0 && (
                <tr>
                  <td colSpan={3} className="px-4 py-8 text-center text-slate-500">
                    Tidak ada log aktivitas.
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
};

export default SystemLogs;
