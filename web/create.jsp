<%-- 
    Document   : create
    Created on : 28 Aug 2024, 4:07:35 pm
    Author     : kshit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="org.bson.Document"%>
<%@page import="your.package.MongoDBConnection"%>
<%
    if(request.getParameter("submit") != null) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        MongoDBConnection dbConn = new MongoDBConnection();
        MongoCollection<Document> collection = dbConn.getDatabase().getCollection("your_collection_name");

        Document doc = new Document("name", name)
                        .append("email", email);

        collection.insertOne(doc);

        dbConn.close();
        out.println("Record inserted successfully.");
    }
%>
<html>
<head>
    <title>Create Record</title>
</head>
<body>
    <form method="post">
        Name: <input type="text" name="name" required><br>
        Email: <input type="email" name="email" required><br>
        <input type="submit" name="submit" value="Create">
    </form>
</body>
</html>
