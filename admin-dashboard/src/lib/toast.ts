export type ToastType = 'success' | 'error' | 'info';

type ToastListener = (message: string, type: ToastType) => void;

let listener: ToastListener | null = null;

export const toast = {
  subscribe: (newListener: ToastListener) => {
    listener = newListener;
  },
  show: (message: string, type: ToastType = 'info') => {
    if (listener) {
      listener(message, type);
    } else {
      console.log(`[Toast ${type}] ${message}`);
    }
  },
  success: (message: string) => toast.show(message, 'success'),
  error: (message: string) => toast.show(message, 'error'),
  info: (message: string) => toast.show(message, 'info'),
};
