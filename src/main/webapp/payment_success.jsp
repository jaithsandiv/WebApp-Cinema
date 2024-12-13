<%-- 
    Document   : payment_success
    Created on : Dec 13, 2024, 10:23:51 PM
    Author     : M S I
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="jsp/header.jsp">
    <jsp:param name="title" value="ABC Cinema" />
    <jsp:param name="css" value="payment.css" />
    <jsp:param name="activePage" value="home" />   
</jsp:include>




<title>Payment Successful</title>
    <div class="container-success">
        <h1>Thank You!</h1>
        <center><p class="message">Your payment was successful.</p>

        <a href="./index.jsp" class="btn-cancel">Return Home</a>

    </div>




    <jsp:include page="jsp/footer.jsp">
        <jsp:param name="js" value="booking-selection.js" />
    </jsp:include>