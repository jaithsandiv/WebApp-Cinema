function filterTable(status) {
    const rows = document.querySelectorAll('#bookingHistory tbody tr');
    rows.forEach(row => {
        if (status === 'all' || row.classList.contains(status)) {
            row.style.display = '';
        } else {
            row.style.display = 'none';
        }
    });
}
