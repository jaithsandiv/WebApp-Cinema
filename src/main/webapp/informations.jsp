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
                    <c:if test="${sessionScope.role eq 'admin'}">
                        <div style="padding-top: 5px;">
                            <button class="btn btn-outline-secondary btn-sm me-2" style="width: 120px;" onclick="editMovie('${movie.id}', '${movie.title}', '${movie.genre}', '${movie.description}', '${movie.imdb_rating}', '${movie.duration}', '${movie.image_path}', '${movie.release_date}', '${movie.status}', '${movie.actors}', '${movie.characters}', '${movie.director}', '${movie.produce}', '${movie.writer}', '${movie.music}')" >
                                <i class="bi bi-pencil-square"></i> Edit
                            </button>
                            <button class="btn btn-outline-danger btn-sm" style="width: 120px;" onclick="deleteMovie('${movie.id}')">
                                <i class="bi bi-trash"></i> Delete
                            </button>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </c:if>
</div>
<c:if test="${sessionScope.role eq 'admin'}">
    <!-- Edit Movie Modal -->
    <div class="modal fade" id="editMovieModal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-light">
                    <center><h5 class="modal-title">Edit Movie</h5></center>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form action="movies" method="POST" enctype="multipart/form-data">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6">
                                <input type="hidden" name="action" value="edit">
                                <input type="hidden" name="movieId" id="editMovieId">
                                <div class="mb-3">
                                    <label class="form-label fw-bold">Movie Title</label>
                                    <input type="text" class="form-control custom-textarea" name="title" id="editMovieTitle" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Genre</label>
                                    <input type="text" class="form-control custom-textarea" name="genre" id="editMovieGenre" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label fw-bold">Description</label>
                                    <input type="text" class="form-control custom-textarea" name="description" id="editMovieDescription" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">IMDB Rating</label>
                                    <input type="text" class="form-control custom-textarea" name="imdb_rating" id="editMovieImdb_Rating" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Duration</label>
                                    <input type="text" class="form-control custom-textarea" name="duration" id="editMovieDuration" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Release Date</label>
                                    <input type="date" class="form-control custom-textarea" name="release_date" id="editMovieRelease_date" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Status</label>
                                    <select class="form-select custom-textarea" name="status" id="editMovieStatus" required>
                                        <option value="Now Showing">Now Showing</option>
                                        <option value="Coming Soon">Coming Soon</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Actors</label>
                                    <input type="text" class="form-control custom-textarea" name="actors" id="editMovieActors">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Characters</label>
                                    <input type="text" class="form-control custom-textarea" name="characters" id="editMovieCharacters">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Director</label>
                                    <input type="text" class="form-control custom-textarea" name="director" id="editMovieDirector">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Produce</label>
                                    <input type="text" class="form-control custom-textarea" name="produce" id="editMovieProduce">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Writer</label>
                                    <input type="text" class="form-control custom-textarea" name="writer" id="editMovieWriter">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Music</label>
                                    <input type="text" class="form-control custom-textarea" name="music" id="editMovieMusic">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label fw-bold">Update Movie Image</label>
                                    <input type="file" class="form-control custom-textarea" name="image" accept="image/*" id="editImageInput">
                                    <small class="text-muted">Leave empty to keep current image</small>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="text-center">
                                    <label class="form-label fw-bold">Current Image</label>
                                    <img id="currentMovieImage" src="" 
                                         class="img-fluid rounded shadow-sm" 
                                         style="max-height: 200px; object-fit: cover;"
                                         alt="Current movie image">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer bg-light">
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div class="modal fade" id="deleteMovieModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Confirm Delete</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    Are you sure you want to delete this Movie?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <form action="movies" method="POST">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="movieId" id="deleteMovieId">
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</c:if>
<!-- Include footer with parameters -->
<jsp:include page="jsp/footer.jsp">
    <jsp:param name="js" value="informations.js" />
</jsp:include>