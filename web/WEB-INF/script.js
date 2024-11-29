// Define seat data
const rows = 10;
const cols = 10;
const reservedSeats = ['A1', 'A2', 'B3', 'C4']; // Example reserved seats

// Create seat grid
const seatContainer = document.getElementById('seat-container');
for (let row = 0; row < rows; row++) {
    for (let col = 0; col < cols; col++) {
        const seat = document.createElement('div');
        const seatID = `${String.fromCharCode(65 + row)}${col + 1}`;
        seat.className = 'seat available';
        if (reservedSeats.includes(seatID)) {
            seat.className = 'seat reserved';
        }
        seat.textContent = seatID;
        seat.dataset.seatID = seatID;
        seat.addEventListener('click', handleSeatClick);
        seatContainer.appendChild(seat);
    }
}

// Handle seat selection
function handleSeatClick(event) {
    const seat = event.target;
    if (seat.classList.contains('reserved')) return;
    seat.classList.toggle('selected');
}

// Confirm selected seats
document.getElementById('confirm-btn').addEventListener('click', () => {
    const selectedSeats = Array.from(document.querySelectorAll('.seat.selected')).map(
        (seat) => seat.dataset.seatID
    );
    alert(`You selected: ${selectedSeats.join(', ')}`);
});
