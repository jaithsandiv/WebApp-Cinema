<!-- Active Page: pass an empty string if the page isn't listed in navbar -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Include header with parameters -->
<jsp:include page="jsp/header.jsp">
    <jsp:param name="logo" value="./images/logotab.png" />
    <jsp:param name="title" value="ABC Cinema" />
    <jsp:param name="css" value="style.css" />
    <jsp:param name="activePage" value="home" />   
</jsp:include>
<!-- Page specific content -->
<div>
    <H1>Welcome to ABC Cinemas</H1>
</div>
<!-- Include footer with parameters -->
<jsp:include page="jsp/footer.jsp">
    <jsp:param name="js" value="index.js" />
</jsp:include>
<a href="booking-history.jsp">Booking History</a>
