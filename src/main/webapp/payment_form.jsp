<%-- 
    Document   : payment_form
    Created on : Dec 13, 2024, 10:21:41 PM
    Author     : M S I
--%>



<!-- Active Page: pass an empty string if the page isn't listed in navbar -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Include header with parameters -->
<jsp:include page="jsp/header.jsp">
    <jsp:param name="title" value="ABC Cinema" />
    <jsp:param name="css" value="payment.css" />
    <jsp:param name="activePage" value="home" />   
</jsp:include>

<!--style>
    .payment-container {
        width: 100%;
        margin: 50px auto;
        padding: 10px;
        border-radius: 8px;
        background-color: white;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    h1 {
        margin-top: 20px;
        text-align: center;
        margin-bottom: 20px;
    }
    label {
        display: block;
        margin-bottom: 5px;
        font-size: 30px;
    }
    input[type="text"], input[type="number"] {
        width: 100%;
        height: 40px;
        padding: 10px;
        margin: 15px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    .cs-btn {
        width: 100%;
        padding: 15px;
        background-color: var(--primary);
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin-top: 20px;

    }
    form{
        width: 600px;
        background-color: #FFFFFF;

    }

    .cs-btn:hover {
        background-color: var(--secondary);
        color: white;
    }
    .pay-btn{
        display: flex;
        align-items: center;
        justify-content: center;
    }
</style-->
<!--<link href="css/payment.css" rel="stylesheet">-->

<body>
    <div class="p-container">

        <h1>Movie Booking Payment</h1>
        <div class="payment-container">
            <form action="authorize_payment" method="POST">
                <label for="movieName">Movie Name</label>
                <input type="text" id="movieName" name="movieName" value=${movieName} required>

                <label for="subtotal">Ticket Price</label>
                <input type="number" id="subtotal" name="subtotal" step="0.01" value=${price} required>

                <label for="tax">Tax</label>
                <input type="number" id="tax" name="tax" step="0.01" value=${vat} required>

                <label for="total">Total Price</label>
                <input type="number" id="total" name="total" step="0.01" value=${totalPrice} required>
                <div class="pay-btn"><button class="cs-btn" type="submit">Proceed to PayPal</button></div>



            </form>
        </div>

    </div>

</body>








<!-- Footer -->
<jsp:include page="jsp/footer.jsp">
    <jsp:param name="js" value="booking-selection.js" />
</jsp:include>