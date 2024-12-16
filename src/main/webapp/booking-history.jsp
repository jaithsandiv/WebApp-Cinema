<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="jsp/header.jsp">
    <jsp:param name="title" value="Booking History" />
    <jsp:param name="css" value="booking.css" />
    <jsp:param name="activePage" value="booking-history" />
</jsp:include>

<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <h2 class="text-center mb-4">Booking History</h2>

            <!-- Success and Error Messages -->
            <c:if test="${not empty success}">
                <div class="alert alert-success">${success}</div>
            </c:if>
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>

            <!-- Booking History Table -->
            <div class="card">
                <div class="card-body">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Booking ID</th>
                                <th>Movie Title</th>
                                <th>Theatre</th>
                                <th>Showtime</th>
                                <th>Seats</th>
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
                            <c:if test="${empty bookings}">
                                <tr>
                                    <td colspan="6" class="text-center">No bookings found.</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="jsp/footer.jsp">
    <jsp:param name="js" value="booking-history.js" />
</jsp:include>
