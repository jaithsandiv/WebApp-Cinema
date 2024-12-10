<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Include header with parameters -->
<jsp:include page="jsp/header.jsp">
    <jsp:param name="title" value="ABC Cinema" />
    <jsp:param name="css" value="registration.css" />
    <jsp:param name="activePage" value="register" />
</jsp:include>

<!-- Page Content-->
<div class="banner">
    <h1>Welcome Back to ABC Cinemas</h1>
    <p>Where you immerse yourself in the world of cinema.</p>
</div>

<div class="s-container">
    <!-- Displays the Error Messages -->
    <%
        String error = request.getParameter("error");
        if ("true".equals(error)) {
    %>
    <div class="alert alert-danger" role="alert">
        Registration failed. Please check your inputs and try again.
    </div>
    <% } else if ("exists".equals(error)) { %>
    <div class="alert alert-warning" role="alert">
        The username or email already exists. Please use a different one.
    </div>
    <% } else if ("internal".equals(error)) { %>
    <div class="alert alert-danger" role="alert">
        An internal error occurred. Please try again later.
    </div>
    <% }%>
    <h2 class="form-title">Sign up</h2>
    <form action="register" method="post">
        <div class="name-fields">
            <div class="form-group">
                <label for="firstName">First name</label>
                <input type="text" id="firstname" name="firstname" required>
            </div>
            <div class="form-group">
                <label for="lastName">Last name</label>
                <input type="text" id="lastname" name="lastname" required>
            </div>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="phone">Phone number</label>
            <input type="text" id="phone" name="phone" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <div class="input-wrapper">
                <input type="password" id="password" name="password" required>
            </div>
        </div>
        <button type="submit" class="submit-btn">Sign Up</button>
        <div class="login-link">
            Already have an account? <a href="login.jsp">Login</a>
        </div>
    </form>
</div>
<!-- Footer -->
<jsp:include page="jsp/footer.jsp">
    <jsp:param name="js" value="registration.js" />
</jsp:include>