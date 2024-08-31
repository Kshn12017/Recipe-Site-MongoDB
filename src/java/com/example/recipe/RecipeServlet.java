package com.example.recipe;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

public class RecipeServlet extends HttpServlet {

    private final RecipeDAO recipeDAO;

    public RecipeServlet() {
        this.recipeDAO = new RecipeDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Recipe> recipes = recipeDAO.getAllRecipes();
        request.setAttribute("recipes", recipes);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String preparationTime = request.getParameter("preparationTime");
        String ingredients = request.getParameter("ingredients");
        String steps = request.getParameter("steps");
        String imageUrl = request.getParameter("imageUrl");

        Recipe recipe = new Recipe(title, preparationTime, ingredients, steps, imageUrl);
        recipeDAO.addRecipe(recipe);

        response.sendRedirect("recipes");
    }
}