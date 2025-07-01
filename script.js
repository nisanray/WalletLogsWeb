// Global variables
let isMenuOpen = false;
let scrollOffset = 0;
let particleAnimationId;

// DOM Elements
const navbar = document.getElementById('navbar');
const mobileMenuBtn = document.getElementById('mobileMenuBtn');
const mobileMenu = document.getElementById('mobileMenu');
const scrollToTopBtn = document.getElementById('scrollToTopBtn');
const particleCanvas = document.getElementById('particleCanvas');

// Initialize when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
    initializeAnimations();
    initializeScrollListener();
    initializeParticleBackground();
    initializeMobileMenu();
    initializeAuthTabs();
    initializeFAQs();
    initializeCounterAnimations();
    initializeScreenshotsCarousel();
    initializeFormHandlers();
});

// Particle Background Animation
function initializeParticleBackground() {
    const canvas = particleCanvas;
    const ctx = canvas.getContext('2d');
    
    // Set canvas size
    function resizeCanvas() {
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
    }
    
    resizeCanvas();
    window.addEventListener('resize', resizeCanvas);
    
    // Particle system
    const particles = [];
    const particleCount = 50;
    
    class Particle {
        constructor() {
            this.x = Math.random() * canvas.width;
            this.y = Math.random() * canvas.height;
            this.vx = (Math.random() - 0.5) * 0.5;
            this.vy = (Math.random() - 0.5) * 0.5;
            this.radius = Math.random() * 2 + 1;
            this.opacity = Math.random() * 0.5 + 0.2;
            this.color = `rgba(99, 102, 241, ${this.opacity})`;
        }
        
        update() {
            this.x += this.vx;
            this.y += this.vy;
            
            if (this.x < 0 || this.x > canvas.width) this.vx *= -1;
            if (this.y < 0 || this.y > canvas.height) this.vy *= -1;
            
            // Floating animation
            this.y += Math.sin(Date.now() * 0.001 + this.x * 0.01) * 0.1;
        }
        
        draw() {
            ctx.beginPath();
            ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2);
            ctx.fillStyle = this.color;
            ctx.fill();
            
            // Add glow effect
            ctx.shadowBlur = 10;
            ctx.shadowColor = this.color;
            ctx.fill();
            ctx.shadowBlur = 0;
        }
    }
    
    // Create particles
    for (let i = 0; i < particleCount; i++) {
        particles.push(new Particle());
    }
    
    // Animation loop
    function animateParticles() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        
        particles.forEach(particle => {
            particle.update();
            particle.draw();
        });
        
        // Draw connections
        for (let i = 0; i < particles.length; i++) {
            for (let j = i + 1; j < particles.length; j++) {
                const dx = particles[i].x - particles[j].x;
                const dy = particles[i].y - particles[j].y;
                const distance = Math.sqrt(dx * dx + dy * dy);
                
                if (distance < 100) {
                    ctx.beginPath();
                    ctx.moveTo(particles[i].x, particles[i].y);
                    ctx.lineTo(particles[j].x, particles[j].y);
                    ctx.strokeStyle = `rgba(99, 102, 241, ${0.1 * (1 - distance / 100)})`;
                    ctx.lineWidth = 1;
                    ctx.stroke();
                }
            }
        }
        
        particleAnimationId = requestAnimationFrame(animateParticles);
    }
    
    animateParticles();
}

// Scroll functionality
function initializeScrollListener() {
    window.addEventListener('scroll', function() {
        scrollOffset = window.pageYOffset;
        
        // Update navbar
        if (scrollOffset > 100) {
            navbar.classList.add('scrolled');
            scrollToTopBtn.classList.add('visible');
        } else {
            navbar.classList.remove('scrolled');
            scrollToTopBtn.classList.remove('visible');
        }
        
        // Parallax effect for floating shapes
        const floatingShapes = document.querySelectorAll('.floating-circle, .floating-triangle, .floating-rectangle');
        floatingShapes.forEach((shape, index) => {
            const speed = 0.5 + (index * 0.1);
            shape.style.transform = `translateY(${scrollOffset * speed}px) rotate(${scrollOffset * 0.1}deg)`;
        });
        
        // Animate elements on scroll
        animateOnScroll();
    });
    
    // Scroll to top button
    scrollToTopBtn.addEventListener('click', function() {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
}

// Mobile menu functionality
function initializeMobileMenu() {
    mobileMenuBtn.addEventListener('click', function() {
        isMenuOpen = !isMenuOpen;
        
        if (isMenuOpen) {
            mobileMenu.style.display = 'block';
            mobileMenu.classList.add('active');
            mobileMenuBtn.querySelector('.material-icons').style.transform = 'rotate(90deg)';
        } else {
            mobileMenu.classList.remove('active');
            setTimeout(() => {
                mobileMenu.style.display = 'none';
            }, 300);
            mobileMenuBtn.querySelector('.material-icons').style.transform = 'rotate(0deg)';
        }
    });
    
    // Close mobile menu when clicking on links
    const mobileNavItems = document.querySelectorAll('.mobile-nav-item');
    mobileNavItems.forEach(item => {
        item.addEventListener('click', function() {
            isMenuOpen = false;
            mobileMenu.classList.remove('active');
            setTimeout(() => {
                mobileMenu.style.display = 'none';
            }, 300);
            mobileMenuBtn.querySelector('.material-icons').style.transform = 'rotate(0deg)';
        });
    });
}

// Smooth scrolling for navigation links
function scrollToSection(sectionId) {
    const element = document.getElementById(sectionId);
    if (element) {
        const offsetTop = element.offsetTop - 80; // Account for fixed navbar
        window.scrollTo({
            top: offsetTop,
            behavior: 'smooth'
        });
    }
}

// Add click handlers to all navigation links
document.addEventListener('DOMContentLoaded', function() {
    const navLinks = document.querySelectorAll('a[href^="#"]');
    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const targetId = this.getAttribute('href').substring(1);
            scrollToSection(targetId);
        });
    });
});

// Initialize animations on scroll
function animateOnScroll() {
    const elements = document.querySelectorAll('.stat-card, .feature-card, .step-card, .testimonial-card, .pricing-card, .team-member');
    
    elements.forEach(element => {
        const elementTop = element.getBoundingClientRect().top;
        const elementVisible = 150;
        
        if (elementTop < window.innerHeight - elementVisible) {
            element.style.opacity = '1';
            element.style.transform = 'translateY(0)';
        }
    });
}

// Initialize counter animations
function initializeCounterAnimations() {
    const counters = document.querySelectorAll('.stat-number');
    const observerOptions = {
        threshold: 0.7
    };
    
    const observer = new IntersectionObserver(function(entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const counter = entry.target;
                const target = parseInt(counter.getAttribute('data-target'));
                const duration = 2000; // 2 seconds
                const step = target / (duration / 16); // 60fps
                let current = 0;
                
                const timer = setInterval(() => {
                    current += step;
                    if (current >= target) {
                        current = target;
                        clearInterval(timer);
                    }
                    counter.textContent = Math.floor(current).toLocaleString();
                }, 16);
                
                observer.unobserve(counter);
            }
        });
    }, observerOptions);
    
    counters.forEach(counter => {
        observer.observe(counter);
        // Set initial styles for animation
        counter.closest('.stat-card').style.opacity = '0';
        counter.closest('.stat-card').style.transform = 'translateY(30px)';
        counter.closest('.stat-card').style.transition = 'all 0.6s ease';
    });
}

// Auth tabs functionality
function initializeAuthTabs() {
    const authTabs = document.querySelectorAll('.auth-tab');
    const loginForm = document.getElementById('loginForm');
    const registerForm = document.getElementById('registerForm');
    
    authTabs.forEach(tab => {
        tab.addEventListener('click', function() {
            // Remove active class from all tabs
            authTabs.forEach(t => t.classList.remove('active'));
            
            // Add active class to clicked tab
            this.classList.add('active');
            
            // Show/hide forms
            const tabType = this.getAttribute('data-tab');
            if (tabType === 'login') {
                loginForm.style.display = 'block';
                registerForm.style.display = 'none';
            } else {
                loginForm.style.display = 'none';
                registerForm.style.display = 'block';
            }
        });
    });
}

// FAQ functionality
function initializeFAQs() {
    const faqItems = document.querySelectorAll('.faq-item');
    
    faqItems.forEach(item => {
        const question = item.querySelector('.faq-question');
        question.addEventListener('click', function() {
            // Close all other FAQ items
            faqItems.forEach(otherItem => {
                if (otherItem !== item) {
                    otherItem.classList.remove('active');
                }
            });
            
            // Toggle current item
            item.classList.toggle('active');
        });
    });
}

// Carousel for screenshots section
function initializeScreenshotsCarousel() {
    const items = document.querySelectorAll('.screenshots-carousel .screenshot-item');
    const leftArrow = document.querySelector('.screenshots-carousel .screenshot-arrow.left');
    const rightArrow = document.querySelector('.screenshots-carousel .screenshot-arrow.right');
    let current = 0;

    function show(index) {
        items.forEach((item, i) => {
            item.classList.toggle('active', i === index);
        });
    }

    function prevScreenshot() {
        current = (current - 1 + items.length) % items.length;
        show(current);
    }

    function nextScreenshot() {
        current = (current + 1) % items.length;
        show(current);
    }

    leftArrow.addEventListener('click', prevScreenshot);
    rightArrow.addEventListener('click', nextScreenshot);
    show(current);

    // Optional: swipe support for mobile
    let startX = null;
    const carousel = document.querySelector('.screenshots-carousel');
    carousel.addEventListener('touchstart', e => {
        startX = e.touches[0].clientX;
    });
    carousel.addEventListener('touchend', e => {
        if (startX === null) return;
        let endX = e.changedTouches[0].clientX;
        if (endX - startX > 50) prevScreenshot();
        else if (startX - endX > 50) nextScreenshot();
        startX = null;
    });
}

// Screenshot carousel auto-slide and swipe/click navigation
(function() {
    const carousel = document.querySelector('.screenshots-carousel');
    const items = carousel.querySelectorAll('.screenshot-item');
    let current = 0;
    let timer = null;

    function show(index) {
        items.forEach((item, i) => {
            item.classList.toggle('active', i === index);
        });
        current = index;
    }

    function next() {
        show((current + 1) % items.length);
    }
    function prev() {
        show((current - 1 + items.length) % items.length);
    }

    // Auto-slide every 2 seconds
    function startAutoSlide() {
        timer = setInterval(next, 2000);
    }
    function stopAutoSlide() {
        clearInterval(timer);
    }

    // Touch/drag/swipe support
    let startX = null;
    carousel.addEventListener('touchstart', e => {
        stopAutoSlide();
        startX = e.touches[0].clientX;
    });
    carousel.addEventListener('touchend', e => {
        if (startX === null) return;
        let endX = e.changedTouches[0].clientX;
        if (endX - startX > 40) prev();
        else if (startX - endX > 40) next();
        startX = null;
        startAutoSlide();
    });

    // Mouse drag support
    let mouseDown = false, mouseStartX = null;
    carousel.addEventListener('mousedown', e => {
        stopAutoSlide();
        mouseDown = true;
        mouseStartX = e.clientX;
    });
    carousel.addEventListener('mouseup', e => {
        if (!mouseDown) return;
        let mouseEndX = e.clientX;
        if (mouseEndX - mouseStartX > 40) prev();
        else if (mouseStartX - mouseEndX > 40) next();
        mouseDown = false;
        startAutoSlide();
    });

    // Click to slide (left/right half)
    carousel.addEventListener('click', e => {
        const rect = carousel.getBoundingClientRect();
        if (e.clientX - rect.left < rect.width / 2) prev();
        else next();
    });

    // Start auto-slide
    show(0);
    startAutoSlide();
})();

// Form submission handlers
function initializeFormHandlers() {
    const forms = document.querySelectorAll('form');
    
    forms.forEach(form => {
        form.addEventListener('submit', function(e) {
            e.preventDefault();
            
            // Show loading state
            const submitBtn = form.querySelector('button[type="submit"]');
            const originalText = submitBtn.textContent;
            submitBtn.textContent = 'Processing...';
            submitBtn.disabled = true;
            
            // Simulate form submission
            setTimeout(() => {
                alert('Form submitted successfully! (This is a demo)');
                
                // Reset form
                form.reset();
                submitBtn.textContent = originalText;
                submitBtn.disabled = false;
            }, 2000);
        });
    });
}

// Initialize all animations
function initializeAnimations() {
    // Set initial animation states
    const animatedElements = document.querySelectorAll('.feature-card, .step-card, .testimonial-card, .pricing-card, .team-member');
    animatedElements.forEach(element => {
        element.style.opacity = '0';
        element.style.transform = 'translateY(30px)';
        element.style.transition = 'all 0.6s ease';
    });
    
    // Stagger animations for hero elements
    const heroElements = document.querySelectorAll('.hero-badge, .hero-title, .hero-subtitle, .trust-indicators, .hero-buttons');
    heroElements.forEach((element, index) => {
        element.style.opacity = '0';
        element.style.transform = 'translateY(30px)';
        element.style.animation = `fadeInUp 1s ease-out ${index * 0.2}s forwards`;
    });
    
    // Phone mockup animation
    const heroMockup = document.querySelector('.hero-mockup');
    if (heroMockup) {
        heroMockup.style.opacity = '0';
        heroMockup.style.transform = 'translateX(50px)';
        heroMockup.style.animation = 'slideInRight 1s ease-out 0.5s forwards';
    }
}

// Utility functions
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

// Intersection Observer for better performance
function createIntersectionObserver() {
    const options = {
        root: null,
        rootMargin: '0px',
        threshold: 0.1
    };
    
    const observer = new IntersectionObserver(function(entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('animate-in');
            }
        });
    }, options);
    
    // Observe all animatable elements
    const targets = document.querySelectorAll('.stat-card, .feature-card, .step-card, .testimonial-card, .pricing-card, .team-member');
    targets.forEach(target => {
        observer.observe(target);
    });
}

// Add resize handler for responsive behavior
window.addEventListener('resize', debounce(function() {
    // Recalculate particle canvas size
    if (particleCanvas) {
        particleCanvas.width = window.innerWidth;
        particleCanvas.height = window.innerHeight;
    }
    
    // Close mobile menu on desktop
    if (window.innerWidth > 768 && isMenuOpen) {
        isMenuOpen = false;
        mobileMenu.classList.remove('active');
        mobileMenu.style.display = 'none';
        mobileMenuBtn.querySelector('.material-icons').style.transform = 'rotate(0deg)';
    }
}, 250));

// Add smooth hover effects
document.addEventListener('mouseover', function(e) {
    if (e.target.classList.contains('btn-primary') || e.target.classList.contains('btn-secondary')) {
        e.target.style.transform = 'translateY(-2px)';
    }
});

document.addEventListener('mouseout', function(e) {
    if (e.target.classList.contains('btn-primary') || e.target.classList.contains('btn-secondary')) {
        e.target.style.transform = 'translateY(0)';
    }
});

// Add loading screen (optional)
window.addEventListener('load', function() {
    document.body.classList.add('loaded');
    
    // Start intersection observer
    createIntersectionObserver();
    
    // Initialize any additional animations
    setTimeout(() => {
        const heroSection = document.querySelector('.hero-section');
        if (heroSection) {
            heroSection.classList.add('loaded');
        }
    }, 100);
});

// Expose global functions
window.scrollToSection = scrollToSection;

// Add CSS for loaded states
const loadedStyles = `
    .loaded .hero-badge {
        animation: scaleIn 0.8s ease-out 0.2s forwards;
    }
    
    .animate-in {
        opacity: 1 !important;
        transform: translateY(0) !important;
    }
    
    @keyframes scaleIn {
        from {
            opacity: 0;
            transform: scale(0.8);
        }
        to {
            opacity: 1;
            transform: scale(1);
        }
    }
    
    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
`;

// Inject additional styles
const style = document.createElement('style');
style.textContent = loadedStyles;
document.head.appendChild(style);
