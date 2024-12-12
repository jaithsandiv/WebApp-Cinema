<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Include header with parameters -->
<jsp:include page="jsp/header.jsp">
    <jsp:param name="title" value="ABC Cinema" />
    <jsp:param name="css" value="registration.css" />
    <jsp:param name="activePage" value="login" /> 
</jsp:include>

<!-- Page Content-->
<div class="banner">
    <h1>Welcome Back to ABC Cinemas</h1>
    <p>Where you immerse yourself in the world of cinema.</p>
</div>

<div class="s-container">
    <!-- Error Message Display -->
    <%
        String error = request.getParameter("error");
        if ("true".equals(error)) {
    %>
    <div class="alert alert-danger" role="alert">
        Login failed. Please check your inputs and try again.
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
    <h2 class="form-title">Sign in</h2>
    <form action="login" method="post" >
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <div class="input-wrapper">
                <input type="password" id="password" name="password" required>
            </div>
        </div>
        <button type="submit" class="submit-btn">Sign In</button>
        <div class="signup-link">
            Don't have an account? <a href="register">Create Account</a>
        </div>
    </form>
</div>
<!-- Footer -->
<jsp:include page="jsp/footer.jsp">
    <jsp:param name="js" value="registration.js" />
</jsp:include>