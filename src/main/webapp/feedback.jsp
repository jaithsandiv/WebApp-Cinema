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
                <center><div class="radio">
                        <input type="radio" id="star5" name="rating" value="5" required />
                        <label for="star5" title="5 stars">
                            <svg viewBox="0 0 576 512" height="1em" xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
                                    ></path>
                            </svg>
                        </label>

                        <input type="radio" id="star4" name="rating" value="4" />
                        <label for="star4" title="4 stars">
                            <svg viewBox="0 0 576 512" height="1em" xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
                                    ></path>
                            </svg>
                        </label>

                        <input type="radio" id="star3" name="rating" value="3" />
                        <label for="star3" title="3 stars">
                            <svg viewBox="0 0 576 512" height="1em" xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
                                    ></path>
                            </svg>
                        </label>

                        <input type="radio" id="star2" name="rating" value="2" />
                        <label for="star2" title="2 stars">
                            <svg viewBox="0 0 576 512" height="1em" xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
                                    ></path>
                            </svg>
                        </label>

                        <input type="radio" id="star1" name="rating" value="1" />
                        <label for="star1" title="1 star">
                            <svg viewBox="0 0 576 512" height="1em" xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
                                    ></path>
                            </svg>
                        </label>
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
<!-- Admin View Section -->
<c:if test="${sessionScope.role eq 'admin'}">
    <div class="container py-5">
        <h2 class="text-center mb-4">Customer Feedback</h2>
        <table class="table table-bordered">
            <thead class="table">
                <tr>
                    <center><th>Feedback ID</th></center>
                    <center><th>Rating</th></center>
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