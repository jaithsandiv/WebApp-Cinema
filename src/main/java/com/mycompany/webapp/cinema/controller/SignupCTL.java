package com.mycompany.webapp.cinema.controller;

import com.mycompany.webapp.cinema.model.Users;
import jakarta.faces.validator.Validator;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SignupCTL")
public class SignupCTL extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        Users user = new Users(firstName, lastName, email, phone, password);
/*
        if (!Validator.isEmailValid(email)) {
            request.setAttribute("errorMessage", "Invalid email format");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        if (!Validator.isPhoneValid(phone)) {
            request.setAttribute("errorMessage", "Invalid phone number");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }
*/
        UserDAO userDAO = new UserDAO();
        if (userDAO.isEmailOrPhoneExists(email, phone)) {
            request.setAttribute("errorMessage", "Email or phone already registered");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        if (userDAO.registerUser(user)) {
            response.sendRedirect("success.jsp");
        } else {
            request.setAttribute("errorMessage", "Error during registration");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
    }
}
