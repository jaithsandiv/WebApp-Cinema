<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="jsp/header.jsp">
    <jsp:param name="title" value="ABC Cinema" />
    <jsp:param name="css" value="theatres.css" />
    <jsp:param name="activePage" value="theatres" />
</jsp:include>
<center>
    <div class="th-container py-5">

        <!-- Admin Controls -->
        <div class="row mb-4">
            <div class="col-12">
                <h2 class="text-center">Theatres</h2>
                <c:if test="${sessionScope.role eq 'admin'}">
                    <button type="button" class="btn btn-outline-primary cs-button" data-bs-toggle="modal" data-bs-target="#addTheatreModal">
                        Add Theatre
                    </button>
                </c:if>
            </div>
        </div>


        <!-- Error Messages -->
        <c:if test="${not empty error}">
            <div class="col-12">
                <div class="alert alert-danger">${error}</div>
            </div>
        </c:if>

        <c:if test="${not empty success}">
            <div class="col-12">
                <div class="alert alert-success">${success}</div>
            </div>
        </c:if>

        <div class="row g-4">
            <c:if test="${empty theatres}">
                <div class="col-12">
                    <p class="text-center">No theatres available.</p>
                </div>
            </c:if>

            <c:forEach var="theatre" items="${theatres}">
                <div class="col-md-4">
                    <div class="relative w-full max-w-md group">
                        <div class="card overflow-hidden shadow-lg border-0">
                            <div class="relative">
                                <img
                                    src="${empty theatre.imagePath ? './images/placeholder.png': theatre.imagePath}"
                                    alt="${theatre.name}"
                                    class="w-full h-[200px] object-cover"
                                    />
                                <!-- Hover Description Overlay -->
                                <div class="overlay">
                                    <p class="overlay-text" style="color: white">${theatre.description}</p>
                                </div>
                            </div>

                            <div class="card-header text-center py-3">
                                <h2 class="title">${theatre.name}</h2>
                                <p class="address">${theatre.location}</p>
                            </div>

                            <div class="card-footer flex flex-col p-0">
                                <button class="button book-btn" onclick="window.location.href = 'booking-selection?theatre_id=${theatre.id}'">Book Now</button>
                                <c:if test="${sessionScope.role eq 'admin'}">
                                    <div class="button-group flex w-full">
                                        <button class="button outline-button edit-button flex-1 rounded-none border-t-0" onclick="editTheatre(${theatre.id}, '${theatre.name}', '${theatre.location}', '${theatre.imagePath}')">
                                            <span class="icon"><i class="bi bi-pencil-square"></i>️</span> Edit
                                        </button>
                                        <button class="button outline-button delete-button flex-1 rounded-none border-t-0 border-l-0 text-destructive" onclick="deleteTheatre(${theatre.id})">
                                            <span class="icon"><i class="bi bi-trash"></i>️</span> Delete
                                        </button>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>

                </div>
            </c:forEach>
        </div>
    </div>
</center>
<!-- Add Theatre -->
<c:if test="${sessionScope.role eq 'admin'}">
    <div class="modal fade" id="addTheatreModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add New Theatre</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form action="theatres" method="POST" enctype="multipart/form-data">
                    <div class="modal-body">
                        <input type="hidden" name="action" value="add">
                        <div class="mb-3">
                            <label class="form-label">Theatre Name</label>
                            <input type="text" class="form-control custom-textarea" name="name" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Location</label>
                            <input type="text" class="form-control custom-textarea" name="location" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <input type="text" class="form-control custom-textarea" name="description" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Theatre Image</label>
                            <input type="file" class="form-control custom-textarea" name="image" accept="image/*">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Add Theatre</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Edit Theatre Modal -->
    <center>
        <div class="modal fade" id="editTheatreModal" tabindex="-1">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header bg-light">
                        <h5 class="modal-title">Edit Theatre</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <form action="theatres" method="POST" enctype="multipart/form-data">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="hidden" name="action" value="edit">
                                    <input type="hidden" name="theatreId" id="editTheatreId">
                                    <div class="mb-3">
                                        <label class="form-label fw-bold">Theatre Name</label>
                                        <input type="text" class="form-control custom-textarea" name="name" id="editTheatreName" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label fw-bold">Location</label>
                                        <input type="text" class="form-control custom-textarea" name="location" id="editTheatreLocation" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label fw-bold">Description</label>
                                        <input type="text" class="form-control custom-textarea" name="description" id="editTheatreDescription" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label fw-bold">Update Theatre Image</label>
                                        <input type="file" class="form-control custom-textarea" name="image" accept="image/*" id="editImageInput">
                                        <small class="text-muted">Leave empty to keep current image</small>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="text-center">
                                        <label class="form-label fw-bold">Current Image</label>
                                        <img id="currentTheatreImage" src="" 
                                             class="img-fluid rounded shadow-sm" 
                                             style="max-height: 200px; object-fit: cover;"
                                             alt="Current theatre image">
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
        <div class="modal fade" id="deleteTheatreModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Confirm Delete</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to delete this theatre?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <form action="theatres" method="POST">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="theatreId" id="deleteTheatreId">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </c:if>

    <jsp:include page="jsp/footer.jsp">
        <jsp:param name="js" value="theatres.js" />
    </jsp:include>