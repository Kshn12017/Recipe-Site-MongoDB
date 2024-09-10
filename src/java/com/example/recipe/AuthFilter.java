package com.example.recipe;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AuthFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);
        String loginURI = req.getContextPath() + "/login.jsp";
        String loginServletURI = req.getContextPath() + "/login";

        // Allow access to static resources like CSS, JS, Images
        String requestURI = req.getRequestURI();
        boolean isStaticResource = requestURI.startsWith(req.getContextPath() + "/css")
                                  || requestURI.startsWith(req.getContextPath() + "/images")
                                  || requestURI.startsWith(req.getContextPath() + "/js");

        boolean loggedIn = session != null && session.getAttribute("username") != null;
        boolean loginRequest = requestURI.equals(loginURI);
        boolean loginServletRequest = requestURI.equals(loginServletURI);

        if (loggedIn || loginRequest || loginServletRequest || isStaticResource) {
            // If the user is logged in, accessing login page or servlet, or requesting static resources, allow access
            chain.doFilter(request, response);
        } else {
            // Otherwise, redirect to login page
            res.sendRedirect(loginURI);
        }
    }
    
    @Override
    public void destroy() {}
}