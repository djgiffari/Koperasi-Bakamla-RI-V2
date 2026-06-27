import React from 'react';
import { ChevronLeft, ChevronRight } from 'lucide-react';

interface PaginationProps {
  currentPage: number;
  totalItems: number;
  itemsPerPage: number;
  onPageChange: (page: number) => void;
  onLimitChange: (limit: number) => void;
}

const Pagination: React.FC<PaginationProps> = ({
  currentPage,
  totalItems,
  itemsPerPage,
  onPageChange,
  onLimitChange
}) => {
  const totalPages = Math.ceil(totalItems / itemsPerPage) || 1;
  const startItem = (currentPage - 1) * itemsPerPage + 1;
  const endItem = Math.min(currentPage * itemsPerPage, totalItems);

  return (
    <div className="flex flex-col sm:flex-row items-center justify-between px-6 py-4 bg-white/40 border-t border-slate-200/50 gap-4">
      <div className="flex items-center gap-3 text-sm text-slate-500">
        <span>Tampilkan:</span>
        <select
          value={itemsPerPage}
          onChange={(e) => {
            onLimitChange(Number(e.target.value));
            onPageChange(1); // Reset to page 1
          }}
          className="bg-white border border-slate-200 text-slate-700 py-1 px-2 rounded-lg outline-none focus:border-primary focus:ring-1 focus:ring-primary/20 transition-all cursor-pointer"
        >
          <option value={10}>10</option>
          <option value={25}>25</option>
          <option value={50}>50</option>
          <option value={100}>100</option>
        </select>
        <span>
          Menampilkan <span className="font-semibold text-primary">{totalItems === 0 ? 0 : startItem}-{endItem}</span> dari <span className="font-semibold text-primary">{totalItems}</span>
        </span>
      </div>

      <div className="flex items-center gap-2">
        <button
          onClick={() => onPageChange(currentPage - 1)}
          disabled={currentPage === 1}
          className="p-1.5 rounded-lg border border-slate-200 bg-white text-slate-500 hover:text-primary hover:border-primary/50 disabled:opacity-50 disabled:pointer-events-none transition-all shadow-sm"
        >
          <ChevronLeft size={18} />
        </button>
        
        <span className="text-sm font-semibold text-slate-700 px-3 py-1 bg-white border border-slate-200 rounded-lg shadow-sm">
          Hal {currentPage} dari {totalPages}
        </span>
        
        <button
          onClick={() => onPageChange(currentPage + 1)}
          disabled={currentPage === totalPages}
          className="p-1.5 rounded-lg border border-slate-200 bg-white text-slate-500 hover:text-primary hover:border-primary/50 disabled:opacity-50 disabled:pointer-events-none transition-all shadow-sm"
        >
          <ChevronRight size={18} />
        </button>
      </div>
    </div>
  );
};

export default Pagination;
