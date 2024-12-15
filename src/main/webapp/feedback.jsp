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
        <form action="./feedback" method="POST">
            <c:if test="${not empty error}">
                <center><div class="alert alert-danger">${error}</div></center>
                </c:if>
                <c:if test="${not empty success}">
                <center><div class="alert alert-success">${success}</div></center>
                </c:if>
            <div class="text-center mb-4">
                <p class="mb-3">How would you rate your overall experience?</p>
                <center><div class="star-rating">
                        <input type="radio" id="star5" name="rating" value="5" required />
                        <label for="star5" title="5 stars">★</label>

                        <input type="radio" id="star4" name="rating" value="4" />
                        <label for="star4" title="4 stars">★</label>

                        <input type="radio" id="star3" name="rating" value="3" />
                        <label for="star3" title="3 stars">★</label>

                        <input type="radio" id="star2" name="rating" value="2" />
                        <label for="star2" title="2 stars">★</label>

                        <input type="radio" id="star1" name="rating" value="1" />
                        <label for="star1" title="1 star">★</label>
                    </div></center>
            </div>

            <div class="mb-4">
                <p class="text-center mb-3">Kindly take a moment to tell us what you think.</p>
                <textarea class="form-control custom-textarea" id="comment" name="comment" rows="4"></textarea>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary custom-btn">Share my feedback</button>
            </div>
        </form>
    </div>
</div>
<!-- Admin Section -->
<c:if test="${sessionScope.role eq 'admin'}">
    <div class="container py-5">
        <h2 class="text-center mb-4">Customer Feedback</h2>
        <table class="table table-striped table-bordered">
            <thead class="table">
                <tr>
                    <th>Feedback ID</th>
                    <th>Rating</th>
                    <th>Comment</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="feedback" items="${feedbacks}">
                    <tr>
                        <td>${feedback.feedbackId}</td>
                        <td>${feedback.rating}</td>
                        <td>${feedback.comment}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</c:if>

<!-- Footer -->
<jsp:include page="jsp/footer.jsp">
    <jsp:param name="js" value="feedback.js" />
</jsp:include>