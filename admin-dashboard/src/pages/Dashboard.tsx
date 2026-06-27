import React, { useState } from 'react';
import MetricsCards from '../components/MetricsCards';
import DashboardCharts from '../components/DashboardCharts';
import ActivityTables from '../components/ActivityTables';
import Modal from '../components/Modal';

const Dashboard: React.FC = () => {
  const [isModalOpen, setIsModalOpen] = useState(false);

  const handleOpenModal = () => setIsModalOpen(true);
  const handleCloseModal = () => setIsModalOpen(false);

  return (
    <>
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-primary font-outfit">Ringkasan Dashboard</h1>
        <p className="text-slate-500 mt-1">Selamat datang kembali, Admin Pusat! Berikut adalah ringkasan operasional hari ini.</p>
      </div>

      <MetricsCards />
      <DashboardCharts />
      <ActivityTables onOpenModal={handleOpenModal} />

      <Modal 
        isOpen={isModalOpen} 
        onClose={handleCloseModal} 
        title="Detail Persetujuan Transaksi" 
      />
    </>
  );
};

export default Dashboard;
