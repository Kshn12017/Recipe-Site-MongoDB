<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.recipe.Recipe" %>
<%@ page import="com.example.recipe.RecipeDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Delete Recipe</title>
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>

        <%
            // Get the recipe ID from the request
            String recipeId = request.getParameter("id");

            // Fetch the recipe details from the database using RecipeDAO
            RecipeDAO recipeDAO = new RecipeDAO();
            Recipe recipe = recipeDAO.getRecipeById(recipeId);

            if (recipe == null) {
                out.println("<h2>Recipe not found!</h2>");
            } else {
        %>

        <h2>Are you sure you want to delete the following recipe?</h2>

        <h3><%= recipe.getTitle()%></h3>

        <!-- Confirmation Form -->
        <form action="deleteRecipe" method="POST">
            <!-- Hidden input to pass the recipe ID to the server -->
            <input type="hidden" name="id" value="<%= recipe.getId()%>">
            <button type="submit">Confirm Delete</button>
        </form>

        <a href="<%= request.getContextPath()%>/recipes">Cancel</a>

        <%
            }
        %>

    </body>
</html>