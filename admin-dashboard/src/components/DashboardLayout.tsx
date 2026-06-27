import React, { useState } from 'react';
import { Outlet } from 'react-router-dom';
import Sidebar from './Sidebar';
import Header from './Header';
import ToastContainer from './ToastContainer';

const DashboardLayout: React.FC = () => {
  const [isSidebarOpen, setIsSidebarOpen] = useState(false);

  const toggleSidebar = () => {
    setIsSidebarOpen(!isSidebarOpen);
  };

  return (
    <div className="min-h-screen bg-background relative overflow-hidden">
      <ToastContainer />
      {/* 3D Abstract Backgrounds matching Landing Page */}
      <div className="bg-shape shape-1"></div>
      <div className="bg-shape shape-2"></div>

      <Sidebar isOpen={isSidebarOpen} />

      {/* Overlay for mobile sidebar */}
      {isSidebarOpen && (
        <div 
          className="fixed inset-0 bg-primary/20 backdrop-blur-sm z-40 md:hidden"
          onClick={() => setIsSidebarOpen(false)}
        ></div>
      )}

      <div className={`transition-all duration-300 md:ml-64`}>
        <Header toggleSidebar={toggleSidebar} />
        
        <main className="p-6">
          <div className="max-w-7xl mx-auto">
            <Outlet />
          </div>
        </main>
      </div>
    </div>
  );
};

export default DashboardLayout;
