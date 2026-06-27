import React, { useEffect, useRef } from 'react';
import { Link } from 'react-router-dom';
import '../assets/landing.css';

const LandingPage: React.FC = () => {
  const navbarRef = useRef<HTMLElement>(null);
  const heroVisualRef = useRef<HTMLDivElement>(null);
  const card3dWrapperRef = useRef<HTMLDivElement>(null);
  const float1Ref = useRef<HTMLDivElement>(null);
  const float2Ref = useRef<HTMLDivElement>(null);

  useEffect(() => {
    // Navbar scroll effect
    const handleScroll = () => {
      if (navbarRef.current) {
        if (window.scrollY > 50) {
          navbarRef.current.classList.add('scrolled');
        } else {
          navbarRef.current.classList.remove('scrolled');
        }
      }
    };
    window.addEventListener('scroll', handleScroll);

    // 3D Parallax Effect for Hero Card
    const heroVisual = heroVisualRef.current;
    const card3dWrapper = card3dWrapperRef.current;
    const float1 = float1Ref.current;
    const float2 = float2Ref.current;

    const handleMouseMoveHero = (e: MouseEvent) => {
      if (!card3dWrapper || !float1 || !float2) return;
      const xAxis = (window.innerWidth / 2 - e.pageX) / 25;
      const yAxis = (window.innerHeight / 2 - e.pageY) / 25;
      
      card3dWrapper.style.transform = `rotateY(${xAxis}deg) rotateX(${yAxis}deg)`;
      
      float1.style.transform = `translate(${xAxis * 2}px, ${yAxis * 2}px)`;
      float2.style.transform = `translate(${xAxis * -1.5}px, ${yAxis * -1.5}px)`;
    };

    const handleMouseEnterHero = () => {
      if (!card3dWrapper || !float1 || !float2) return;
      card3dWrapper.style.transition = 'none';
      float1.style.transition = 'none';
      float2.style.transition = 'none';
    };

    const handleMouseLeaveHero = () => {
      if (!card3dWrapper || !float1 || !float2) return;
      card3dWrapper.style.transition = 'transform 0.5s ease';
      card3dWrapper.style.transform = `rotateY(0deg) rotateX(0deg)`;
      
      float1.style.transition = 'transform 0.5s ease';
      float1.style.transform = `translate(0px, 0px)`;
      
      float2.style.transition = 'transform 0.5s ease';
      float2.style.transform = `translate(0px, 0px)`;
    };

    if (heroVisual) {
      heroVisual.addEventListener('mousemove', handleMouseMoveHero);
      heroVisual.addEventListener('mouseenter', handleMouseEnterHero);
      heroVisual.addEventListener('mouseleave', handleMouseLeaveHero);
    }

    // 3D Tilt Effect for Feature Cards
    const tiltCards = document.querySelectorAll('.tilt-card');
    
    const handleMouseMoveTilt = (e: Event) => {
      const mouseEvent = e as MouseEvent;
      const card = mouseEvent.currentTarget as HTMLElement;
      const cardRect = card.getBoundingClientRect();
      const cardWidth = cardRect.width;
      const cardHeight = cardRect.height;
      const centerX = cardRect.left + cardWidth / 2;
      const centerY = cardRect.top + cardHeight / 2;
      const mouseX = mouseEvent.clientX - centerX;
      const mouseY = mouseEvent.clientY - centerY;
      
      const rotateX = (mouseY / (cardHeight / 2)) * -10;
      const rotateY = (mouseX / (cardWidth / 2)) * 10;
      
      card.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) scale3d(1.02, 1.02, 1.02)`;
    };

    const handleMouseLeaveTilt = (e: Event) => {
      const card = e.currentTarget as HTMLElement;
      card.style.transform = `perspective(1000px) rotateX(0deg) rotateY(0deg) scale3d(1, 1, 1)`;
    };

    tiltCards.forEach(card => {
      card.addEventListener('mousemove', handleMouseMoveTilt);
      card.addEventListener('mouseleave', handleMouseLeaveTilt);
    });

    return () => {
      window.removeEventListener('scroll', handleScroll);
      if (heroVisual) {
        heroVisual.removeEventListener('mousemove', handleMouseMoveHero);
        heroVisual.removeEventListener('mouseenter', handleMouseEnterHero);
        heroVisual.removeEventListener('mouseleave', handleMouseLeaveHero);
      }
      tiltCards.forEach(card => {
        card.removeEventListener('mousemove', handleMouseMoveTilt);
        card.removeEventListener('mouseleave', handleMouseLeaveTilt);
      });
    };
  }, []);

  const handleSmoothScroll = (e: React.MouseEvent<HTMLAnchorElement, MouseEvent>, targetId: string) => {
    e.preventDefault();
    const element = document.getElementById(targetId);
    if (element) {
      element.scrollIntoView({ behavior: 'smooth' });
    }
  };

  return (
    <div className="landing-page-wrapper">
      {/* Abstract 3D Background Elements */}
      <div className="bg-shape shape-1"></div>
      <div className="bg-shape shape-2"></div>

      {/* Navigation */}
      <nav className="navbar" ref={navbarRef}>
        <div className="container nav-container">
          <div className="logo">
            <img src="/logo.png" alt="Logo Koperasi Bakamla" className="logo-img" />
            <span className="logo-text">Koperasi Bakamla RI</span>
          </div>
          <ul className="nav-links">
            <li><a href="#beranda" onClick={(e) => handleSmoothScroll(e, 'beranda')}>Beranda</a></li>
            <li><a href="#fitur" onClick={(e) => handleSmoothScroll(e, 'fitur')}>Layanan</a></li>
            <li><a href="#toko" onClick={(e) => handleSmoothScroll(e, 'toko')}>Toko Koperasi</a></li>
          </ul>
          <div className="nav-actions">
            <Link to="/login" className="btn btn-outline">Masuk</Link>
            <a href="#" className="btn btn-primary">Daftar Anggota</a>
          </div>
        </div>
      </nav>

      {/* Hero Section */}
      <section id="beranda" className="hero">
        <div className="container hero-container">
          <div className="hero-content" data-aos="fade-up">
            <div className="badge">🚀 Versi 2.1 Telah Hadir</div>
            <h1 className="hero-title">Koperasi Modern, <br/>Aman, & <span className="text-gold">Real-time</span></h1>
            <p className="hero-desc">Nikmati kemudahan mengakses layanan Koperasi Bakamla RI di ujung jari Anda. Simpanan, Pinjaman, dan Belanja menjadi lebih transparan dan cepat.</p>
            <div className="hero-buttons">
              <a href="#" className="btn btn-primary btn-lg">Download Aplikasi</a>
              <a href="#fitur" onClick={(e) => handleSmoothScroll(e, 'fitur')} className="btn btn-glass btn-lg">Pelajari Lebih Lanjut</a>
            </div>
          </div>
          
          <div className="hero-visual" ref={heroVisualRef}>
            {/* 3D Card Effect Container */}
            <div className="card-3d-wrapper" ref={card3dWrapperRef}>
              <div className="glass-card card-3d">
                <div className="card-header">
                  <img src="/logo.png" alt="Logo" className="card-logo" />
                  <span>Saldo Utama</span>
                </div>
                <div className="card-balance">
                  <h3>Rp 12.500.000</h3>
                  <p>Total Simpanan</p>
                </div>
                <div className="card-footer">
                  <div className="card-info">
                    <span>Status</span>
                    <strong>Anggota Aktif</strong>
                  </div>
                  <div className="card-icon">
                    {/* Abstract icon */}
                    <div className="icon-circle"></div>
                    <div className="icon-circle-overlap"></div>
                  </div>
                </div>
              </div>
            </div>
            {/* Floating Elements */}
            <div className="floating-element float-1" ref={float1Ref}></div>
            <div className="floating-element float-2" ref={float2Ref}></div>
          </div>
        </div>
      </section>

      {/* Features Section */}
      <section id="fitur" className="features">
        <div className="container">
          <div className="section-header">
            <h2>Layanan Digital <span className="text-gold">Terpadu</span></h2>
            <p>Akses semua layanan koperasi secara transparan dan mudah melalui smartphone Anda.</p>
          </div>
          
          <div className="features-grid">
            {/* Feature 1 */}
            <div className="feature-card tilt-card">
              <div className="feature-icon icon-blue">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/24/svg">
                  <path d="M21 4H3C1.89543 4 1 4.89543 1 6V18C1 19.1046 1.89543 20 3 20H21C22.1046 20 23 19.1046 23 18V6C23 4.89543 22.1046 4 21 4Z" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                  <path d="M1 10H23" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                </svg>
              </div>
              <h3>Simpanan Fleksibel</h3>
              <p>Pantau saldo Simpanan Pokok, Wajib, dan Sukarela secara real-time. Setor dengan mudah via Transfer Bank.</p>
            </div>
            
            {/* Feature 2 */}
            <div className="feature-card tilt-card">
              <div className="feature-icon icon-gold">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/24/svg">
                  <path d="M12 1V23" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                  <path d="M17 5H9.5C8.57174 5 7.6815 5.36875 7.02513 6.02513C6.36875 6.6815 6 7.57174 6 8.5C6 9.42826 6.36875 10.3185 7.02513 10.9749C7.6815 11.6313 8.57174 12 9.5 12H14.5C15.4283 12 16.3185 12.3687 16.9749 13.0251C17.6313 13.6815 18 14.5717 18 15.5C18 16.4283 17.6313 17.3185 16.9749 17.9749C16.3185 18.6313 15.4283 19 14.5 19H6" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                </svg>
              </div>
              <h3>Pinjaman Cepat</h3>
              <p>Ajukan pinjaman dengan upload KTP dan Slip Gaji langsung dari aplikasi. Sistem approval berjenjang yang aman.</p>
            </div>

            {/* Feature 3 */}
            <div className="feature-card tilt-card">
              <div className="feature-icon icon-green">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/24/svg">
                  <path d="M9 21H5C4.46957 21 3.96086 20.7893 3.58579 20.4142C3.21071 20.0391 3 19.5304 3 19V5C3 4.46957 3.21071 3.96086 3.58579 3.58579C3.96086 3.21071 4.46957 3 5 3H19C19.5304 3 20.0391 3.21071 20.4142 3.58579C20.7893 3.96086 21 4.46957 21 5V9" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                  <path d="M16 17L18 19L22 15" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                  <path d="M9 3V21" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                </svg>
              </div>
              <h3>Toko Koperasi Terintegrasi</h3>
              <p>Belanja kebutuhan sembako lewat Point of Sales (POS) atau langsung checkout dari smartphone Anda via saldo koperasi.</p>
            </div>
          </div>
        </div>
      </section>

      {/* App Preview Section (3D Mockup area) */}
      <section id="toko" className="preview-section">
        <div className="container preview-container">
          <div className="preview-visual tilt-card">
            <div className="mockup-glass">
              <div className="mockup-header">
                <div className="dot"></div><div className="dot"></div><div className="dot"></div>
              </div>
              <div className="mockup-body">
                <div className="skeleton-title"></div>
                <div className="skeleton-card"></div>
                <div className="skeleton-grid">
                  <div className="s-box"></div>
                  <div className="s-box"></div>
                  <div className="s-box"></div>
                  <div className="s-box"></div>
                </div>
              </div>
            </div>
          </div>
          <div className="preview-content">
            <h2>Integrasi <span className="text-gold">Sistem Sempurna</span></h2>
            <p>Semua transaksi disinkronisasikan secara real-time antara Web Admin Dashboard dan Aplikasi Mobile Anggota. Pengelolaan data menjadi lebih rapi dan bebas repot.</p>
            <ul className="checklist">
              <li>✓ Notifikasi Approval Transaksi</li>
              <li>✓ Live Chat Bantuan Anggota</li>
              <li>✓ Grafik Arus Kas Instan</li>
            </ul>
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="cta-section">
        <div className="container cta-container glass-card">
          <h2>Siap Bergabung dengan Koperasi Modern?</h2>
          <p>Daftarkan diri Anda sekarang dan nikmati seluruh kemudahan layanan Koperasi Bakamla RI.</p>
          <div className="cta-buttons">
            <a href="#" className="btn btn-gold btn-lg">Daftar Sekarang</a>
          </div>
        </div>
      </section>

      <footer>
        <div className="container footer-container">
          <div className="footer-left">
            <div className="logo">
              <img src="/logo.png" alt="Logo Koperasi Bakamla" className="logo-img" />
              <span className="logo-text">Koperasi Bakamla RI</span>
            </div>
            <p>Mendigitalisasi layanan demi kenyamanan anggota secara aman dan real-time.</p>
          </div>
          <div className="footer-right">
            <p>&copy; 2026 Koperasi Bakamla RI. All rights reserved.</p>
          </div>
        </div>
      </footer>
    </div>
  );
};

export default LandingPage;
