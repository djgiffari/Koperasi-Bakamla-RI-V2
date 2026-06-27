import React, { useState } from 'react';
import { NavLink, useLocation } from 'react-router-dom';
import { 
  LayoutDashboard, 
  Users, 
  Wallet, 
  Store, 
  MessageSquare, 
  Settings, 
  LogOut,
  ChevronDown,
  ChevronRight
} from 'lucide-react';

interface SidebarProps {
  isOpen: boolean;
}

const Sidebar: React.FC<SidebarProps> = ({ isOpen }) => {
  const [openAccordion, setOpenAccordion] = useState<string | null>('transaksi');
  const location = useLocation();

  const toggleAccordion = (name: string) => {
    setOpenAccordion(openAccordion === name ? null : name);
  };

  // Helper function to check if any transaction route is active
  const isTransactionActive = ['/simpanan', '/pinjaman', '/angsuran'].includes(location.pathname);
  
  // Style generator for NavLink
  const navLinkClass = ({ isActive }: { isActive: boolean }) => 
    `flex items-center gap-3 px-4 py-3 rounded-lg font-medium transition-colors ${
      isActive 
        ? 'bg-slate-50 text-primary' 
        : 'text-slate-600 hover:bg-slate-50 hover:text-primary'
    }`;

  const subNavLinkClass = ({ isActive }: { isActive: boolean }) => 
    `block px-4 py-2 text-sm rounded-lg transition-colors ${
      isActive
        ? 'bg-slate-50 text-primary font-semibold'
        : 'text-slate-500 hover:text-primary hover:bg-slate-50'
    }`;

  return (
    <aside className={`fixed top-0 left-0 h-screen w-64 bg-white border-r border-slate-200 transition-transform duration-300 z-50 ${isOpen ? 'translate-x-0' : '-translate-x-full'} md:translate-x-0`}>
      <div className="flex items-center gap-3 p-6 border-b border-slate-100">
        <img src="/logo.png" alt="Logo Koperasi" className="w-8 h-8 object-contain" />
        <span className="font-outfit font-bold text-lg text-primary">Koperasi Bakamla</span>
      </div>

      <div className="p-4 h-[calc(100vh-80px)] overflow-y-auto">
        <ul className="space-y-2">
          {/* Dashboard */}
          <li>
            <NavLink to="/" className={navLinkClass}>
              {({ isActive }) => (
                <>
                  <LayoutDashboard size={20} className={isActive ? "text-secondary" : ""} />
                  <span>Dashboard</span>
                </>
              )}
            </NavLink>
          </li>

          {/* Transaksi Accordion */}
          <li>
            <button 
              onClick={() => toggleAccordion('transaksi')}
              className={`w-full flex items-center justify-between px-4 py-3 rounded-lg font-medium transition-colors ${
                isTransactionActive 
                  ? 'bg-slate-50 text-primary' 
                  : 'text-slate-600 hover:bg-slate-50 hover:text-primary'
              }`}
            >
              <div className="flex items-center gap-3">
                <Wallet size={20} className={isTransactionActive ? "text-secondary" : ""} />
                <span>Transaksi</span>
              </div>
              {openAccordion === 'transaksi' ? <ChevronDown size={16} /> : <ChevronRight size={16} />}
            </button>
            
            {openAccordion === 'transaksi' && (
              <ul className="mt-2 ml-10 space-y-1">
                <li><NavLink to="/simpanan" className={subNavLinkClass}>Simpanan</NavLink></li>
                <li><NavLink to="/pinjaman" className={subNavLinkClass}>Pinjaman</NavLink></li>
                <li><NavLink to="/angsuran" className={subNavLinkClass}>Angsuran</NavLink></li>
              </ul>
            )}
          </li>

          {/* Anggota */}
          <li>
            <NavLink to="/anggota" className={navLinkClass}>
              {({ isActive }) => (
                <>
                  <Users size={20} className={isActive ? "text-secondary" : ""} />
                  <span>Anggota</span>
                </>
              )}
            </NavLink>
          </li>

          {/* Toko Koperasi */}
          <li>
            <NavLink to="/pos" className={navLinkClass}>
              {({ isActive }) => (
                <>
                  <Store size={20} className={isActive ? "text-secondary" : ""} />
                  <span>Point of Sales</span>
                </>
              )}
            </NavLink>
          </li>

          {/* Chat */}
          <li>
            <NavLink to="/inbox" className={navLinkClass}>
              {({ isActive }) => (
                <div className="w-full flex items-center justify-between">
                  <div className="flex items-center gap-3">
                    <MessageSquare size={20} className={isActive ? "text-secondary" : ""} />
                    <span>Inbox Chat</span>
                  </div>
                  <span className="bg-red-500 text-white text-xs font-bold px-2 py-0.5 rounded-full">3</span>
                </div>
              )}
            </NavLink>
          </li>
          {/* Laporan & SHU */}
          <li>
            <button 
              onClick={() => toggleAccordion('laporan')}
              className={`w-full flex items-center justify-between px-4 py-3 rounded-lg font-medium transition-colors ${
                ['/laporan', '/shu'].includes(location.pathname) ? 'bg-slate-50 text-primary' : 'text-slate-600 hover:bg-slate-50 hover:text-primary'
              }`}
            >
              <div className="flex items-center gap-3">
                <LayoutDashboard size={20} className={['/laporan', '/shu'].includes(location.pathname) ? "text-secondary" : ""} />
                <span>Laporan & SHU</span>
              </div>
              {openAccordion === 'laporan' ? <ChevronDown size={16} /> : <ChevronRight size={16} />}
            </button>
            {openAccordion === 'laporan' && (
              <ul className="mt-2 ml-10 space-y-1">
                <li><NavLink to="/laporan" className={subNavLinkClass}>Laporan Transaksi</NavLink></li>
                <li><NavLink to="/shu" className={subNavLinkClass}>Sisa Hasil Usaha</NavLink></li>
              </ul>
            )}
          </li>
          
          {/* Sistem & Admin */}
          <li>
            <button 
              onClick={() => toggleAccordion('sistem')}
              className={`w-full flex items-center justify-between px-4 py-3 rounded-lg font-medium transition-colors ${
                ['/users', '/profil', '/logs', '/broadcast'].includes(location.pathname) ? 'bg-slate-50 text-primary' : 'text-slate-600 hover:bg-slate-50 hover:text-primary'
              }`}
            >
              <div className="flex items-center gap-3">
                <Settings size={20} className={['/users', '/profil', '/logs', '/broadcast'].includes(location.pathname) ? "text-secondary" : ""} />
                <span>Sistem & Admin</span>
              </div>
              {openAccordion === 'sistem' ? <ChevronDown size={16} /> : <ChevronRight size={16} />}
            </button>
            {openAccordion === 'sistem' && (
              <ul className="mt-2 ml-10 space-y-1">
                <li><NavLink to="/users" className={subNavLinkClass}>Manajemen User</NavLink></li>
                <li><NavLink to="/profil" className={subNavLinkClass}>Profil Saya</NavLink></li>
                <li><NavLink to="/broadcast" className={subNavLinkClass}>Broadcast Pesan</NavLink></li>
                <li><NavLink to="/logs" className={subNavLinkClass}>System Logs</NavLink></li>
              </ul>
            )}
          </li>
        </ul>

        <div className="mt-12 space-y-2 pt-6 border-t border-slate-100">
          <NavLink to="/settings" className={navLinkClass}>
            {({ isActive }) => (
              <>
                <Settings size={20} className={isActive ? "text-secondary" : ""} />
                <span>Pengaturan Umum</span>
              </>
            )}
          </NavLink>
          <a href="#" className="flex items-center gap-3 px-4 py-3 text-red-500 hover:bg-red-50 rounded-lg font-medium transition-colors" onClick={(e) => {e.preventDefault(); alert('Logout');}}>
            <LogOut size={20} />
            <span>Keluar</span>
          </a>
        </div>
      </div>
    </aside>
  );
};

export default Sidebar;
