package com.mycompany.webapp.cinema.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "TestAdminLogin", urlPatterns = {"/test-admin-login"})
public class TestAdminLoginCTL extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        HttpSession session = request.getSession();
        session.setAttribute("role", "admin");
        response.getWriter().println("Admin role set in session");
        response.getWriter().println("<a href='theatres'>Go to Theatres page</a>");
    }
}