<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="images/logotab.png">
        <!-- Bootstrap links CSS -->
        <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">-->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/remixicon@2.2.0/fonts/remixicon.css" rel="stylesheet">
        <!-- Common CSS for the header and footer -->
        <link href="css/common.css" rel="stylesheet">
        <!-- Allows page-specific CSS -->
    <c:if test="${not empty param.css}">
        <link href="css/${param.css}" rel="stylesheet">
    </c:if>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-lg fixed-top">
            <div class="container">
                <a class="navbar-brand fs-4" href="./index">
                    <img src="images/logo.png" alt="" width="80">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Movies</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Schedules</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="E-ticket.jsp">Theatres</a>
                        </li>
                    </ul>
                    <div class="d-flex">
                        <a href="./booking-selection" class="btn btn-outline-light me-2">Book Now</a>
                        <a href="signin.jsp" class="btn">Login</a>
                    </div>
                </div>
            </div>
        </nav>
    </header>
    <!-- Main Pages'Content -->
    <main>