<%@page import="java.util.List"%>
<%@page import="com.example.recipe.Recipe"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String role = (String) session.getAttribute("role");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Recipe Management</title>
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <nav>
            <div class="nav-container">
                <a href="recipes" class="logo">Recipe App</a>
                <ul class="nav-links">
                    <li><a href="recipes">Home</a></li>
                        <%-- Display Add Recipe button only for admin --%>
                        <% if ("admin".equals(role)) { %>
                    <li><a href="addRecipe.jsp">Add Recipe</a></li>
                        <% }
                            if (session != null && session.getAttribute("username") != null) {
                        %>
                    <li><a href="<%= request.getContextPath()%>/logout">Logout</a></li>
                        <%
                            }
                        %>
                </ul>
            </div>
        </nav>

        <section class="recipe-grid">
            <h2>All Recipes</h2>

            <!-- Search Form -->
            <form action="searchRecipe" method="GET" class="search-form">
                <input type="text" name="query" class="search-bar" placeholder="Search recipes...">
                <button type="submit">Search</button>
            </form>

            <div class="grid-container">
                <%
                    List<Recipe> recipes = (List<Recipe>) request.getAttribute("recipes");
                    if (recipes != null && !recipes.isEmpty()) {
                        for (Recipe recipe : recipes) {
                %>
                <div class="recipe-card">
                    <img src="<%= recipe.getImageUrl()%>" alt="Recipe Image">
                    <div class="recipe-info">
                        <h3><%= recipe.getTitle()%></h3>
                        <p><%= recipe.getPreparationTime()%></p>
                        <a href="recipeDetail.jsp?id=<%= recipe.getId()%>" class="btn">View Details</a>
                        <% if ("admin".equals(role)) {%>
                        <a href="editRecipe.jsp?id=<%= recipe.getId()%>" class="btn">Edit</a>
                        <a href="deleteRecipe.jsp?id=<%= recipe.getId()%>" class="btn">Delete</a>
                        <% } %>
                    </div>
                </div>
                <%
                    }
                } else {
                %>
                <!-- No Results Found Message -->
                <div class="no-results">
                    <h3>Oops! Looks like we don't have that recipe. Want to add it?</h3>
                    <% if ("admin".equals(role)) {%>
                    <a href="addRecipe.jsp" class="btn">Add Recipe</a>
                    <% } %>
                </div>
                <%
                    }
                %>
            </div>
        </section>

        <footer>
            <p>&copy; 2024 Recipe App. All rights reserved.</p>
        </footer>
    </body>
</html>
