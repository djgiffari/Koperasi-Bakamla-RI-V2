import React, { useState, useEffect } from 'react';
import MetricsCards from '../components/MetricsCards';
import DashboardCharts from '../components/DashboardCharts';
import ActivityTables from '../components/ActivityTables';
import Modal from '../components/Modal';
import { api } from '../lib/api';

const Dashboard: React.FC = () => {
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [dashboardData, setDashboardData] = useState<any>(null);
  const [isLoading, setIsLoading] = useState(true);
  const [selectedYear, setSelectedYear] = useState<number | null>(null);

  useEffect(() => {
    const fetchDashboard = async () => {
      try {
        setIsLoading(true);
        const url = selectedYear ? `/dashboard?year=${selectedYear}` : '/dashboard';
        const data = await api.get(url);
        setDashboardData(data);
      } catch (error) {
        console.error('Error fetching dashboard:', error);
      } finally {
        setIsLoading(false);
      }
    };
    fetchDashboard();
  }, [selectedYear]);

  const handleOpenModal = () => setIsModalOpen(true);
  const handleCloseModal = () => setIsModalOpen(false);

  return (
    <>
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-primary font-outfit">Ringkasan Dashboard</h1>
        <p className="text-slate-500 mt-1">Selamat datang kembali, Admin Pusat! Berikut adalah ringkasan operasional hari ini.</p>
      </div>

      {isLoading && !dashboardData ? (
        <div className="flex justify-center py-12">
          <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-primary"></div>
        </div>
      ) : (
        <>
          <MetricsCards metrics={dashboardData?.metrics} />
          <DashboardCharts 
            charts={dashboardData?.charts} 
            availableYears={dashboardData?.availableYears}
            selectedYear={selectedYear}
            onYearChange={(year) => setSelectedYear(year)}
          />
          <ActivityTables 
            onOpenModal={handleOpenModal} 
            pendingApprovals={dashboardData?.pendingApprovals}
            recentActivities={dashboardData?.recentActivities}
          />
        </>
      )}

      <Modal 
        isOpen={isModalOpen} 
        onClose={handleCloseModal} 
        title="Detail Persetujuan Transaksi" 
      />
    </>
  );
};

export default Dashboard;
