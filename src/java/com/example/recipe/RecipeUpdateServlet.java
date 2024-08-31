package com.example.recipe;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RecipeUpdateServlet extends HttpServlet {
    private final RecipeDAO recipeDAO;

    public RecipeUpdateServlet() {
        this.recipeDAO = new RecipeDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String preparationTime = request.getParameter("preparationTime");
        String ingredients = request.getParameter("ingredients");
        String steps = request.getParameter("steps");
        String imageUrl = request.getParameter("imageUrl");

        Recipe recipe = new Recipe(title, preparationTime, ingredients, steps, imageUrl);
        recipe.setId(id);

        recipeDAO.updateRecipe(recipe);

        response.sendRedirect("recipeDetail.jsp?id=" + id);
    }
}