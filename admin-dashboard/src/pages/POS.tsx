import React, { useState, useEffect } from 'react';
import { ShoppingBag, Plus, Trash2, Edit2, Package, ListTree, Box, ShoppingCart, Calculator, MonitorPlay } from 'lucide-react';
import { toast } from '../lib/toast';
import Drawer from '../components/Drawer';
import ConfirmDialog from '../components/ConfirmDialog';
import { api } from '../lib/api';

const POS: React.FC = () => {
  const [activeTab, setActiveTab] = useState<'kasir' | 'produk' | 'kategori' | 'stok' | 'pesanan'>('kasir');
  const [products, setProducts] = useState<any[]>([]);
  const [categories, setCategories] = useState(['Sembako', 'Elektronik', 'Pakaian']);
  const [orders, setOrders] = useState<any[]>([]);
  
  // Kasir States
  const [cart, setCart] = useState<{id: number, nama: string, harga: number, qty: number}[]>([]);
  const [cashAmount, setCashAmount] = useState('');
  
  // States
  const [newCategory, setNewCategory] = useState('');
  const [isDrawerOpen, setIsDrawerOpen] = useState(false);
  const [isConfirmOpen, setIsConfirmOpen] = useState(false);
  const [confirmAction, setConfirmAction] = useState<(() => void) | null>(null);
  const [confirmMessage, setConfirmMessage] = useState('');

  const [editingId, setEditingId] = useState<number | null>(null);
  const [formData, setFormData] = useState({ nama: '', kategori: 'Sembako', hargaBeli: '', hargaJual: '', stok: '', gambar: '' });

  const fetchData = async () => {
    try {
      const [prodRes, orderRes] = await Promise.all([
        api.get('/toko/produk'),
        api.get('/toko/order')
      ]);
      setProducts(prodRes);
      setOrders(orderRes);
    } catch (error) {
      toast.error('Gagal mengambil data toko');
    }
  };

  useEffect(() => {
    fetchData();
  }, []);

  // Kasir Calculations
  const cartTotal = cart.reduce((sum, item) => sum + (item.harga * item.qty), 0);
  const cashVal = parseInt(cashAmount.replace(/\D/g, '')) || 0;
  const changeAmount = cashVal - cartTotal;

  // Handlers
  const handleOpenAdd = () => {
    setEditingId(null);
    setFormData({ nama: '', kategori: categories[0] || '', hargaBeli: '', hargaJual: '', stok: '', gambar: '' });
    setIsDrawerOpen(true);
  };

  const handleOpenEdit = (item: any) => {
    setEditingId(item.id);
    setFormData({ 
      nama: item.nama, 
      kategori: item.kategori, 
      hargaBeli: item.hargaModal?.toString() || item.hargaBeli?.toString() || '0', 
      hargaJual: item.hargaJual.toString(), 
      stok: item.stok.toString(), 
      gambar: item.gambarUrl || item.gambar || ''
    });
    setIsDrawerOpen(true);
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    const payload = {
      nama: formData.nama,
      kategori: formData.kategori,
      hargaModal: parseInt(formData.hargaBeli) || 0,
      hargaJual: parseInt(formData.hargaJual) || 0,
      stok: parseInt(formData.stok) || 0,
      gambarUrl: formData.gambar
    };

    try {
      if (editingId) {
        await api.put(`/toko/produk/${editingId}`, payload);
        toast.success('Produk berhasil diubah');
      } else {
        await api.post('/toko/produk', payload);
        toast.success('Produk berhasil ditambahkan');
      }
      fetchData();
      setIsDrawerOpen(false);
    } catch (error) {
      toast.error('Gagal menyimpan produk');
    }
  };

  const handleDeleteProduct = (id: number, nama: string) => {
    setConfirmMessage(`Yakin ingin menghapus produk ${nama}?`);
    setConfirmAction(() => async () => {
      try {
        await api.delete(`/toko/produk/${id}`);
        toast.success('Produk dihapus');
        fetchData();
      } catch (error) {
        toast.error('Gagal menghapus produk');
      }
    });
    setIsConfirmOpen(true);
  };

  const handleAddCategory = () => {
    if (newCategory && !categories.includes(newCategory)) {
      setCategories([...categories, newCategory]);
      setNewCategory('');
      toast.success('Kategori ditambahkan');
    }
  };

  const handleUpdateOrderStatus = async (id: number, status: string) => {
    toast.info('Status pesanan diupdate secara otomatis oleh sistem saat ini.');
  };

  const handleAddToCart = (product: any) => {
    const existing = cart.find(c => c.id === product.id);
    if (existing) {
      if (existing.qty + 1 > product.stok) {
        toast.error('Stok tidak mencukupi');
        return;
      }
      setCart(cart.map(c => c.id === product.id ? { ...c, qty: c.qty + 1 } : c));
    } else {
      if (product.stok < 1) {
        toast.error('Stok habis');
        return;
      }
      setCart([...cart, { id: product.id, nama: product.nama, harga: product.hargaJual, qty: 1 }]);
    }
  };

  const handleRemoveFromCart = (id: number) => {
    setCart(cart.filter(c => c.id !== id));
  };

  const handleCheckout = () => {
    if (cart.length === 0) {
      toast.error("Keranjang kosong!");
      return;
    }
    if (cashVal < cartTotal) {
      toast.error("Uang tunai kurang!");
      return;
    }
    setConfirmMessage(`Checkout transaksi senilai Rp ${cartTotal.toLocaleString('id-ID')}?`);
    setConfirmAction(() => async () => {
      try {
        const items = cart.map(c => ({ produkId: c.id, jumlah: c.qty }));
        await api.post('/toko/checkout', {
          anggotaId: null, // transaksi offline umum / anonim
          metodePembayaran: 'CASH',
          items
        });
        toast.success("Transaksi Berhasil diproses!");
        setCart([]);
        setCashAmount('');
        fetchData(); // refresh stok & orders
      } catch (error: any) {
        toast.error(error.response?.data?.error || 'Gagal memproses checkout');
      }
    });
    setIsConfirmOpen(true);
  };

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
        <div>
          <h1 className="text-3xl font-bold text-primary font-outfit flex items-center gap-3">
            <ShoppingBag size={32} className="text-secondary" />
            Manajemen Toko & Kasir (POS)
          </h1>
          <p className="text-slate-500 mt-1">Kelola penjualan offline koperasi, stok barang, dan katalog.</p>
        </div>
      </div>

      <div className="glass-panel overflow-hidden">
        {/* Navigation Tabs */}
        <div className="flex border-b border-slate-200/50 bg-white/30 overflow-x-auto custom-scrollbar">
          {[
            { id: 'kasir', label: 'Kasir Offline', icon: MonitorPlay },
            { id: 'produk', label: 'Master Produk', icon: Package },
            { id: 'kategori', label: 'Kategori', icon: ListTree },
            { id: 'stok', label: 'Inventaris Stok', icon: Box },
            { id: 'pesanan', label: 'Pesanan Online', icon: ShoppingCart },
          ].map((tab) => (
            <button
              key={tab.id}
              onClick={() => setActiveTab(tab.id as any)}
              className={`px-6 py-4 flex items-center gap-2 text-sm font-bold transition-all whitespace-nowrap relative ${
                activeTab === tab.id ? 'text-primary' : 'text-slate-400 hover:text-slate-600 hover:bg-white/20'
              }`}
            >
              <tab.icon size={16} />
              {tab.label}
              {activeTab === tab.id && <div className="absolute bottom-0 left-0 w-full h-0.5 bg-secondary shadow-[0_0_8px_rgba(212,175,55,0.8)]"></div>}
            </button>
          ))}
        </div>

        {/* TAB 0: KASIR OFFLINE */}
        {activeTab === 'kasir' && (
          <div className="flex flex-col lg:flex-row h-[600px] bg-slate-50">
            {/* Kiri: Katalog Produk */}
            <div className="flex-1 p-6 overflow-y-auto">
              <h3 className="font-bold text-slate-700 mb-4 flex items-center gap-2"><Package size={18}/> Pilih Produk</h3>
              <div className="grid grid-cols-2 md:grid-cols-3 xl:grid-cols-4 gap-4">
                {products.map(p => (
                  <button key={p.id} onClick={() => handleAddToCart(p)} disabled={p.stok < 1} className={`bg-white border border-slate-200 rounded-xl overflow-hidden hover:shadow-lg transition-all text-left group ${p.stok < 1 ? 'opacity-50 cursor-not-allowed' : 'hover:border-secondary'}`}>
                    <div className="h-24 overflow-hidden bg-slate-100 flex items-center justify-center text-slate-300">
                      {p.gambarUrl ? (
                        <img src={p.gambarUrl} alt={p.nama} className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-300" />
                      ) : (
                        <Package size={32} />
                      )}
                    </div>
                    <div className="p-3">
                      <h4 className="text-xs font-bold text-slate-800 line-clamp-2 min-h-8">{p.nama}</h4>
                      <p className="text-secondary font-bold text-sm mt-1">Rp {p.hargaJual.toLocaleString('id-ID')}</p>
                      <p className={`text-[10px] mt-1 font-bold ${p.stok < 1 ? 'text-red-500' : 'text-slate-400'}`}>Stok: {p.stok}</p>
                    </div>
                  </button>
                ))}
              </div>
            </div>

            {/* Kanan: Keranjang & Pembayaran */}
            <div className="w-full lg:w-96 bg-white border-l border-slate-200 flex flex-col shadow-[-4px_0_15px_rgba(0,0,0,0.05)] z-10">
              <div className="p-4 border-b border-slate-100 bg-slate-50 flex justify-between items-center">
                <h3 className="font-bold text-primary flex items-center gap-2"><ShoppingCart size={18}/> Keranjang (Offline)</h3>
                <span className="bg-primary text-white text-xs font-bold px-2 py-1 rounded-full">{cart.reduce((a,b) => a+b.qty, 0)} item</span>
              </div>
              
              <div className="flex-1 overflow-y-auto p-4 space-y-3">
                {cart.length === 0 ? (
                  <div className="h-full flex flex-col items-center justify-center text-slate-400 space-y-2">
                    <ShoppingCart size={40} className="opacity-20" />
                    <p className="text-sm">Keranjang masih kosong</p>
                  </div>
                ) : (
                  cart.map(item => (
                    <div key={item.id} className="flex justify-between items-center bg-slate-50 border border-slate-100 p-3 rounded-xl">
                      <div className="flex-1">
                        <h4 className="text-xs font-bold text-slate-800">{item.nama}</h4>
                        <p className="text-[11px] text-slate-500 mt-0.5">Rp {item.harga.toLocaleString('id-ID')} x {item.qty}</p>
                      </div>
                      <div className="flex items-center gap-3">
                        <span className="font-bold text-secondary text-sm">Rp {(item.harga * item.qty).toLocaleString('id-ID')}</span>
                        <button onClick={() => handleRemoveFromCart(item.id)} className="text-red-400 hover:text-red-600 bg-red-50 p-1.5 rounded-lg"><Trash2 size={14}/></button>
                      </div>
                    </div>
                  ))
                )}
              </div>

              <div className="p-5 border-t border-slate-200 bg-slate-50 space-y-4">
                <div className="flex justify-between items-center">
                  <span className="text-slate-500 font-semibold">Total Tagihan</span>
                  <span className="text-2xl font-bold text-primary">Rp {cartTotal.toLocaleString('id-ID')}</span>
                </div>
                
                <div>
                  <label className="block text-xs font-semibold text-slate-500 mb-1">Jumlah Tunai (Cash)</label>
                  <div className="relative">
                    <span className="absolute left-3 top-2.5 text-slate-400 font-bold">Rp</span>
                    <input 
                      type="text" value={cashAmount} onChange={e => setCashAmount(e.target.value)}
                      placeholder="0" className="w-full pl-10 pr-4 py-2 border border-slate-300 rounded-xl outline-none focus:border-secondary font-bold text-slate-800"
                    />
                  </div>
                </div>

                <div className="flex justify-between items-center py-2 border-t border-slate-200 border-dashed">
                  <span className="text-slate-500 font-semibold text-sm">Kembalian</span>
                  <span className={`text-lg font-bold ${changeAmount >= 0 ? 'text-emerald-600' : 'text-red-500'}`}>
                    Rp {changeAmount >= 0 ? changeAmount.toLocaleString('id-ID') : '0'}
                  </span>
                </div>

                <button 
                  onClick={handleCheckout} 
                  disabled={cart.length === 0 || changeAmount < 0}
                  className={`w-full py-3 rounded-xl font-bold text-white flex items-center justify-center gap-2 transition-all ${
                    cart.length > 0 && changeAmount >= 0 ? 'bg-secondary hover:bg-secondary-hover shadow-lg shadow-secondary/30' : 'bg-slate-300 cursor-not-allowed'
                  }`}
                >
                  <Calculator size={18} /> PROSES PEMBAYARAN CASH
                </button>
              </div>
            </div>
          </div>
        )}

        {/* TAB 1: PRODUK */}
        {activeTab === 'produk' && (
          <div className="p-6 space-y-4">
            <div className="flex justify-between items-center mb-6">
              <p className="text-sm text-slate-500">Daftar produk belanja koperasi yang tampil di aplikasi anggota.</p>
              <button onClick={handleOpenAdd} className="btn btn-primary flex items-center gap-2">
                <Plus size={16} /> Tambah Produk
              </button>
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
              {products.map(item => (
                <div key={item.id} className="bg-white/60 border border-white rounded-2xl overflow-hidden shadow-lg hover:shadow-xl hover:-translate-y-1 transition-all flex flex-col">
                  <div className="h-40 overflow-hidden bg-slate-100 flex items-center justify-center">
                    {item.gambarUrl ? (
                      <img src={item.gambarUrl} alt={item.nama} className="w-full h-full object-cover" />
                    ) : (
                      <Package size={40} className="text-slate-300" />
                    )}
                  </div>
                  <div className="p-4 flex flex-col flex-1">
                    <div className="mb-2">
                      <span className="text-[10px] font-bold uppercase tracking-wider text-blue-700 bg-blue-100 px-2 py-0.5 rounded-full">{item.kategori}</span>
                    </div>
                    <h3 className="font-bold text-slate-800 leading-tight mb-4 flex-1">{item.nama}</h3>
                    
                    <div className="space-y-1 text-xs mb-4">
                      <div className="flex justify-between text-slate-500">
                        <span>Harga Beli:</span>
                        <span className="font-bold text-slate-600">Rp {item.hargaModal?.toLocaleString('id-ID') || 0}</span>
                      </div>
                      <div className="flex justify-between text-slate-500">
                        <span>Harga Jual:</span>
                        <span className="font-bold text-secondary text-sm">Rp {item.hargaJual.toLocaleString('id-ID')}</span>
                      </div>
                      <div className="flex justify-between text-slate-500 pt-1 border-t border-slate-100">
                        <span>Sisa Stok:</span>
                        <span className={`font-bold ${item.stok <= 10 ? 'text-red-500' : 'text-emerald-500'}`}>{item.stok} unit</span>
                      </div>
                    </div>

                    <div className="flex gap-2 mt-auto">
                      <button onClick={() => handleOpenEdit(item)} className="flex-1 py-1.5 bg-slate-100 text-slate-600 hover:bg-primary hover:text-white rounded-lg text-xs font-semibold flex items-center justify-center gap-1 transition-colors">
                        <Edit2 size={14} /> Edit
                      </button>
                      <button onClick={() => handleDeleteProduct(item.id, item.nama)} className="p-1.5 bg-slate-100 text-slate-400 hover:bg-red-500 hover:text-white rounded-lg transition-colors">
                        <Trash2 size={16} />
                      </button>
                    </div>
                  </div>
                </div>
              ))}
              {products.length === 0 && (
                <div className="col-span-full py-12 text-center text-slate-500">
                  Belum ada produk di katalog.
                </div>
              )}
            </div>
          </div>
        )}

        {/* TAB 2: KATEGORI */}
        {activeTab === 'kategori' && (
          <div className="p-6 grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div className="bg-white/60 border border-white rounded-2xl p-6 shadow-sm h-fit">
              <h3 className="font-bold text-primary uppercase text-sm mb-4">Tambah Kategori</h3>
              <div className="space-y-3">
                <input 
                  type="text" value={newCategory} onChange={e => setNewCategory(e.target.value)}
                  placeholder="Nama Kategori..." className="w-full px-4 py-2 border border-slate-200 rounded-xl outline-none focus:border-secondary text-sm"
                />
                <button onClick={handleAddCategory} className="w-full bg-secondary text-primary font-bold py-2 rounded-xl hover:bg-secondary-hover transition-colors">
                  Simpan Kategori
                </button>
              </div>
            </div>
            <div className="lg:col-span-2 bg-white/60 border border-white rounded-2xl p-6 shadow-sm">
              <h3 className="font-bold text-primary uppercase text-sm mb-4">Daftar Kategori</h3>
              <div className="divide-y divide-slate-100">
                {categories.map((cat, i) => (
                  <div key={i} className="flex justify-between items-center py-3">
                    <span className="font-semibold text-slate-700">{cat}</span>
                    <button onClick={() => {
                        setConfirmMessage(`Hapus kategori ${cat}?`);
                        setConfirmAction(() => () => setCategories(categories.filter(c => c !== cat)));
                        setIsConfirmOpen(true);
                      }} className="text-red-500 hover:underline text-sm font-semibold">
                      Hapus
                    </button>
                  </div>
                ))}
              </div>
            </div>
          </div>
        )}

        {/* TAB 3: STOK */}
        {activeTab === 'stok' && (
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse text-sm">
              <thead>
                <tr className="bg-primary/5 text-primary text-xs uppercase tracking-wider border-b border-primary/10">
                  <th className="px-6 py-4 font-bold">Produk</th>
                  <th className="px-6 py-4 font-bold">Kategori</th>
                  <th className="px-6 py-4 font-bold text-right">Harga Modal</th>
                  <th className="px-6 py-4 font-bold text-right">Harga Jual</th>
                  <th className="px-6 py-4 font-bold text-center">Stok Sisa</th>
                  <th className="px-6 py-4 text-center font-bold">Aksi</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100">
                {products.map((item) => (
                  <tr key={item.id} className="hover:bg-white/40">
                    <td className="px-6 py-4 font-semibold text-slate-800">{item.nama}</td>
                    <td className="px-6 py-4 text-slate-500">{item.kategori}</td>
                    <td className="px-6 py-4 text-slate-500 text-right">Rp {(item.hargaModal || 0).toLocaleString('id-ID')}</td>
                    <td className="px-6 py-4 text-primary font-bold text-right">Rp {item.hargaJual.toLocaleString('id-ID')}</td>
                    <td className="px-6 py-4 text-center">
                      <span className={`px-2.5 py-1 rounded-md text-[11px] font-bold ${item.stok <= 10 ? 'bg-red-100 text-red-700' : 'bg-emerald-100 text-emerald-700'}`}>
                        {item.stok} unit
                      </span>
                    </td>
                    <td className="px-6 py-4 text-center">
                      <button onClick={async () => {
                          const qtyStr = prompt('Masukkan jumlah restock baru (penambahan stok):');
                          const qty = parseInt(qtyStr || '0');
                          if (qty && qty > 0) {
                            try {
                              await api.put(`/toko/produk/${item.id}`, {
                                ...item,
                                hargaBeli: item.hargaModal,
                                stok: item.stok + qty,
                                gambar: item.gambarUrl
                              });
                              toast.success('Stok berhasil ditambahkan');
                              fetchData();
                            } catch (e) {
                              toast.error('Gagal menambah stok');
                            }
                          }
                        }} className="px-3 py-1.5 bg-slate-100 text-slate-700 hover:bg-primary hover:text-white rounded-lg text-xs font-bold transition-colors">
                        + Restock
                      </button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}

        {/* TAB 4: PESANAN */}
        {activeTab === 'pesanan' && (
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse text-sm">
              <thead>
                <tr className="bg-primary/5 text-primary text-xs uppercase tracking-wider border-b border-primary/10">
                  <th className="px-6 py-4 font-bold">No. Transaksi (ID)</th>
                  <th className="px-6 py-4 font-bold">Anggota Pembeli</th>
                  <th className="px-6 py-4 font-bold">Total</th>
                  <th className="px-6 py-4 font-bold">Pembayaran</th>
                  <th className="px-6 py-4 font-bold text-center">Status</th>
                  <th className="px-6 py-4 font-bold text-center">Tanggal</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100">
                {orders.map((order) => {
                  let pembeli = 'OFFLINE (CASH)';
                  if (order.tagihanPaylater && order.tagihanPaylater.length > 0) {
                     pembeli = order.tagihanPaylater[0].anggota?.nama || 'Anggota Online';
                  } else if (order.metodePembayaran === 'POTONG_SALDO') {
                     pembeli = 'Anggota (POTONG SALDO)';
                  }
                  return (
                    <tr key={order.id} className="hover:bg-white/40">
                      <td className="px-6 py-4 font-bold text-slate-800 font-mono">ORD-{order.id}</td>
                      <td className="px-6 py-4 text-slate-600 font-semibold">{pembeli}</td>
                      <td className="px-6 py-4 font-bold text-secondary">Rp {order.totalHarga.toLocaleString('id-ID')}</td>
                      <td className="px-6 py-4 text-xs text-slate-500 uppercase font-mono">{order.metodePembayaran.replace(/_/g, ' ')}</td>
                      <td className="px-6 py-4 text-center">
                        <span className={`px-2.5 py-1 rounded-md text-[10px] font-bold uppercase ${
                          order.status === 'SELESAI' ? 'bg-emerald-100 text-emerald-700' :
                          order.status === 'SIAP_DIAMBIL' ? 'bg-blue-100 text-blue-700' : 'bg-amber-100 text-amber-700'
                        }`}>
                          {order.status.replace(/_/g, ' ')}
                        </span>
                      </td>
                      <td className="px-6 py-4 text-xs text-slate-500 text-center">
                        {new Date(order.createdAt).toLocaleDateString('id-ID')}
                      </td>
                    </tr>
                  );
                })}
                {orders.length === 0 && (
                  <tr>
                    <td colSpan={6} className="text-center py-6 text-slate-500">Belum ada pesanan.</td>
                  </tr>
                )}
              </tbody>
            </table>
          </div>
        )}
      </div>

      <Drawer isOpen={isDrawerOpen} onClose={() => setIsDrawerOpen(false)} title={editingId ? "Edit Produk" : "Tambah Produk Baru"} onSubmit={handleSubmit}>
        <div className="space-y-4">
          <div><label className="block text-sm font-medium text-slate-700 mb-1">Nama Produk</label>
            <input type="text" required value={formData.nama} onChange={e => setFormData({...formData, nama: e.target.value})} className="w-full px-4 py-2 border border-slate-300 rounded-xl outline-none focus:border-primary" />
          </div>
          <div><label className="block text-sm font-medium text-slate-700 mb-1">Kategori</label>
            <select value={formData.kategori} onChange={e => setFormData({...formData, kategori: e.target.value})} className="w-full px-4 py-2 border border-slate-300 rounded-xl outline-none focus:border-primary">
              {categories.map((c, i) => <option key={i} value={c}>{c}</option>)}
            </select>
          </div>
          <div className="grid grid-cols-2 gap-4">
            <div><label className="block text-sm font-medium text-slate-700 mb-1">Harga Modal</label>
              <input type="number" required value={formData.hargaBeli} onChange={e => setFormData({...formData, hargaBeli: e.target.value})} className="w-full px-4 py-2 border border-slate-300 rounded-xl outline-none focus:border-primary" />
            </div>
            <div><label className="block text-sm font-medium text-slate-700 mb-1">Harga Jual</label>
              <input type="number" required value={formData.hargaJual} onChange={e => setFormData({...formData, hargaJual: e.target.value})} className="w-full px-4 py-2 border border-slate-300 rounded-xl outline-none focus:border-primary" />
            </div>
          </div>
          <div><label className="block text-sm font-medium text-slate-700 mb-1">Stok Awal</label>
            <input type="number" required value={formData.stok} onChange={e => setFormData({...formData, stok: e.target.value})} className="w-full px-4 py-2 border border-slate-300 rounded-xl outline-none focus:border-primary" />
          </div>
          <div><label className="block text-sm font-medium text-slate-700 mb-1">URL Gambar (Opsional)</label>
            <input type="text" value={formData.gambar} onChange={e => setFormData({...formData, gambar: e.target.value})} placeholder="https://..." className="w-full px-4 py-2 border border-slate-300 rounded-xl outline-none focus:border-primary" />
          </div>
        </div>
      </Drawer>

      <ConfirmDialog isOpen={isConfirmOpen} onClose={() => setIsConfirmOpen(false)} onConfirm={() => { if(confirmAction) confirmAction(); }} title="Konfirmasi" message={confirmMessage} />
    </div>
  );
};

export default POS;
