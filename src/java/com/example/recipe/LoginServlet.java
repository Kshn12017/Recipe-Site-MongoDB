package com.example.recipe;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Dummy authentication logic (replace this with your actual authentication)
        String role = null;
        if ("admin".equals(username) && "admin123".equals(password)) {
            role = "admin";
        } else if ("user".equals(username) && "user123".equals(password)) {
            role = "user";
        }

        // If authentication succeeds, create session and redirect
        if (role != null) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", role);

            // Redirect to recipes page after successful login
            response.sendRedirect("recipes");
        } else {
            // Redirect back to login page with error message on failure
            request.setAttribute("errorMessage", "Invalid username or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
