<%-- 
    Document   : payment_success
    Created on : Dec 13, 2024, 10:23:51 PM
    Author     : M S I
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="jsp/header.jsp">
    <jsp:param name="title" value="ABC Cinema" />
    <jsp:param name="css" value="p-success.css" />
    <jsp:param name="activePage" value="home" />   
</jsp:include>




<title>Payment Success</title>
</head>
<body>
    <div class="container py-5">
        <h1 class="text-center">Payment Successful!</h1>
        <p class="para">Thank you for your booking. Your payment has been processed successfully.</p>

        <!-- Display booking details -->
        <div class="booking-summary" id="bookingSummary">            
            <div class="summary-body">
                <p class="para-sum">Your booking has been confirmed and an e-ticket has been sent to your email!</p>
                <table class="booking-details-table">
                    <tr>
                        <th>Booking ID:</th>
                        <td>${booking.bookingId}</td>
                    </tr>
                    <tr>
                        <th>Movie Name:</th>
                        <td>${booking.movieTitle}</td>
                    </tr>
                    <tr>
                        <th>Date:</th>
                        <td>${booking.showtime.split(" ")[0]}</td>
                    </tr>
                    <tr>
                        <th>Time:</th>
                        <td>${booking.showtime.split(" ")[1]}</td>
                    </tr>
                    <tr>
                        <th>Seat Numbers:</th>
                        <td>${booking.seatNumbers}</td>
                    </tr>
                    <tr>
                        <th>Amount Paid:</th>
                        <td>$${booking.amount}</td>
                    </tr>
                    <tr>
                        <th>Payment Method:</th>
                        <td>${booking.paymentMethod}</td>
                    </tr>
                    <tr>
                        <th>Status:</th>
                        <td>${booking.status}</td>
                    </tr>
                </table>
            </div>
            <div class="summary-footer row">
                <div class="col-8">
                    <p>Booking Date & Time: <span>${booking.paymentDate}</span></p>
                    <p>E-ticket has been sent to: <span>${booking.userEmail}</span></p>
                </div>
                <div class="col-4"> 
                    <a href="./" class="button">Back to Home</a>
                </div>
            </div>
        </div>
    </div>




    <jsp:include page="jsp/footer.jsp">
        <jsp:param name="js" value="booking-selection.js" />
    </jsp:include>