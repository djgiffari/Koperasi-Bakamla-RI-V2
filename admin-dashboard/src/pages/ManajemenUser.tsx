import React, { useState, useEffect } from 'react';
import { Shield, Plus, Trash2, Key, X, Save } from 'lucide-react';
import ConfirmDialog from '../components/ConfirmDialog';
import { toast } from '../lib/toast';
import { api } from '../lib/api';

const ManajemenUser: React.FC = () => {
  const [users, setUsers] = useState<any[]>([]);
  const [isConfirmOpen, setIsConfirmOpen] = useState(false);
  const [deleteId, setDeleteId] = useState<number | null>(null);

  const [isAddModalOpen, setIsAddModalOpen] = useState(false);
  const [isResetModalOpen, setIsResetModalOpen] = useState(false);
  
  const [newUser, setNewUser] = useState({ username: '', password: '', name: '', role: 'ADMIN' });
  const [resetData, setResetData] = useState({ id: 0, username: '', newPassword: '' });

  const fetchUsers = async () => {
    try {
      const data = await api.get('/users');
      setUsers(data);
    } catch (error) {
      toast.error('Gagal mengambil data user');
    }
  };

  useEffect(() => {
    fetchUsers();
  }, []);

  const handleDelete = (id: number) => {
    setDeleteId(id);
    setIsConfirmOpen(true);
  };

  const confirmDelete = async () => {
    if (!deleteId) return;
    try {
      await api.delete(`/users/${deleteId}`);
      toast.success('User berhasil dihapus');
      fetchUsers();
    } catch (error) {
      toast.error('Gagal menghapus user');
    } finally {
      setIsConfirmOpen(false);
    }
  };

  const handleAddUser = async (e: React.FormEvent) => {
    e.preventDefault();
    try {
      await api.post('/users', newUser);
      toast.success('User berhasil ditambahkan');
      setIsAddModalOpen(false);
      setNewUser({ username: '', password: '', name: '', role: 'ADMIN' });
      fetchUsers();
    } catch (error: any) {
      toast.error(error.response?.data?.error || 'Gagal menambahkan user');
    }
  };

  const handleResetPassword = async (e: React.FormEvent) => {
    e.preventDefault();
    try {
      await api.put(`/users/${resetData.id}/reset-password`, { newPassword: resetData.newPassword });
      toast.success('Password berhasil direset');
      setIsResetModalOpen(false);
      setResetData({ id: 0, username: '', newPassword: '' });
    } catch (error: any) {
      toast.error(error.response?.data?.error || 'Gagal mereset password');
    }
  };

  const openResetModal = (user: any) => {
    setResetData({ id: user.id, username: user.username, newPassword: '' });
    setIsResetModalOpen(true);
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
        <button onClick={() => setIsAddModalOpen(true)} className="btn btn-primary flex items-center gap-2">
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
                <th className="px-6 py-4 font-bold">Dibuat Pada</th>
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
                      user.role === 'SUPER_ADMIN' ? 'bg-purple-100 text-purple-700' :
                      user.role === 'BENDAHARA' ? 'bg-emerald-100 text-emerald-700' : 'bg-blue-100 text-blue-700'
                    }`}>
                      {user.role}
                    </span>
                  </td>
                  <td className="px-6 py-4 text-slate-500 text-xs">{new Date(user.createdAt).toLocaleDateString('id-ID')}</td>
                  <td className="px-6 py-4 text-center">
                    <div className="flex items-center justify-center gap-2">
                      <button onClick={() => openResetModal(user)} className="p-1.5 text-slate-400 hover:text-blue-500 hover:bg-blue-50 rounded-lg transition-colors" title="Reset Password">
                        <Key size={16} />
                      </button>
                      <button onClick={() => handleDelete(user.id)} className="p-1.5 text-slate-400 hover:text-red-500 hover:bg-red-50 rounded-lg transition-colors" title="Hapus User">
                        <Trash2 size={16} />
                      </button>
                    </div>
                  </td>
                </tr>
              ))}
              {users.length === 0 && (
                <tr>
                  <td colSpan={5} className="px-6 py-4 text-center text-slate-500">Belum ada user</td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </div>

      <ConfirmDialog 
        isOpen={isConfirmOpen} onClose={() => setIsConfirmOpen(false)} onConfirm={confirmDelete} 
        title="Hapus Hak Akses" message="Apakah Anda yakin ingin menghapus akses user ini dari Dashboard?" 
      />

      {/* Modal Tambah User */}
      {isAddModalOpen && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-primary/40 backdrop-blur-sm">
          <div className="bg-white rounded-2xl shadow-2xl w-full max-w-md overflow-hidden modal-bounce">
            <div className="flex justify-between items-center px-6 py-4 border-b border-slate-100 bg-slate-50">
              <h3 className="text-lg font-bold text-primary font-outfit">Tambah Admin Baru</h3>
              <button onClick={() => setIsAddModalOpen(false)} className="text-slate-400 hover:text-red-500"><X size={20} /></button>
            </div>
            <form onSubmit={handleAddUser} className="p-6 space-y-4">
              <div>
                <label className="block text-sm font-semibold text-slate-600 mb-1">Nama Lengkap</label>
                <input required type="text" value={newUser.name} onChange={e => setNewUser({...newUser, name: e.target.value})} className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-xl outline-none focus:border-secondary text-sm" />
              </div>
              <div>
                <label className="block text-sm font-semibold text-slate-600 mb-1">Username</label>
                <input required type="text" value={newUser.username} onChange={e => setNewUser({...newUser, username: e.target.value})} className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-xl outline-none focus:border-secondary text-sm" />
              </div>
              <div>
                <label className="block text-sm font-semibold text-slate-600 mb-1">Password</label>
                <input required type="password" value={newUser.password} onChange={e => setNewUser({...newUser, password: e.target.value})} className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-xl outline-none focus:border-secondary text-sm" />
              </div>
              <div>
                <label className="block text-sm font-semibold text-slate-600 mb-1">Role</label>
                <select value={newUser.role} onChange={e => setNewUser({...newUser, role: e.target.value})} className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-xl outline-none focus:border-secondary text-sm">
                  <option value="ADMIN">Admin</option>
                  <option value="BENDAHARA">Bendahara</option>
                  <option value="KETUA">Ketua Koperasi</option>
                  <option value="SUPER_ADMIN">Super Admin</option>
                </select>
              </div>
              <div className="pt-4 flex justify-end gap-3">
                <button type="button" onClick={() => setIsAddModalOpen(false)} className="px-4 py-2 rounded-xl text-sm font-semibold text-slate-600 bg-slate-100 hover:bg-slate-200">Batal</button>
                <button type="submit" className="btn btn-primary flex items-center gap-2"><Save size={16}/> Simpan</button>
              </div>
            </form>
          </div>
        </div>
      )}

      {/* Modal Reset Password */}
      {isResetModalOpen && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-primary/40 backdrop-blur-sm">
          <div className="bg-white rounded-2xl shadow-2xl w-full max-w-sm overflow-hidden modal-bounce">
            <div className="flex justify-between items-center px-6 py-4 border-b border-slate-100 bg-slate-50">
              <h3 className="text-lg font-bold text-primary font-outfit">Reset Password</h3>
              <button onClick={() => setIsResetModalOpen(false)} className="text-slate-400 hover:text-red-500"><X size={20} /></button>
            </div>
            <form onSubmit={handleResetPassword} className="p-6 space-y-4">
              <p className="text-sm text-slate-500">Anda akan mereset password untuk user <strong className="text-slate-700">{resetData.username}</strong>.</p>
              <div>
                <label className="block text-sm font-semibold text-slate-600 mb-1">Password Baru</label>
                <input required type="password" value={resetData.newPassword} onChange={e => setResetData({...resetData, newPassword: e.target.value})} className="w-full px-4 py-2 bg-slate-50 border border-slate-200 rounded-xl outline-none focus:border-secondary text-sm" placeholder="Masukkan password baru" />
              </div>
              <div className="pt-4 flex justify-end gap-3">
                <button type="button" onClick={() => setIsResetModalOpen(false)} className="px-4 py-2 rounded-xl text-sm font-semibold text-slate-600 bg-slate-100 hover:bg-slate-200">Batal</button>
                <button type="submit" className="btn btn-primary flex items-center gap-2"><Save size={16}/> Reset</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
};

export default ManajemenUser;
