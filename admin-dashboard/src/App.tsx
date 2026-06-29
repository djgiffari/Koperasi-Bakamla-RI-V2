import { BrowserRouter as Router, Routes, Route, Navigate, Outlet } from 'react-router-dom';
import DashboardLayout from './components/DashboardLayout';

// Pages
import Dashboard from './pages/Dashboard';
import Simpanan from './pages/Simpanan';
import Pinjaman from './pages/Pinjaman';
import Angsuran from './pages/Angsuran';
import Anggota from './pages/Anggota';
import POS from './pages/POS';
import Inbox from './pages/Inbox';
import Settings from './pages/Settings';
import Laporan from './pages/Laporan';
import SHU from './pages/SHU';
import ManajemenUser from './pages/ManajemenUser';
import ProfilAdmin from './pages/ProfilAdmin';
import SystemLogs from './pages/SystemLogs';
import Broadcast from './pages/Broadcast';
import Pengaduan from './pages/Pengaduan';
import Login from './pages/Login';
import LandingPage from './pages/LandingPage';

const ProtectedRoute = () => {
  const token = localStorage.getItem('koperasi_token');
  if (!token) {
    return <Navigate to="/login" replace />;
  }
  return <Outlet />;
};

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<LandingPage />} />
        <Route path="/login" element={<Login />} />
        <Route element={<ProtectedRoute />}>
          <Route path="/dashboard" element={<DashboardLayout />}>
            <Route index element={<Dashboard />} />
            <Route path="simpanan" element={<Simpanan />} />
            <Route path="pinjaman" element={<Pinjaman />} />
            <Route path="angsuran" element={<Angsuran />} />
            <Route path="anggota" element={<Anggota />} />
            <Route path="pos" element={<POS />} />
            <Route path="inbox" element={<Inbox />} />
            <Route path="laporan" element={<Laporan />} />
            <Route path="shu" element={<SHU />} />
            <Route path="users" element={<ManajemenUser />} />
            <Route path="profil" element={<ProfilAdmin />} />
            <Route path="logs" element={<SystemLogs />} />
            <Route path="broadcast" element={<Broadcast />} />
            <Route path="pengaduan" element={<Pengaduan />} />
            <Route path="settings" element={<Settings />} />
          </Route>
        </Route>
      </Routes>
    </Router>
  );
}

export default App;
