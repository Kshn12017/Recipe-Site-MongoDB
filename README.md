# Recipe Management Application

## Overview

The Recipe Management Application is a simple web application that allows users to create, view, search, update, and delete recipes. Built using Java, JSP, Servlets, and MongoDB, this project serves as a demonstration of CRUD operations and web development principles.

## Features

- **Add New Recipes**: Users can create new recipes by providing details such as title, preparation time, ingredients, steps, and an optional image URL.
- **View Recipes**: All recipes are displayed in a card layout with uniform styling. Users can click on any recipe card to view detailed information.
- **Search Recipes**: Users can search for recipes by title, and if no recipes are found, the app will prompt them to add a new recipe.
- **Update Recipes**: Users can edit existing recipes to update any of the details.
- **Delete Recipes**: Users can delete recipes from the application.
- **Responsive Design**: The application is designed to be responsive and can be viewed on both desktop and mobile devices.

## Technologies Used

- **Frontend**: HTML, CSS, JSP
- **Backend**: Java Servlets
- **Database**: MongoDB
- **Server**: GlassFish
- **Development Environment**: NetBeans IDE

## Setup Instructions

### Prerequisites

- **Java**: Ensure that you have JDK installed (version 8 or higher).
- **NetBeans IDE**: You can use other IDEs as well, but this project was developed using NetBeans.
- **MongoDB**: Install MongoDB and ensure it's running on your local machine or a cloud-based instance.
- **Glashfish**: Or any other servlet container of your choice.

### Steps to Run the Application

1. **Clone the Repository**:
   git clone https://github.com/Kshn12017/RecipeManagementApp.git

2. **Import the Project**:
- Open NetBeans (or your preferred IDE).
- Import the cloned project.

3. **Set Up MongoDB**:
- Ensure MongoDB is running on your local machine.
- Create a database named recipe_db with a collection named recipes.
- Optionally, insert some sample recipes to get started.

4. **Configure the Server**:
- Ensure Glashfish (or your chosen server) is configured in NetBeans.
- Set the server port if necessary.

5. **Run the Application**:
- Clean and build the project in NetBeans.
- Deploy the application to the server.
- Access the application via http://localhost:8080/RecipeManagementApp/ on your browser.

6. **Access from Other Devices**:
- If needed, find your local IP address and access the application from other devices on the same network using http://your-ip-address:8080/RecipeManagementApp/.

### Future Enhancements
- **User Authentication**: Implement user login and registration features.
- **Recipe Categories**: Add the ability to categorize recipes (e.g., Breakfast, Lunch, Dinner).
- **Recipe Ratings and Comments**: Allow users to rate and comment on recipes.
- **Export Recipes**: Enable users to export recipes as PDFs or share them via social media.

### Contributing
- Contributions are welcome! If you'd like to contribute, please fork the repository and use a feature branch. Pull requests are warmly welcome.

### License
- This project is licensed under the MIT License. See the LICENSE file for more details.

### Contact
- **Author**: Kshitiz Tiwari
- **Email**: kshitiz12017@gmail.com
- **GitHub**: Kshn12017
