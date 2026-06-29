import React, { useEffect, useState } from 'react';
import { AlertTriangle, X } from 'lucide-react';

interface ConfirmDialogProps {
  isOpen: boolean;
  onClose: () => void;
  onConfirm: () => void;
  title: string;
  message: string;
  confirmText?: string;
  cancelText?: string;
  confirmColor?: string;
}

const ConfirmDialog: React.FC<ConfirmDialogProps> = ({ 
  isOpen, 
  onClose, 
  onConfirm, 
  title, 
  message,
  confirmText = 'Hapus Data',
  cancelText = 'Batal',
  confirmColor = 'red'
}) => {
  if (!isOpen) return null;

  return (
    <div 
      className={`fixed inset-0 z-[60] flex items-center justify-center p-4 sm:p-0 transition-opacity duration-300 ${isOpen ? 'opacity-100' : 'opacity-0'}`}
    >
      <div 
        className="fixed inset-0 bg-primary/40 backdrop-blur-sm"
        onClick={onClose}
      ></div>
      
      <div 
        className={`relative bg-white rounded-2xl shadow-2xl w-full max-w-sm overflow-hidden flex flex-col p-6 text-center ${isOpen ? 'modal-bounce' : 'scale-95 opacity-0 transition-all duration-200'}`}
      >
        <button 
          onClick={onClose}
          className="absolute top-4 right-4 p-1.5 text-slate-400 hover:text-slate-600 rounded-lg transition-colors"
        >
          <X size={20} />
        </button>
        
        <div className="w-16 h-16 bg-red-100 rounded-full flex items-center justify-center mx-auto mb-4 mt-2">
          <AlertTriangle size={32} className="text-red-600" />
        </div>
        
        <h3 className="text-xl font-bold text-primary font-outfit mb-2">{title}</h3>
        <p className="text-slate-500 text-sm mb-8 leading-relaxed">
          {message}
        </p>

        <div className="flex gap-3 justify-center w-full">
          <button 
            onClick={onClose}
            className="flex-1 px-4 py-2.5 text-sm font-semibold text-slate-700 bg-slate-100 rounded-xl hover:bg-slate-200 transition-colors"
          >
            {cancelText}
          </button>
          <button 
            onClick={() => {
              onConfirm();
              onClose();
            }}
            className={`flex-1 px-4 py-2.5 text-sm font-semibold text-white rounded-xl shadow-md transition-colors ${
              confirmColor === 'red' ? 'bg-red-600 shadow-red-600/20 hover:bg-red-700' :
              confirmColor === 'blue' ? 'bg-primary shadow-primary/20 hover:bg-secondary' :
              'bg-emerald-600 shadow-emerald-600/20 hover:bg-emerald-700'
            }`}
          >
            {confirmText}
          </button>
        </div>
      </div>
    </div>
  );
};

export default ConfirmDialog;
