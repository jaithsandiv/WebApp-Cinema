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
                            <input type="text" class="form-control custom-textarea" name="title" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Genre</label>
                            <input type="text" class="form-control custom-textarea" name="genre" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <input type="text" class="form-control custom-textarea" name="description" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">IMDB Rating</label>
                            <input type="text" class="form-control custom-textarea" name="imdb_rating" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Duration</label>
                            <input type="text" class="form-control custom-textarea" name="duration" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Movie Image</label>
                            <input type="file" class="form-control custom-textarea" name="image" accept="image/*">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Release Date</label>
                            <input type="date" class="form-control custom-textarea" name="release_date" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Status</label>
                            <select class="form-select custom-textarea" name="status" required>
                                <option value="Now Showing">Now Showing</option>
                                <option value="Coming Soon">Coming Soon</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Actors</label>
                            <input type="text" class="form-control custom-textarea" name="actors">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Characters</label>
                            <input type="text" class="form-control custom-textarea" name="characters">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Director</label>
                            <input type="text" class="form-control custom-textarea" name="director">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Produce</label>
                            <input type="text" class="form-control custom-textarea" name="produce">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Writer</label>
                            <input type="text" class="form-control custom-textarea" name="writer">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Music</label>
                            <input type="text" class="form-control custom-textarea" name="music">
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
</c:if>
<!-- Include footer with parameters -->
<jsp:include page="jsp/footer.jsp">
    <jsp:param name="js" value="home.js" />
</jsp:include>