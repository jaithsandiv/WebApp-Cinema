<!-- Active Page: pass an empty string if the page isn't listed in navbar -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Include header with parameters -->
<jsp:include page="jsp/header.jsp">
    <jsp:param name="title" value="ABC Cinema" />
    <jsp:param name="css" value="E-ticket.css" /> 
</jsp:include>
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
        <p>PAYMENT TYPE:...</p>
        <p>CONFIRMATION NUMBER:....</p>
        <p>Thank you for your purchase!</p>

    </div>
</div>

<button id="generateTicket">Generate Ticket</button>


<!-- Footer -->
<jsp:include page="jsp/footer.jsp">
    <jsp:param name="js" value="booking-selection.js" />
</jsp:include>