<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Include header with parameters -->
<jsp:include page="jsp/header.jsp">
    <jsp:param name="title" value="ABC Cinema" />
    <jsp:param name="css" value="style.css" />
    <jsp:param name="activePage" value="movies" />
</jsp:include>

<div class="container py-5">
    <!-- Admin Controls -->
    <div class="row mb-4">
        <div class="col-12">
            <h2 class="title mb-3 text-center">All Movies</h2>
            <c:if test="${sessionScope.role eq 'admin'}">
                <center><button type="button" class="btn btn-outline-primary cs-button" data-bs-toggle="modal" data-bs-target="#addMovieModal">
                    Add Movies
                    </button></center>
            </c:if>
        </div>
    </div>
    <div class="row">
        <!-- Card 1 -->
        <c:if test="${not empty error}">
            <div class="col-12">
                <p class="text-center text-danger">${error}</p>
            </div>
        </c:if>

        <c:if test="${empty movies}">
            <div class="col-12">
                <p class="text-center">No Movies Available.</p>
            </div>
        </c:if>
        <c:forEach var="movie" items="${movies}">
            <div class="col-md-3" style="padding-bottom: 20px;">
                <a href="./information?movie_id=${movie.id}" class="card-link">
                    <div class="card">
                        <img src="${empty movie.image_path ? './images/placeholder.png' : movie.image_path}" class="card-img-top" alt="${movie.title}">
                        <div class="card-body">
                            <h5 class="card-title">${movie.title}</h5>
                            <p class="card-text">${movie.genre}</p>
                        </div>
                        <div class="align-items-center">
                            <c:if test="${sessionScope.role eq 'admin'}">
                                <div style="padding-top: 5px;">
                                    <button class="btn btn-outline-secondary btn-sm me-2" style="width: 146px;" onclick="editMovie(${movie.id}, '${movie.title}', '${movie.genre}', '${movie.description}', '${movie.imdb_rating}', '${movie.duration}', '${movie.image_path}', '${movie.release_date}', '${movie.status}', '${movie.actors}', '${movie.characters}', '${movie.director}', '${movie.produce}', '${movie.writer}', '${movie.music}')" >
                                        <i class="bi bi-pencil-square"></i> Edit
                                    </button>
                                    <button class="btn btn-outline-danger btn-sm" style="width: 145px;" onclick="deleteMovie(${movie.id})">
                                        <i class="bi bi-trash"></i> Delete
                                    </button>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
</div>

<!-- Add Movie Modal -->
<c:if test="${sessionScope.role eq 'admin'}">
    <div class="modal fade" id="addMovieModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <center><h5 class="modal-title">Add New Movie</h5></center>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form action="movies" method="POST" enctype="multipart/form-data">
                    <div class="modal-body">
                        <input type="hidden" name="action" value="add">
                        <div class="mb-3">
                            <label class="form-label">Movie Title</label>
                            <input type="text" class="form-control" name="title" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Genre</label>
                            <input type="text" class="form-control" name="genre" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <input type="text" class="form-control" name="description" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">IMDB Rating</label>
                            <input type="text" class="form-control" name="imdb_rating" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Duration</label>
                            <input type="text" class="form-control" name="duration" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Movie Image</label>
                            <input type="file" class="form-control" name="image" accept="image/*">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Release Date</label>
                            <input type="date" class="form-control" name="release_date" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Status</label>
                            <select class="form-select" name="status" required>
                                <option value="Now Showing">Now Showing</option>
                                <option value="Coming Soon">Coming Soon</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Actors</label>
                            <input type="text" class="form-control" name="actors">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Characters</label>
                            <input type="text" class="form-control" name="characters">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Director</label>
                            <input type="text" class="form-control" name="director">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Produce</label>
                            <input type="text" class="form-control" name="produce">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Writer</label>
                            <input type="text" class="form-control" name="writer">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Music</label>
                            <input type="text" class="form-control" name="music">
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Add Movie</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

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
                                    <input type="text" class="form-control" name="title" id="editMovieTitle" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Genre</label>
                                    <input type="text" class="form-control" name="genre" id="editMovieGenre" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label fw-bold">Description</label>
                                    <input type="text" class="form-control" name="description" id="editMovieDescription" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">IMDB Rating</label>
                                    <input type="text" class="form-control" name="imdb_rating" id="editMovieImdb_Rating" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Duration</label>
                                    <input type="text" class="form-control" name="duration" id="editMovieDuration" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Release Date</label>
                                    <input type="date" class="form-control" name="release_date" id="editMovieRelease_date" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Status</label>
                                    <select class="form-select" name="status" id="editMovieStatus" required>
                                        <option value="Now Showing">Now Showing</option>
                                        <option value="Coming Soon">Coming Soon</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Actors</label>
                                    <input type="text" class="form-control" name="actors" id="editMovieActors">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Characters</label>
                                    <input type="text" class="form-control" name="characters" id="editMovieCharacters">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Director</label>
                                    <input type="text" class="form-control" name="director" id="editMovieDirector">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Produce</label>
                                    <input type="text" class="form-control" name="produce" id="editMovieProduce">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Writer</label>
                                    <input type="text" class="form-control" name="writer" id="editMovieWriter">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Music</label>
                                    <input type="text" class="form-control" name="music" id="editMovieMusic">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label fw-bold">Update Movie Image</label>
                                    <input type="file" class="form-control" name="image" accept="image/*" id="editImageInput">
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
    <jsp:param name="js" value="home.js" />
</jsp:include>