import React, { useEffect, useState } from 'react';
import { X, FileText, Download } from 'lucide-react';

interface ModalProps {
  isOpen: boolean;
  onClose: () => void;
  title: string;
}

const Modal: React.FC<ModalProps> = ({ isOpen, onClose, title }) => {
  const [render, setRender] = useState(isOpen);

  useEffect(() => {
    if (isOpen) setRender(true);
  }, [isOpen]);

  const handleAnimationEnd = () => {
    if (!isOpen) setRender(false);
  };

  if (!render) return null;

  return (
    <div 
      className={`fixed inset-0 z-50 flex items-center justify-center p-4 sm:p-0 transition-opacity duration-300 ${isOpen ? 'opacity-100' : 'opacity-0'}`}
    >
      <div 
        className="fixed inset-0 bg-primary/40 backdrop-blur-sm"
        onClick={onClose}
      ></div>
      
      <div 
        className={`relative bg-white rounded-2xl shadow-2xl w-full max-w-lg overflow-hidden flex flex-col ${isOpen ? 'modal-bounce' : 'scale-95 opacity-0 transition-all duration-200'}`}
        onAnimationEnd={handleAnimationEnd}
      >
        {/* Header */}
        <div className="flex justify-between items-center px-6 py-4 border-b border-slate-100 bg-slate-50">
          <h3 className="text-lg font-bold text-primary font-outfit">{title}</h3>
          <button 
            onClick={onClose}
            className="p-1.5 text-slate-400 hover:text-red-500 hover:bg-red-50 rounded-lg transition-colors"
          >
            <X size={20} />
          </button>
        </div>

        {/* Body */}
        <div className="p-6">
          <div className="flex gap-4 mb-6 p-4 bg-blue-50 rounded-xl border border-blue-100">
            <div className="w-12 h-12 rounded-full bg-blue-100 flex items-center justify-center flex-shrink-0">
              <FileText className="text-blue-600" size={24} />
            </div>
            <div>
              <p className="text-sm font-semibold text-slate-800">Dokumen KTP & Slip Gaji</p>
              <p className="text-xs text-slate-500 mt-1">Diupload oleh Budi Santoso pada 27 Juni 2026</p>
            </div>
          </div>
          
          <div className="space-y-4">
            <div className="flex justify-between items-center p-3 border border-slate-200 rounded-lg">
              <div className="flex items-center gap-3">
                <div className="w-8 h-8 bg-slate-100 rounded flex items-center justify-center">
                  <span className="text-xs font-bold text-slate-400">IMG</span>
                </div>
                <span className="text-sm font-medium text-slate-700">KTP_Budi.jpg</span>
              </div>
              <button className="text-primary hover:text-secondary p-2">
                <Download size={16} />
              </button>
            </div>
            
            <div className="flex justify-between items-center p-3 border border-slate-200 rounded-lg">
              <div className="flex items-center gap-3">
                <div className="w-8 h-8 bg-slate-100 rounded flex items-center justify-center">
                  <span className="text-xs font-bold text-slate-400">PDF</span>
                </div>
                <span className="text-sm font-medium text-slate-700">Slip_Gaji_Bulan_Lalu.pdf</span>
              </div>
              <button className="text-primary hover:text-secondary p-2">
                <Download size={16} />
              </button>
            </div>
          </div>
        </div>

        {/* Footer */}
        <div className="px-6 py-4 border-t border-slate-100 bg-slate-50 flex justify-end gap-3">
          <button 
            onClick={onClose}
            className="px-4 py-2 text-sm font-semibold text-slate-600 bg-white border border-slate-200 rounded-lg hover:bg-slate-50 transition-colors"
          >
            Tutup
          </button>
          <button 
            onClick={onClose}
            className="px-4 py-2 text-sm font-semibold text-white bg-primary rounded-lg shadow-md hover:bg-primary-light transition-colors"
          >
            Setujui Pinjaman
          </button>
        </div>
      </div>
    </div>
  );
};

export default Modal;
