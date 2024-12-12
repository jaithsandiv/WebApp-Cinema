package com.mycompany.webapp.cinema.controller;

import com.mycompany.webapp.cinema.model.User;
import com.mycompany.webapp.cinema.utility.JDBCDataSource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "register", urlPatterns = {"/register"})
public class RegisterCTL extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        // Default role for new user
        String role = "user";
        
        User user = new User();
        user.setFirstname(firstname);
        user.setLastname(lastname);
        user.setEmail(email);
        user.setPhone(phone);
        user.setPassword(password);
        user.setRole(role);

        boolean isRegistered = false;

        // Database logic directly in the servlet
        String sql = "INSERT INTO users (firstname, lastname, email, phone, password, role) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = JDBCDataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, firstname);
            ps.setString(2, lastname);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.setString(5, password); // Password should be hashed in production
            ps.setString(6, role);
            int rowsInserted = ps.executeUpdate();

            // Get the generated user_id (auto-incremented)
            if (rowsInserted > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    user.setUserId(generatedKeys.getInt(1));
                }
                isRegistered = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect based on the registration result
        if (isRegistered) {
            response.sendRedirect("login?success=true");
        } else {
            response.sendRedirect("register?error=true");
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet for user registration";
    }// </editor-fold>

}
