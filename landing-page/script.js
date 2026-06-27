// Navbar scroll effect
window.addEventListener('scroll', () => {
    const navbar = document.querySelector('.navbar');
    if (window.scrollY > 50) {
        navbar.classList.add('scrolled');
    } else {
        navbar.classList.remove('scrolled');
    }
});

// 3D Parallax Effect for Hero Card
const heroVisual = document.querySelector('.hero-visual');
const card3dWrapper = document.querySelector('.card-3d-wrapper');
const float1 = document.querySelector('.float-1');
const float2 = document.querySelector('.float-2');

if (heroVisual && card3dWrapper) {
    heroVisual.addEventListener('mousemove', (e) => {
        const xAxis = (window.innerWidth / 2 - e.pageX) / 25;
        const yAxis = (window.innerHeight / 2 - e.pageY) / 25;
        
        card3dWrapper.style.transform = `rotateY(${xAxis}deg) rotateX(${yAxis}deg)`;
        
        // Parallax for floating elements
        float1.style.transform = `translate(${xAxis * 2}px, ${yAxis * 2}px)`;
        float2.style.transform = `translate(${xAxis * -1.5}px, ${yAxis * -1.5}px)`;
    });

    heroVisual.addEventListener('mouseenter', () => {
        card3dWrapper.style.transition = 'none';
        float1.style.transition = 'none';
        float2.style.transition = 'none';
    });

    heroVisual.addEventListener('mouseleave', () => {
        card3dWrapper.style.transition = 'transform 0.5s ease';
        card3dWrapper.style.transform = `rotateY(0deg) rotateX(0deg)`;
        
        float1.style.transition = 'transform 0.5s ease';
        float1.style.transform = `translate(0px, 0px)`;
        
        float2.style.transition = 'transform 0.5s ease';
        float2.style.transform = `translate(0px, 0px)`;
    });
}

// 3D Tilt Effect for Feature Cards
const tiltCards = document.querySelectorAll('.tilt-card');

tiltCards.forEach(card => {
    card.addEventListener('mousemove', (e) => {
        const cardRect = card.getBoundingClientRect();
        const cardWidth = cardRect.width;
        const cardHeight = cardRect.height;
        const centerX = cardRect.left + cardWidth / 2;
        const centerY = cardRect.top + cardHeight / 2;
        const mouseX = e.clientX - centerX;
        const mouseY = e.clientY - centerY;
        
        const rotateX = (mouseY / (cardHeight / 2)) * -10; // Max tilt 10deg
        const rotateY = (mouseX / (cardWidth / 2)) * 10;
        
        card.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) scale3d(1.02, 1.02, 1.02)`;
    });
    
    card.addEventListener('mouseleave', () => {
        card.style.transform = `perspective(1000px) rotateX(0deg) rotateY(0deg) scale3d(1, 1, 1)`;
    });
});

// Smooth Scroll for Anchor Links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        document.querySelector(this.getAttribute('href')).scrollIntoView({
            behavior: 'smooth'
        });
    });
});
