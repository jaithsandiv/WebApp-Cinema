<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Cinema - E-Ticket</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
        }
        .ticket-container {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        h1 {
            margin-bottom: 20px;
        }
        p {
            margin: 8px 0;
        }
    </style>
</head>
<body>
    <div class="ticket-container">
        <% 
            ResultSet bookingDetails = (ResultSet) request.getAttribute("bookingDetails");
            if (bookingDetails != null) {
        %>
            <h1>E-Ticket</h1>
            <p>Booking ID: <%= bookingDetails.getInt("BookingID") %></p>
            <p>Movie Name: <%= bookingDetails.getString("MovieName") %></p>
            <p>Date: <%= bookingDetails.getDate("Date") %></p>
            <p>Time: <%= bookingDetails.getTime("Time") %></p>
            <p>Seat Number: <%= bookingDetails.getString("SeatNumber") %></p>
            <p>Ticket ID: <%= bookingDetails.getString("TicketID") %></p>
            <p>Quantity: <%= bookingDetails.getInt("Quantity") %></p>
            <p>Internet Handling Fees: <%= bookingDetails.getBigDecimal("InternetHandlingFees") %></p>
            <p>Amount Paid: <%= bookingDetails.getBigDecimal("AmountPaid") %></p>
        <% } %>
    </div>
</body>
</html>
