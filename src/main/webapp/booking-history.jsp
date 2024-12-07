<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Booking History</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h1>Booking History</h1>
        <div class="filter-tabs">
            <button onclick="filterTable('all')">All</button>
            <button onclick="filterTable('pending')">Pending</button>
            <button onclick="filterTable('completed')">Completed</button>
            <button onclick="filterTable('incomplete')">Incomplete</button>
            <button onclick="filterTable('cancelled')">Cancelled</button>
        </div>
        <table id="bookingHistory">
            <thead>
                <tr>
                    <th>#ID</th>
                    <th>Title</th>
                    <th>Type</th>
                    <th>Cost</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="booking" items="${bookings}">
                    <tr class="${booking.status.toLowerCase()}">
                        <td>${booking.id}</td>
                        <td>${booking.title}</td>
                        <td>${booking.type}</td>
                        <td>€${booking.cost}</td>
                        <td>${booking.status}</td>
                        <td><a href="details.jsp?id=${booking.id}">Details</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <button id="loadMore">Load More</button>
    </div>

    <script src="js/filter.js"></script>
</body>
</html>
