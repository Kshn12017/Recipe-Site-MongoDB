package com.example.recipe;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

public class RecipeSearchServlet extends HttpServlet {
    private final RecipeDAO recipeDAO;

    public RecipeSearchServlet() {
        this.recipeDAO = new RecipeDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query");
        List<Recipe> recipes = recipeDAO.searchRecipesByTitle(query);
        request.setAttribute("recipes", recipes);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}