<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seat Selection</title>
    <!-- Link to CSS -->
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <!-- Screen Header -->
    <div class="screen">SCREEN</div>
    
    <!-- Seat Container -->
    <div id="seat-container" style="display: grid; grid-template-columns: repeat(10, auto);">
        <!-- Seats will be dynamically generated using JavaScript -->
    </div>
    
    <!-- Confirm Button -->
    <button id="confirm-btn" style="margin-top: 20px;">Confirm Selection</button>

    <!-- JavaScript File -->
    <script src="script.js"></script>
</body>
</html>
