import React, { useEffect, useState } from 'react';
import { toast } from '../lib/toast';
import type { ToastType } from '../lib/toast';
import { CheckCircle, AlertCircle, Info, X } from 'lucide-react';

interface ToastMessage {
  id: number;
  message: string;
  type: ToastType;
}

const ToastContainer: React.FC = () => {
  const [toasts, setToasts] = useState<ToastMessage[]>([]);

  useEffect(() => {
    toast.subscribe((message: string, type: ToastType) => {
      const id = Date.now();
      setToasts((prev) => [...prev, { id, message, type }]);
      
      setTimeout(() => {
        setToasts((prev) => prev.filter((t) => t.id !== id));
      }, 3000);
    });
  }, []);

  const removeToast = (id: number) => {
    setToasts((prev) => prev.filter((t) => t.id !== id));
  };

  if (toasts.length === 0) return null;

  return (
    <div className="fixed top-4 right-4 z-[100] flex flex-col gap-2">
      {toasts.map((t) => (
        <div 
          key={t.id} 
          className={`flex items-center gap-3 px-4 py-3 rounded-xl shadow-lg border animate-slide-in-right ${
            t.type === 'success' ? 'bg-emerald-50 border-emerald-200 text-emerald-800' :
            t.type === 'error' ? 'bg-red-50 border-red-200 text-red-800' :
            'bg-blue-50 border-blue-200 text-blue-800'
          }`}
        >
          {t.type === 'success' && <CheckCircle size={20} className="text-emerald-500" />}
          {t.type === 'error' && <AlertCircle size={20} className="text-red-500" />}
          {t.type === 'info' && <Info size={20} className="text-blue-500" />}
          
          <p className="text-sm font-medium">{t.message}</p>
          
          <button onClick={() => removeToast(t.id)} className="ml-auto opacity-60 hover:opacity-100 transition-opacity">
            <X size={16} />
          </button>
        </div>
      ))}
    </div>
  );
};

export default ToastContainer;
