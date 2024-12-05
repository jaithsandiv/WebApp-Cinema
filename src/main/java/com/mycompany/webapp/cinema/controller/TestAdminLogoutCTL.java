package com.mycompany.webapp.cinema.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "TestAdminLogout", urlPatterns = {"/test-admin-logout"})
public class TestAdminLogoutCTL extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("role");
        response.getWriter().println("Admin role removed from session");
        response.getWriter().println("<a href='theatres'>Go to Theatres page</a>");
    }
}