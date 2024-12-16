
<!-- Include header with parameters -->
<jsp:include page="jsp/header.jsp">
    <jsp:param name="title" value="ABC Cinema" />
    <jsp:param name="css" value="payment.css" />
    <jsp:param name="activePage" value="home" />   
</jsp:include>


<title>Payment Canceled</title>
<div class="container-cancel">
    <h1>Payment Canceled</h1>
    <center><p class="message">You have canceled the payment process. If this was unintentional, you can restart the process or return to the home page.</p>
        <a href="./index.jsp" class="btn-cancel">Retry Payment</a></center>

</div>


<!-- Footer -->
<jsp:include page="jsp/footer.jsp">
    <jsp:param name="js" value="booking-selection.js" />
</jsp:include>


