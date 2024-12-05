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
                <%-- Example row; replace with dynamic data in Step 3 --%>
                <tr class="completed">
                    <td>14383</td>
                    <td>Segway Tour of Washington, D.C.</td>
                    <td>Tour</td>
                    <td>€200.00</td>
                    <td>Completed</td>
                    <td><a href="details.jsp?id=14383">Details</a></td>
                </tr>
                <tr class="incomplete">
                    <td>14386</td>
                    <td>American Parks Trail</td>
                    <td>Tour</td>
                    <td>€150.00</td>
                    <td>Incomplete</td>
                    <td><a href="details.jsp?id=14386">Details</a></td>
                </tr>
            </tbody>
        </table>
        <button id="loadMore">Load More</button>
    </div>

    <script src="js/filter.js"></script>
</body>
</html>
