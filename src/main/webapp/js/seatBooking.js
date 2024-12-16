let selectedSeats = [];
let timer;

function updateSeatCount() {
    const adults = parseInt(document.getElementById("adults").value, 10);
    const children = parseInt(document.getElementById("children").value, 10);
    const totalSeats = adults + children;

    document.getElementById("seatCount").innerText =
            selectedSeats.length + " ticket(s) selected. Please select attendees.";

    const continueButton = document.getElementById("continueButton");
    if (selectedSeats.length === totalSeats) {
        continueButton.disabled = false;
    } else {
        continueButton.disabled = true;
    }
}

function submitSeats() {
    const selectedSeatsInput = document.getElementById('selectedSeatsInput');
    const totalPriceInput = document.getElementById('totalPriceInput');
    const showtimeIdInput = document.getElementById('showtimeIdInput');

    const adults = parseInt(document.getElementById("adults").value, 10);
    const children = parseInt(document.getElementById("children").value, 10);
    const totalPrice = (adults * 1250) + (children * 750);

    selectedSeatsInput.value = selectedSeats.join(','); // Pass the list as a comma-separated string
    totalPriceInput.value = totalPrice;
    showtimeIdInput.value = showtimeIdInput.value; // Retrieve the showtime ID from the hidden input

    console.log(selectedSeats.join(','));
    console.log(totalPrice);
    console.log(showtimeIdInput.value);

    startTimer();
}

function toggleSeat(seat) {
    const seatId = seat.id;
    console.log(seatId);
    if (seat.classList.contains("selected")) {
        seat.classList.remove("selected");
        selectedSeats = selectedSeats.filter(seat => seat !== seatId); // Remove seat
    } else {
        seat.classList.add("selected");
        selectedSeats.push(seatId); // Add seat
    }
    updateSeatCount();
}

function handleDropdownChange() {
    updateSeatCount();
}

function startTimer() {
    clearTimeout(timer);
    timer = setTimeout(() => {
        alert("Your session has expired. Please select your seats again.");
        window.location.href = "/seat-selection?showtime_id=" + document.getElementById('showtimeIdInput').value;
    }, 300000); // 5 minutes in milliseconds
}

