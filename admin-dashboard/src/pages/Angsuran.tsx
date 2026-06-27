import React from 'react';
import EmptyState from '../components/EmptyState';
import { CalendarCheck } from 'lucide-react';

const Angsuran: React.FC = () => {
  return (
    <div className="space-y-6">
      <div className="flex justify-between items-center">
        <div>
          <h1 className="text-3xl font-bold text-primary font-outfit">Jadwal Angsuran</h1>
          <p className="text-slate-500 mt-1">Pantau pembayaran angsuran anggota setiap bulan.</p>
        </div>
      </div>

      <EmptyState 
        icon={CalendarCheck}
        title="Tidak ada angsuran jatuh tempo"
        description="Semua data pembayaran angsuran bulanan akan dicatat di sini. Anda juga bisa mengunggah bukti transfer manual jika dibutuhkan."
      />
    </div>
  );
};

export default Angsuran;
