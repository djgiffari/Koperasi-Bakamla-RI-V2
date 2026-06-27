import React from 'react';
import type { LucideIcon } from 'lucide-react';

interface EmptyStateProps {
  icon: LucideIcon;
  title: string;
  description: string;
  actionText?: string;
  onAction?: () => void;
}

const EmptyState: React.FC<EmptyStateProps> = ({ icon: Icon, title, description, actionText, onAction }) => {
  return (
    <div className="glass-panel p-12 flex flex-col items-center justify-center text-center min-h-[400px]">
      <div className="w-24 h-24 bg-slate-100 rounded-full flex items-center justify-center mb-6">
        <Icon size={48} className="text-slate-400" />
      </div>
      <h3 className="text-2xl font-bold text-primary font-outfit mb-3">{title}</h3>
      <p className="text-slate-500 max-w-md mb-8 leading-relaxed">
        {description}
      </p>
      
      {actionText && onAction && (
        <button 
          onClick={onAction}
          className="btn btn-primary"
        >
          {actionText}
        </button>
      )}
    </div>
  );
};

export default EmptyState;
