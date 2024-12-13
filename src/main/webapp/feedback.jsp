<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Include header with parameters -->
<jsp:include page="jsp/header.jsp">
    <jsp:param name="title" value="ABC Cinema" />
    <jsp:param name="css" value="feedback.css" />
    <jsp:param name="activePage" value="feedback" /> 
</jsp:include>

<!-- Page Content-->
<div class="feedback-container">
    <div class="feedback-form">
        <h2 class="text-center mb-4">We value your opinion.</h2>

        <div class="text-center mb-4">
            <p class="mb-3">How would you rate your overall experience?</p>
            <div class="star-rating mb-4" id="star-rating">
                <i class="bi bi-star" data-rating="1"></i>
                <i class="bi bi-star" data-rating="2"></i>
                <i class="bi bi-star" data-rating="3"></i>
                <i class="bi bi-star" data-rating="4"></i>
                <i class="bi bi-star" data-rating="5"></i>
            </div>
        </div>

        <div class="mb-4">
            <p class="text-center mb-3">Kindly take a moment to tell us what you think.</p>
            <textarea class="form-control custom-textarea" rows="4"></textarea>
        </div>

        <div class="text-center">
            <button class="btn btn-primary custom-btn">Share my feedback</button>
        </div>
    </div>
</div>

<!-- Footer -->
<jsp:include page="jsp/footer.jsp">
    <jsp:param name="js" value="feedback.js" />
</jsp:include>