//Carousel
const carousel = document.querySelector('.carousel');
const slides = document.querySelectorAll('.slide');
let currentIndex = 0;

function updateCarousel() {
    const offset = currentIndex * -100;
    carousel.style.transform = `translateX(${offset}%)`;

    slides.forEach((slide, index) => {
        if (index === currentIndex) {
            slide.classList.add('active');
        } else {
            slide.classList.remove('active');
        }
    });
}

function nextSlide() {
    currentIndex = (currentIndex + 1) % slides.length;
    updateCarousel();
}

// Initial update
updateCarousel();

// Auto-transition every 1.5 seconds
setInterval(nextSlide, 3000);

//Cards
document.addEventListener('DOMContentLoaded', function () {
    const movieCards = document.querySelectorAll('.movie-card');

    movieCards.forEach(card => {
        card.addEventListener('mouseenter', function () {
            this.querySelector('.movie-info').style.transform = 'translateY(0)';
        });

        card.addEventListener('mouseleave', function () {
            this.querySelector('.movie-info').style.transform = 'translateY(100%)';
        });
    });
});