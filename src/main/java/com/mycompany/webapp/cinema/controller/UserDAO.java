package com.mycompany.webapp.cinema.controller;

import com.mycompany.webapp.cinema.model.Users;
import com.mycompany.webapp.cinema.utility.DataUtility;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    public boolean isEmailOrPhoneExists(String email, String phone) {
        try (Connection conn = DataUtility.getConnection()) {
            String query = "SELECT 1 FROM users WHERE email = ? OR phone = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, email);
            stmt.setString(2, phone);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean registerUser(Users user) {
        try (Connection conn = DataUtility.getConnection()) {
            String query = "INSERT INTO users (firstName, lastName, email, phone, password) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, user.getFirstName());
            stmt.setString(2, user.getLastName());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getPhone());
            stmt.setString(5, user.getPassword());
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
