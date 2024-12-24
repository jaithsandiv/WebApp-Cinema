<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="images/tablogo.png">
        <title>${param.title}</title>
        <!-- Bootstrap links CSS -->
        <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/remixicon@2.2.0/fonts/remixicon.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" rel="stylesheet">
        <!-- Common CSS for the header and footer -->
        <link href="css/common.css" rel="stylesheet">
        <!-- Allows page-specific CSS -->
        <c:if test="${not empty param.css}">
            <link href="css/${param.css}" rel="stylesheet">
        </c:if>
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg fixed-top">
                <div class="container">
                    <a class="navbar-brand fs-4" href="./">
                        <img src="images/logo.png" alt="" width="80">
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav mx-auto">
                            <li class="nav-item">
                                <a class="nav-link ${param.activePage == 'movies' ? 'active' : ''}" href="./movies">Movies</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link ${param.activePage == 'theatres' ? 'active' : ''}" href="./theatres">Theatres</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link ${param.activePage == 'feedback' ? 'active' : ''}" href="./feedback">Feedback</a>
                            </li>
                            <c:if test="${sessionScope.role == 'admin'}">
                                <li class="nav-item">
                                    <a class="nav-link ${param.activePage == 'admin' ? 'active' : ''}" href="./admin">Analytics</a>
                                </li>
                            </c:if>
                        </ul>
                        <div class="d-flex">
                            <a href="./booking-selection" class="btn btn-outline-light me-2">Book Now</a>
                            <c:choose>
                                <c:when test="${sessionScope.user_id == null}">
                                    <a href="./login" class="btn btn-outline-info ${param.activePage == 'login' ? 'active' : ''}">Login</a>
                                </c:when>
                                <c:otherwise>
                                    <div class="dropdown">
                                        <button class="btn btn-outline-info dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            My Account
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" href="./account" ${param.activePage == 'account' ? 'active' : ''}>Account</a>
                                            <a class="dropdown-item" href="booking-history"${param.activePage == 'booking-history' ? 'active' : ''}>Booking History</a>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </nav>
        </header>
        <!-- Main Pages'Content -->
        <main>