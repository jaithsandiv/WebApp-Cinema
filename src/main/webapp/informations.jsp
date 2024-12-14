<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- Include header with parameters -->
<jsp:include page="jsp/header.jsp">
    <jsp:param name="title" value="ABC Cinema" />
    <jsp:param name="css" value="informations.css" />
    <jsp:param name="activePage" value="informations" />
</jsp:include>

<div class="container mt-4 mb-4">
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <c:if test="${empty error}">
        <div class="container my-5">
            <div class="row">
                <!-- Movie Poster Column -->
                <div class="col-md-4">
                    <img src="${movieImagePath}" alt="Movie Image" class="img-fluid rounded shadow">
                </div>

                <!-- Movie Details Column -->
                <div class="col-md-8">
                    <div class="d-flex align-items-center mb-2">
                        <h2 class="mb-0 me-3">${movieTitle}</h2>
                        <span class="badge bg-warning text-dark fs-5">IMDB: ${imdb}</span>
                    </div>

                    <p class="text-muted mb-3">${movieGenre}</p>
                    <H4>Story Line:</H4>
                    <p class="mb-4" style="font-size: 1rem;">${movieDescription}</p>

                    <a href="./booking-selection" class="submit-btn">Book Now</a>
                </div>
            </div>
        </div>
    </c:if>
</div>
<!-- Include footer with parameters -->
<jsp:include page="jsp/footer.jsp" />