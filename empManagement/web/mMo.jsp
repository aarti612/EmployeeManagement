<%@ page import="com.mongodb.client.MongoClients" %>
<%@ page import="com.mongodb.client.MongoClient" %>
<%@ page import="com.mongodb.client.MongoIterable" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Manage Databases</title>
</head>
<body>
    <h1>Database Management</h1>
    <h2>Create Database</h2>
    <form action="cMo" method="post">
        Database Name: <input type="text" name="dbName" required><br>
        <input type="submit" value="Create">
    </form>

    <h2>Delete Database</h2>
    <form action="dMo" method="post">
        Database Name: 
        <select name="dbName">
            <% 
            // Connect to MongoDB to get the list of databases
            MongoClient mongoClient = MongoClients.create();
            MongoIterable<String> dbNames = mongoClient.listDatabaseNames();
            for (String dbName : dbNames) {
            %>
                <option value="<%= dbName %>"><%= dbName %></option>
            <%
            }
            // Close MongoDB connection
            mongoClient.close();
            %>
        </select>
        <input type="submit" value="Delete">
    </form>
</body>
</html>