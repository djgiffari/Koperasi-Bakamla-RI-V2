import React from 'react';
import { Bell, Search, Menu } from 'lucide-react';

interface HeaderProps {
  toggleSidebar: () => void;
}

const Header: React.FC<HeaderProps> = ({ toggleSidebar }) => {
  return (
    <header className="bg-white/70 backdrop-blur-md border-b border-white/50 shadow-sm h-20 px-6 flex items-center justify-between sticky top-0 z-40">
      <div className="flex items-center gap-4 w-full max-w-xl">
        <button 
          onClick={toggleSidebar}
          className="p-2 -ml-2 rounded-lg hover:bg-slate-100 text-slate-600 md:hidden"
        >
          <Menu size={24} />
        </button>
        
        <div className="relative w-full hidden md:block">
          <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
            <Search className="h-5 w-5 text-slate-400" />
          </div>
          <input
            type="text"
            className="block w-full pl-10 pr-3 py-2 border border-slate-200 rounded-xl leading-5 bg-slate-50 placeholder-slate-400 focus:outline-none focus:bg-white focus:ring-1 focus:ring-secondary focus:border-secondary transition-colors sm:text-sm"
            placeholder="Cari anggota, transaksi..."
          />
        </div>
      </div>

      <div className="flex items-center gap-6">
        <button className="relative p-2 text-slate-500 hover:text-primary transition-colors">
          <Bell size={24} />
          <span className="absolute top-1.5 right-1.5 block h-2.5 w-2.5 rounded-full bg-red-500 ring-2 ring-white"></span>
        </button>
        
        <div className="flex items-center gap-3 border-l border-slate-200 pl-6">
          <div className="text-right hidden sm:block">
            <p className="text-sm font-semibold text-primary">Admin Pusat</p>
            <p className="text-xs text-slate-500">Administrator</p>
          </div>
          <img 
            className="h-10 w-10 rounded-full object-cover border-2 border-secondary/20"
            src="https://ui-avatars.com/api/?name=Admin+Pusat&background=0B1E36&color=fff" 
            alt="Admin Profile" 
          />
        </div>
      </div>
    </header>
  );
};

export default Header;
