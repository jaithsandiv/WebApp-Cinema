<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Include header with parameters -->
<jsp:include page="jsp/header.jsp">
    <jsp:param name="title" value="ABC Cinema" />
    <jsp:param name="css" value="registration.css" />
</jsp:include>

<!-- Page Content-->
<div class="banner">
    <h1>Welcome to ABC Cinemas</h1>
    <p>Immerse yourself in the world of cinema. Where stories come to life, and the impossible becomes real.</p>
</div>

<div class="s-container">
    <h2 class="form-title">Sign in</h2>
    <form method="POST" action="/WebApp-Cinema/signup" >
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <div class="input-wrapper">
                <input type="password" id="password" name="password" required>
                <button type="button" id="togglePassword" class="password-toggle" aria-label="Toggle password visibility">
                    <i class="bi bi-eye"></i>
                </button>
            </div>
        </div>
        <button type="submit" class="submit-btn">Sign In</button>
        <div class="signup-link">
            Don't have an account? <a href="signup.jsp">Sign up</a>
        </div>
    </form>
</div>
<!-- Footer -->
<jsp:include page="jsp/footer.jsp">
    <jsp:param name="js" value="registration.js" />
</jsp:include>