<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Include header with parameters -->
<jsp:include page="jsp/header.jsp">
    <jsp:param name="title" value="ABC Cinema" />
    <jsp:param name="activePage" value="movies" />
</jsp:include>

<div class="container mt-4 mb-4">
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
        <div>
            <H2 class="text-center">Now Playing</H2>
        </div>
        <c:forEach var="movie" items="${nowshow}">
            <div class="col-md-4">
                <a href="./information?movie_id=${movie.id}" class="card-link">
                    <div class="card">
                        <img src="${empty movie.image_path ? './images/placeholder.png' : movie.image_path}" class="card-img-top" alt="${movie.title}">
                        <div class="card-body">
                            <h5 class="card-title">${movie.title}</h5>
                            <p class="card-text text-muted">${movie.description}</p>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>





        <!-- Include footer -->
        <jsp:include page="jsp/footer.jsp" />
    </div>