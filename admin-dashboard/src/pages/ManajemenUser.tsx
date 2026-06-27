import React, { useState } from 'react';
import { Shield, Plus, Trash2, Key } from 'lucide-react';
import ConfirmDialog from '../components/ConfirmDialog';
import { toast } from '../lib/toast';

const initialUsers = [
  { id: 'USR-01', username: 'admin1', role: 'Super Admin', name: 'Giffari', lastLogin: 'Hari ini, 10:00' },
  { id: 'USR-02', username: 'bendahara_kop', role: 'Bendahara', name: 'Siti Bendahara', lastLogin: 'Kemarin, 14:20' },
  { id: 'USR-03', username: 'ketua_kop', role: 'Ketua Koperasi', name: 'Bapak Ketua', lastLogin: '2 hari lalu' },
];

const ManajemenUser: React.FC = () => {
  const [users, setUsers] = useState(initialUsers);
  const [isConfirmOpen, setIsConfirmOpen] = useState(false);
  const [deleteId, setDeleteId] = useState('');

  const handleDelete = (id: string) => {
    setDeleteId(id);
    setIsConfirmOpen(true);
  };

  const confirmDelete = () => {
    setUsers(users.filter(u => u.id !== deleteId));
    setIsConfirmOpen(false);
  };

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
        <div>
          <h1 className="text-3xl font-bold text-primary font-outfit flex items-center gap-3">
            <Shield size={32} className="text-secondary" />
            Manajemen User (Admin)
          </h1>
          <p className="text-slate-500 mt-1">Kelola hak akses pengguna Dashboard Koperasi.</p>
        </div>
        <button onClick={() => toast.info('Fitur Tambah Admin segera hadir.')} className="btn btn-primary flex items-center gap-2">
          <Plus size={16} /> Tambah Admin
        </button>
      </div>

      <div className="glass-panel overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse text-sm">
            <thead>
              <tr className="bg-primary/5 text-primary text-xs uppercase tracking-wider border-b border-primary/10">
                <th className="px-6 py-4 font-bold">Username</th>
                <th className="px-6 py-4 font-bold">Nama Pengguna</th>
                <th className="px-6 py-4 font-bold">Role Akses</th>
                <th className="px-6 py-4 font-bold">Login Terakhir</th>
                <th className="px-6 py-4 text-center font-bold">Aksi</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {users.map(user => (
                <tr key={user.id} className="hover:bg-white/40">
                  <td className="px-6 py-4 font-bold text-slate-800">{user.username}</td>
                  <td className="px-6 py-4 text-slate-600">{user.name}</td>
                  <td className="px-6 py-4">
                    <span className={`px-2.5 py-1 rounded-md text-[10px] font-bold uppercase ${
                      user.role === 'Super Admin' ? 'bg-purple-100 text-purple-700' :
                      user.role === 'Bendahara' ? 'bg-emerald-100 text-emerald-700' : 'bg-blue-100 text-blue-700'
                    }`}>
                      {user.role}
                    </span>
                  </td>
                  <td className="px-6 py-4 text-slate-500 text-xs">{user.lastLogin}</td>
                  <td className="px-6 py-4 text-center">
                    <div className="flex items-center justify-center gap-2">
                      <button onClick={() => toast.info('Fitur Reset Password segera hadir.')} className="p-1.5 text-slate-400 hover:text-blue-500 hover:bg-blue-50 rounded-lg transition-colors" title="Reset Password">
                        <Key size={16} />
                      </button>
                      <button onClick={() => handleDelete(user.id)} className="p-1.5 text-slate-400 hover:text-red-500 hover:bg-red-50 rounded-lg transition-colors" title="Hapus User">
                        <Trash2 size={16} />
                      </button>
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>

      <ConfirmDialog 
        isOpen={isConfirmOpen} onClose={() => setIsConfirmOpen(false)} onConfirm={confirmDelete} 
        title="Hapus Hak Akses" message="Apakah Anda yakin ingin menghapus akses user ini dari Dashboard?" 
      />
    </div>
  );
};

export default ManajemenUser;
