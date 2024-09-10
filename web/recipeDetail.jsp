<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.example.recipe.Recipe"%>
<%@page import="com.example.recipe.RecipeDAO"%>
<%@page import="org.bson.types.ObjectId" %>
<%
    String role = (String) session.getAttribute("role");
    String username = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Recipe Detail</title>
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <nav>
            <div class="nav-container">
                <a href="recipes" class="logo">Recipe App</a>
                <ul class="nav-links">
                    <li><a href="recipes">Home</a></li>
                        <% if ("admin".equals(role)) { %>
                    <li><a href="addRecipe.jsp">Add Recipe</a></li>
                        <% }
                            if (session != null && username != null) {
                        %>
                    <li><a href="<%= request.getContextPath()%>/logout">Logout</a></li>
                        <%
                            }
                        %>
                </ul>
            </div>
        </nav>

        <section class="recipe-detail">
            <div class="detail-container">
                <%
                    String id = request.getParameter("id");
                    if (id == null || id.isEmpty()) {
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Recipe ID is missing or invalid.");
                        return;
                    }

                    RecipeDAO recipeDAO = new RecipeDAO();
                    Recipe recipe = recipeDAO.getRecipeById(id);
                    if (recipe == null) {
                        response.sendError(HttpServletResponse.SC_NOT_FOUND, "Recipe not found.");
                        return;
                    }
                %>

                <img src="<%= recipe.getImageUrl()%>" alt="Recipe Image" class="detail-image">
                <div class="detail-content">
                    <h1><%= recipe.getTitle()%></h1>
                    <p><strong>Preparation Time:</strong> <%= recipe.getPreparationTime()%></p>
                    <h2>Ingredients:</h2>
                    <ul>
                        <%
                            String[] ingredients = recipe.getIngredients().split(",");
                            for (String ingredient : ingredients) {
                        %>
                        <li><%= ingredient%></li>
                            <% }%>
                    </ul>
                    <h2>Steps:</h2>
                    <ol>
                        <%
                            String[] steps = recipe.getSteps().split("\\.");
                            for (String step : steps) {
                        %>
                        <li><%= step.trim()%></li>
                            <% }%>
                    </ol>
                    <% if ("admin".equals(role)) {%>
                    <div class="update-div">
                        <a href="editRecipe.jsp?id=<%= recipe.getId()%>" class="btn" style="margin: auto">Edit Recipe</a>
                    </div>
                    <% }%>
                </div>
            </div>
        </section>

        <footer>
            <p>&copy; 2024 Recipe App. All rights reserved.</p>
        </footer>
    </body>
</html>