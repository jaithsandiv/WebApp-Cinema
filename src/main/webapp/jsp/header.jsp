<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <!-- Bootstrap CSS -->
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <!-- Common styles for header and footer -->
    <link href="css/common.css" rel="stylesheet">
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-lg fixed-top">
            <div class="container">
                <a class="navbar-brand fs-4" href="index.jsp">
                    <img src="images/logo.png" alt="" width="80">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
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
                            <a class="nav-link" href="#">Theatres</a>
                        </li>
                    </ul>
                    <div class="d-flex">
                        <a href="#" class="btn btn-outline-light me-2">Book Now</a>
                        <a href="signin.jsp" class="btn">Login</a>
                    </div>
                </div>
            </div>
        </nav>
    </header>
</body>