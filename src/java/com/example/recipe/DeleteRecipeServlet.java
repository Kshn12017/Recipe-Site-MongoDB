package com.example.recipe;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteRecipeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String recipeId = request.getParameter("id");

        if (recipeId != null && !recipeId.isEmpty()) {
            RecipeDAO recipeDAO = new RecipeDAO();
            recipeDAO.deleteRecipe(recipeId);  // Delete the recipe by ID
        }

        // Redirect back to the list of recipes
        response.sendRedirect(request.getContextPath() + "/recipes");
    }
}