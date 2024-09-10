<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.example.recipe.Recipe"%>
<%@page import="com.example.recipe.RecipeDAO"%>
<%
    String role = (String) session.getAttribute("role");
    String username = (String) session.getAttribute("username");
    
    if ("user".equals(role)) {
        response.sendRedirect("recipes");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Recipe</title>
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

        <section class="recipe-form">
            <div class="form-container">
                <h1>Edit Recipe</h1>
                <%
                    String id = request.getParameter("id");
                    RecipeDAO recipeDAO = new RecipeDAO();
                    Recipe recipe = recipeDAO.getRecipeById(id);
                %>
                <form action="updateRecipe" method="POST">
                    <input type="hidden" name="id" value="<%= recipe.getId()%>">

                    <label for="title">Recipe Title:</label>
                    <input type="text" id="title" name="title" value="<%= recipe.getTitle()%>" required>

                    <label for="prep-time">Preparation Time:</label>
                    <input type="text" id="prep-time" name="preparationTime" value="<%= recipe.getPreparationTime()%>" required>

                    <label for="ingredients">Ingredients:</label>
                    <textarea id="ingredients" name="ingredients" rows="5" required><%= recipe.getIngredients()%></textarea>

                    <label for="steps">Steps:</label>
                    <textarea id="steps" name="steps" rows="5" required><%= recipe.getSteps()%></textarea>

                    <label for="imageUrl">Image URL:</label>
                    <input type="text" id="imageUrl" name="imageUrl" value="<%= recipe.getImageUrl()%>">

                    <button type="submit" class="btn">Update Recipe</button>
                </form>
            </div>
        </section>

        <footer>
            <p>&copy; 2024 Recipe App. All rights reserved.</p>
        </footer>
    </body>
</html>