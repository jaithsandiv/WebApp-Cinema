<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Include header with parameters -->
<jsp:include page="jsp/header.jsp">
    <jsp:param name="title" value="ABC Cinema" />
    <jsp:param name="css" value="booking-selection.css" />
</jsp:include>

<div class="container py-5">
    <div class="card">
        <div class="card-body">
            <h2 class="card-title mb-4">Book Movie Tickets</h2>

            <c:if test="${not empty error}">
                <div class="alert alert-danger" role="alert">
                    ${error}
                </div>
            </c:if>

            <form id="bookingForm" action="booking-selection" method="get" class="row g-3 mb-4">
                <div class="col-md-4">
                    <label for="movieSelect" class="form-label">Select Movie</label>
                    <select class="form-select" id="movieSelect" name="movie_id" onchange="refreshShowtimes()">
                        <option value="">All Movies</option>
                        <c:forEach var="movie" items="${movies}">
                            <option value="${movie.id}" ${param.movie_id == movie.id ? 'selected' : ''}>
                                ${movie.title}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="col-md-4">
                    <label for="theatreSelect" class="form-label">Select Theatre</label>
                    <select class="form-select" id="theatreSelect" name="theatre_id" onchange="refreshShowtimes()">
                        <option value="">All Theatres</option>
                        <c:forEach var="theatre" items="${theatres}">
                            <option value="${theatre.id}" ${param.theatre_id == theatre.id ? 'selected' : ''}>
                                ${theatre.name}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="col-md-4">
                    <label for="dateSelect" class="form-label">Select Date</label>
                    <input type="date" class="form-control" id="dateSelect" name="show_date" 
                           value="${empty param.show_date ? todayDate : param.show_date}" 
                           min="${todayDate}" required onchange="refreshShowtimes()">
                </div>
            </form>

            <div id="showtimesList">
                <c:if test="${empty movieShowtimes}">
                    <div class="alert alert-info" role="alert">
                        No showtimes available for the selected criteria.
                    </div>
                </c:if>

                <c:forEach var="movieEntry" items="${movieShowtimes}">
                    <div class="movie-section mb-3">
                        <div class="movie-header p-3 bg-light rounded d-flex justify-content-between align-items-center" 
                             onclick="toggleContent('movie-${movieEntry.key}')">
                            <h5 class="mb-0">${movieEntry.value.movie.title}</h5>
                            <i class="bi bi-chevron-down"></i>
                        </div>

                        <div class="movie-content p-3" id="movie-${movieEntry.key}">
                            <c:forEach var="theatreEntry" items="${movieEntry.value.theatres}">
                                <div class="theatre-name">${theatreEntry.value.theatre.name}</div>
                                <div class="showtime-grid">
                                    <c:forEach var="showtime" items="${theatreEntry.value.showtimes}">
                                        <form action="seats" method="get" style="display: inline;">
                                            <input type="hidden" name="showtime_id" value="${showtime.id}">
                                            <button type="submit" class="btn btn-outline-primary showtime-button">
                                                <fmt:formatDate value="${showtime.showTime}" pattern="HH:mm" />
                                            </button>
                                        </form>
                                    </c:forEach>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<!-- Include footer -->
<jsp:include page="jsp/footer.jsp">
    <jsp:param name="js" value="booking-selection.js" />
</jsp:include>