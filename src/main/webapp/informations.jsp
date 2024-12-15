<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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
                    <img src="${movie.image_path}" alt="Movie Image" class="img-fluid rounded shadow">
                </div>

                <!-- Movie Details Column -->
                <div class="col-md-8">
                    <div class="d-flex align-items-center mb-2">
                        <h2 class="mb-0 me-3">${movie.title}</h2>
                        <span class="badge bg-warning text-dark fs-5">IMDB: ${movie.imdb_rating}</span>
                    </div>
                    <p class="text-muted mb-3">${movie.genre} &bull; <i class="bi bi-clock"></i> ${movie.duration}</p>
                    <!-- Horizontal line-->
                    <hr class="custom-hr">
                    <H4>Story Line:</H4>
                    <p class="mb-4" style="font-size: 1rem;">${movie.description}</p>
                    <!-- Horizontal line-->
                    <hr class="custom-hr">
                    <h4>Cast</h4>
                    <div class="row">
                        <div class="col-md-6">
                            <h6>Actors</h6>
                            <ul style="font-size: 0.8rem; margin: 0; padding: 0; list-style: none;">
                                <c:forEach var="actor" items="${fn:split(movie.actors, ',')}">
                                    <li>${actor}</li>
                                    </c:forEach>
                            </ul>
                        </div>

                        <div class="col-md-6">
                            <h6>Characters</h6>
                            <ul style="font-size: 0.8rem; margin: 0; padding: 0; list-style: none;">
                                <c:forEach var="character" items="${fn:split(movie.characters, ',')}">
                                    <li>${character}</li>
                                    </c:forEach>
                            </ul>
                        </div>
                    </div><br>
                    <!-- Horizontal line-->
                    <hr class="custom-hr">
                    <h4>Team</h4>
                    <div style="display: flex; flex-direction: column; gap: 10px;">
                        <div style="display: flex; justify-content: flex-start; gap: 10px; font-size: 0.9rem;">
                            <h6 style="margin: 0; font-size: 0.9rem;">Directed by</h6> 
                            <span style="font-size: 0.9rem;">${movie.director}</span>
                        </div>
                        <div style="display: flex; justify-content: flex-start; gap: 10px; font-size: 0.9rem;">
                            <h6 style="margin: 0; font-size: 0.9rem;">Produced by</h6> 
                            <span style="font-size: 0.9rem;">${movie.produce}</span>
                        </div>
                        <div style="display: flex; justify-content: flex-start; gap: 10px; font-size: 0.9rem;">
                            <h6 style="margin: 0; font-size: 0.9rem;">Written by</h6> 
                            <span style="font-size: 0.9rem;">${movie.writer}</span>
                        </div>
                        <div style="display: flex; justify-content: flex-start; gap: 10px; font-size: 0.9rem;">
                            <h6 style="margin: 0; font-size: 0.9rem;">Music by</h6> 
                            <span style="font-size: 0.9rem;">${movie.music}</span>
                        </div>
                    </div><br>
                    <button class="submit-btn" onclick="window.location.href = 'booking-selection?movie_id=${movie.id}'">
                        Book Now
                    </button>
                </div>
            </div>
        </div>
    </c:if>
</div>
<!-- Include footer with parameters -->
<jsp:include page="jsp/footer.jsp" />