<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Add Recipe</title>
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <nav>
            <div class="nav-container">
                <a href="recipes" class="logo">Recipe App</a>
                <ul class="nav-links">
                    <li><a href="recipes">Home</a></li>
                        <%
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
                <h1>Add Recipe</h1>
                <form action="recipes" method="POST">
                    <label for="title">Recipe Title:</label>
                    <input type="text" id="title" name="title" required>

                    <label for="prep-time">Preparation Time:</label>
                    <input type="text" id="prep-time" name="preparationTime" required>

                    <label for="ingredients">Ingredients:</label><p>*separate each ingredient with a ,[comma]</p>
                    <textarea id="ingredients" name="ingredients" rows="5" required></textarea>

                    <label for="steps">Steps:</label><p>*separate each step with a .[dot]</p>
                    <textarea id="steps" name="steps" rows="5" required></textarea>

                    <label for="imageUrl">Image URL:</label>
                    <input type="text" id="imageUrl" name="imageUrl">

                    <button type="submit" class="btn">Submit</button>
                </form>
            </div>
        </section>

        <footer>
            <p>&copy; 2024 Recipe App. All rights reserved.</p>
        </footer>
    </body>
</html>