<!-- Active Page: pass an empty string if the page isn't listed in navbar -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Include header with parameters -->
<jsp:include page="jsp/header.jsp">
    <jsp:param name="title" value="ABC Cinema" />
    <jsp:param name="css" value="style.css" />
    <jsp:param name="activePage" value="home" />   
</jsp:include> 

<!-- Page specific content 
<div id="carouselExample" class="carousel slide">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="./images/slide1.png" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img src="./images/slide2.png" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img src="./images/slide3.png" class="d-block w-100" alt="...">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div-->
<center>
    <div class="carousel-container">
        <div class="carousel">
            <div class="slide">
                <img src="./images/slide1.png" alt="Slide 1">
                <h2>Slide 1</h2>
            </div>
            <div class="slide">
                <img src="./images/slide2.png" alt="Slide 2">
                <h2>Slide 2</h2>
            </div>
            <div class="slide">
                <img src="./images/slide3.png" alt="Slide 3">
                <h2>Slide 3</h2>
            </div>
            <div class="slide">
                <img src="./images/slide1.png" alt="Slide 4">
                <h2>Slide 4</h2>
            </div>
            <div class="slide">
                <img src="./images/slide2.png" alt="Slide 5">
                <h2>Slide 5</h2>
            </div>
        </div>
    </div>
</center>
<br>
<!-- Now Playing Movies -->
<div>
    <H2 class="text-center">Now Playing</H2>
</div>
<div class="container mt-4">
    <div class="row">
        <c:forEach var="movie" items="${nowshow}">
            <div class="col-md-3" style="padding-bottom: 20px;">
                <a href="./information?movie_id=${movie.id}" class="card-link">
                    <div class="movie-card">
                        <img src="${empty movie.image_path ? './images/placeholder.png?height=600&width=400' : movie.image_path}" alt="${movie.title}">
                        <div class="movie-info">
                            <h5 class="mb-1">${movie.title}</h5>
                            <p class="mb-0 small">${movie.genre}</p>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
        <c:if test="${empty nowshow}">
            <p>No movies currently showing.</p>
        </c:if>
    </div>
</div>
<br>
<!-- Coming Soon Movies -->
<div>
    <H2 class="text-center">Coming Soon</H2>
</div>
<!-- Now Playing Movies -->
<div class="container mt-4">
    <div class="row">
        <c:forEach var="movie" items="${comingsoon}">
            <div class="col-md-3" style="padding-bottom: 20px;">
                <a href="./information?movie_id=${movie.id}" class="card-link">
                    <div class="movie-card">
                        <img src="${empty movie.image_path ? './images/placeholder.png?height=600&width=400' : movie.image_path}" alt="${movie.title}">
                        <div class="movie-info">
                            <h5 class="mb-1">${movie.title}</h5>
                            <p class="mb-0 small">${movie.genre}</p>
                        </div>
                    </div>
                </a>
            </div>     
        </c:forEach>
        <c:if test="${empty nowshow}">
            <p>No upcoming movies.</p>
        </c:if>       
    </div>
</div>
<br>
<!-- Include footer with parameters -->
<jsp:include page="jsp/footer.jsp">
    <jsp:param name="js" value="home.js" />
</jsp:include>