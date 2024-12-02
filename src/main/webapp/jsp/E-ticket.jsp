<%-- 
    Document   : E-ticket
    Created on : Nov 29, 2024, 6:40:52 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Cinema</title>
    <link rel="stylesheet" href="../css/E-ticket.css">
</head>
<body>
    <div class="ticket" id="ticket">
        <div class="ticket-header">
            <h1>E-Ticket</h1>
            
        </div>
        <div class="ticket-body">
            <p>Dear, Your Ticket(s)are Confirmed!
                
            </p>
            <p><strong>Booking ID:</strong> <span id="name"></span></p>
            <p><strong>Movie Name:</strong> <span id="movie"></span></p>
            <p><strong>Date:</strong> <span id="date"></span></p>
            <p><strong>Time:</strong> <span id="time"></span></p>
            <p><strong>Seat Number:</strong> <span id="seat"></span></p>
            <p><strong>Ticket ID:</strong> <span id="ticketId"></span></p>
            <p><strong>Quantity:</strong> <span id="Quantity"></span></p>
            <p><strong>Internet handling fees:</strong> <span id="Internethandlingfees"></span></p>
            <p><strong>AMOUNT PAID:</strong> <span id="amountpaid"></span></p>
        </div>
        <div class="ticket-footer">
            <p>BOOKING DATE & TIME:...</p> 
            PAYMENT TYPE:...</p>
            CONFIRMATION NUMBER:....</p>
            <p>Thank you for your purchase!</p>
            
        </div>
    </div>

    <button id="generateTicket">Generate Ticket</button>

    <script src="script.js"></script>
</body>
</html>