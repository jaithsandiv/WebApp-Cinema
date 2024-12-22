document.addEventListener('DOMContentLoaded', function () {
    const starRating = document.getElementById('star-rating');
    const stars = starRating.querySelectorAll('i');
    let rating = 0;

    function updateStars(selectedRating) {
        stars.forEach((star, index) => {
            if (index < selectedRating) {
                star.classList.remove('bi-star');
                star.classList.add('bi-star-fill', 'active');
            } else {
                star.classList.remove('bi-star-fill', 'active');
                star.classList.add('bi-star');
            }
        });
    }

    stars.forEach(star => {
        star.addEventListener('mouseover', function () {
            updateStars(this.dataset.rating);
        });

        star.addEventListener('mouseout', function () {
            updateStars(rating);
        });

        star.addEventListener('click', function () {
            rating = this.dataset.rating;
            updateStars(rating);
        });
    });
});