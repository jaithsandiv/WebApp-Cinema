<!DOCTYPE html>
<html lang="en">
    <head>
        <title>ABC CINEMA</title>
        <link rel="icon" href="images/logotab.png">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css">
        <%@ include file="jsp/header.jsp"%>
    </head>
    <body>
        
        <!-- Your page-specific content goes here -->
        
<div class="container py-5">
    <div class="card">
        <div class="card-body">
            <h2 class="card-title mb-4">Book Movie Tickets</h2>

            <div class="row g-3 mb-4">
                <div class="col-md-4">
                    <label for="movieSelect" class="form-label">Select Movie</label>
                    <select class="form-select" id="movieSelect">
                        <option value="">Loading movies...</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <label for="theatreSelect" class="form-label">Select Theatre</label>
                    <select class="form-select" id="theatreSelect">
                        <option value="">Loading theatres...</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <label for="dateSelect" class="form-label">Select Date</label>
                    <input type="date" class="form-control" id="dateSelect">
                </div>
            </div>

            <div id="showtimesList">
                <div class="loading">
                    <div class="spinner-border text-primary" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    </body>
    <%@ include file="jsp/footer.jsp"%>
</html>