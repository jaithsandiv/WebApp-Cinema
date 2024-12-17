<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="jsp/header.jsp">
    <jsp:param name="title" value="ABC Cinema" />
    <jsp:param name="css" value="history.css" />
    <jsp:param name="activePage" value="booking-history" />
</jsp:include>

<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <!-- Display success message -->
            <c:if test="${not empty success}">
                <div class="alert alert-success" role="alert">
                    ${success}
                </div>
            </c:if>
            <!-- Display error message -->
            <c:if test="${not empty error}">
                <div class="alert alert-danger" role="alert">
                    ${error}
                </div>
            </c:if>

            <!-- Card 3: Booking History --> 
            <h2 class="title mb-3 text-center">Booking History</h2>
            <div class="card mb-4">

                <div class="card-body card-table">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>BookingID</th>
                                <th>Movie Title</th>
                                <th>Theatre Name</th>
                                <th>Showtime Date Time</th>
                                <th>Tickets</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="booking" items="${bookings}">
                                <tr>
                                    <td>${booking.bookingId}</td>
                                    <td>${booking.movieTitle}</td>
                                    <td>${booking.theatreName}</td>
                                    <td>${booking.showtime}</td>
                                    <td>${booking.seatNumbers}</td>
                                    <td>${booking.status}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="jsp/footer.jsp">
    <jsp:param name="js" value="account.js" />
</jsp:include>