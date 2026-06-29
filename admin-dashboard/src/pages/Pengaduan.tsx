import { useState, useEffect } from 'react';
import { FileText, Search, MessageSquare, CheckCircle, Clock } from 'lucide-react';
import { api } from '../lib/api';
import Modal from '../components/Modal';

interface Pengaduan {
  id: number;
  anggotaId: number;
  anggota: {
    namaLengkap: string;
    nip: string;
    pangkat: string;
    unitKerja: string;
  };
  kategori: string;
  subjek: string;
  deskripsi: string;
  lampiranUrl: string | null;
  status: 'OPEN' | 'IN_PROGRESS' | 'RESOLVED';
  balasanAdmin: string | null;
  createdAt: string;
}

const PengaduanPage = () => {
  const [pengaduan, setPengaduan] = useState<Pengaduan[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState('');
  
  // Modal state
  const [selectedPengaduan, setSelectedPengaduan] = useState<Pengaduan | null>(null);
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [replyText, setReplyText] = useState('');
  const [newStatus, setNewStatus] = useState<'OPEN' | 'IN_PROGRESS' | 'RESOLVED'>('OPEN');

  const fetchPengaduan = async () => {
    try {
      setLoading(true);
      const res = await api.get('/api/pengaduan/admin');
      setPengaduan(res.data);
    } catch (error) {
      console.error('Error fetching pengaduan:', error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchPengaduan();
  }, []);

  const handleOpenModal = (item: Pengaduan) => {
    setSelectedPengaduan(item);
    setNewStatus(item.status);
    setReplyText(item.balasanAdmin || '');
    setIsModalOpen(true);
  };

  const handleUpdateStatus = async () => {
    if (!selectedPengaduan) return;
    
    try {
      await api.put(`/api/pengaduan/admin/${selectedPengaduan.id}/status`, {
        status: newStatus,
        balasanAdmin: replyText
      });
      setIsModalOpen(false);
      fetchPengaduan(); // refresh
    } catch (error) {
      console.error('Error updating pengaduan:', error);
      alert('Gagal mengupdate pengaduan');
    }
  };

  const filteredPengaduan = pengaduan.filter(p => 
    p.subjek.toLowerCase().includes(searchTerm.toLowerCase()) ||
    p.anggota.namaLengkap.toLowerCase().includes(searchTerm.toLowerCase()) ||
    p.anggota.nip.includes(searchTerm)
  );

  const getStatusBadge = (status: string) => {
    switch(status) {
      case 'OPEN': return <span className="px-2 py-1 bg-red-100 text-red-700 rounded text-xs font-medium flex items-center gap-1"><MessageSquare size={12}/> Terbuka</span>;
      case 'IN_PROGRESS': return <span className="px-2 py-1 bg-yellow-100 text-yellow-700 rounded text-xs font-medium flex items-center gap-1"><Clock size={12}/> Diproses</span>;
      case 'RESOLVED': return <span className="px-2 py-1 bg-green-100 text-green-700 rounded text-xs font-medium flex items-center gap-1"><CheckCircle size={12}/> Selesai</span>;
      default: return null;
    }
  };

  return (
    <div>
      <div className="flex justify-between items-center mb-6">
        <div>
          <h1 className="text-2xl font-bold text-gray-800">Layanan Pengaduan</h1>
          <p className="text-gray-600 mt-1">Kelola tiket bantuan dan keluhan dari anggota</p>
        </div>
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden mb-6">
        <div className="p-4 border-b border-gray-100 flex justify-between items-center bg-gray-50/50">
          <div className="relative">
            <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400" size={18} />
            <input
              type="text"
              placeholder="Cari subjek atau anggota..."
              className="pl-10 pr-4 py-2 border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 w-64 text-sm"
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
            />
          </div>
        </div>

        <div className="overflow-x-auto">
          <table className="w-full text-left text-sm">
            <thead className="bg-gray-50 text-gray-600">
              <tr>
                <th className="py-3 px-4 border-b">TANGGAL</th>
                <th className="py-3 px-4 border-b">ANGGOTA</th>
                <th className="py-3 px-4 border-b">KATEGORI & SUBJEK</th>
                <th className="py-3 px-4 border-b">STATUS</th>
                <th className="py-3 px-4 border-b text-right">AKSI</th>
              </tr>
            </thead>
            <tbody>
              {loading ? (
                <tr>
                  <td colSpan={5} className="py-8 text-center text-gray-500">Memuat data...</td>
                </tr>
              ) : filteredPengaduan.length === 0 ? (
                <tr>
                  <td colSpan={5} className="py-8 text-center text-gray-500">Tidak ada data pengaduan</td>
                </tr>
              ) : (
                filteredPengaduan.map((item) => (
                  <tr key={item.id} className="hover:bg-gray-50 border-b border-gray-50">
                    <td className="py-3 px-4 text-gray-500">
                      {new Date(item.createdAt).toLocaleDateString('id-ID', { day: '2-digit', month: 'short', year: 'numeric' })}
                    </td>
                    <td className="py-3 px-4">
                      <div className="font-medium text-gray-800">{item.anggota.namaLengkap}</div>
                      <div className="text-xs text-gray-500">{item.anggota.nip}</div>
                    </td>
                    <td className="py-3 px-4">
                      <div className="text-xs font-semibold text-blue-600 mb-0.5">{item.kategori}</div>
                      <div className="text-gray-800">{item.subjek}</div>
                    </td>
                    <td className="py-3 px-4">
                      {getStatusBadge(item.status)}
                    </td>
                    <td className="py-3 px-4 text-right">
                      <button 
                        onClick={() => handleOpenModal(item)}
                        className="p-1.5 bg-blue-50 text-blue-600 hover:bg-blue-100 rounded transition-colors"
                        title="Tinjau Tiket"
                      >
                        <FileText size={16} />
                      </button>
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
      </div>

      <Modal isOpen={isModalOpen} onClose={() => setIsModalOpen(false)} title="Detail Pengaduan">
        {selectedPengaduan && (
          <div className="space-y-4">
            <div className="bg-gray-50 p-3 rounded-lg border border-gray-100 text-sm">
              <div className="grid grid-cols-2 gap-2 mb-2">
                <div>
                  <span className="text-gray-500 text-xs block">Pengirim</span>
                  <span className="font-medium">{selectedPengaduan.anggota.namaLengkap} ({selectedPengaduan.anggota.nip})</span>
                </div>
                <div>
                  <span className="text-gray-500 text-xs block">Waktu Pengajuan</span>
                  <span className="font-medium">{new Date(selectedPengaduan.createdAt).toLocaleString('id-ID')}</span>
                </div>
              </div>
              <div className="mt-3">
                <span className="text-gray-500 text-xs block">Subjek</span>
                <span className="font-medium">{selectedPengaduan.subjek}</span>
              </div>
              <div className="mt-3">
                <span className="text-gray-500 text-xs block">Deskripsi Keluhan</span>
                <p className="mt-1 text-gray-700 bg-white p-2 rounded border border-gray-200">{selectedPengaduan.deskripsi}</p>
              </div>
              {selectedPengaduan.lampiranUrl && (
                <div className="mt-3">
                  <span className="text-gray-500 text-xs block mb-1">Lampiran Bukti</span>
                  <a 
                    href={`http://localhost:3000${selectedPengaduan.lampiranUrl}`} 
                    target="_blank" 
                    rel="noopener noreferrer"
                    className="inline-flex items-center gap-2 px-3 py-1.5 bg-blue-50 text-blue-600 rounded border border-blue-100 hover:bg-blue-100 transition-colors text-sm"
                  >
                    <FileText size={16} /> Lihat Lampiran
                  </a>
                </div>
              )}
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Status Tiket</label>
              <select 
                value={newStatus}
                onChange={(e: any) => setNewStatus(e.target.value)}
                className="w-full p-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
              >
                <option value="OPEN">Terbuka (Belum Ditangani)</option>
                <option value="IN_PROGRESS">Sedang Diproses</option>
                <option value="RESOLVED">Selesai (Resolved)</option>
              </select>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Balasan Admin</label>
              <textarea 
                value={replyText}
                onChange={(e) => setReplyText(e.target.value)}
                placeholder="Tulis balasan atau tindak lanjut..."
                className="w-full p-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                rows={4}
              ></textarea>
            </div>

            <div className="flex justify-end gap-2 mt-4 pt-4 border-t border-gray-100">
              <button 
                onClick={() => setIsModalOpen(false)}
                className="px-4 py-2 border border-gray-300 rounded-lg text-sm font-medium text-gray-700 hover:bg-gray-50"
              >
                Tutup
              </button>
              <button 
                onClick={handleUpdateStatus}
                className="px-4 py-2 bg-blue-600 text-white rounded-lg text-sm font-medium hover:bg-blue-700"
              >
                Simpan & Update Status
              </button>
            </div>
          </div>
        )}
      </Modal>
    </div>
  );
};

export default PengaduanPage;
