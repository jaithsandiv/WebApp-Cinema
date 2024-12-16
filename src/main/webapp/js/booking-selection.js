function toggleContent(id) {
    const content = document.getElementById(id);
    const header = content.previousElementSibling;
    const icon = header.querySelector('i');

    if (content.style.display === 'none' || !content.style.display) {
        content.style.display = 'block';
        icon.classList.replace('bi-chevron-down', 'bi-chevron-up');
    } else {
        content.style.display = 'none';
        icon.classList.replace('bi-chevron-up', 'bi-chevron-down');
    }
}
function refreshShowtimes() {
    const form = document.getElementById('bookingForm');
    // Submit the form
    form.submit();
    return false; // Prevent default form submission
}