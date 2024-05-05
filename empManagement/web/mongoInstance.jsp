<%@ page import="java.util.List" %>
<%@ page import="your.package.MongoDBInstance" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Manage MongoDB Instances</title>
</head>
<body>
    <h1>Connected MongoDB Instances</h1>
    <ul>
        <% 
        List<MongoDBInstance> instances = (List<MongoDBInstance>) request.getAttribute("instances");
        if (instances != null) {
            for (MongoDBInstance instance : instances) {
        %>
            <li><%= instance.getHost() %>:<%= instance.getPort() %></li>
        <%
            }
        }
        %>
    </ul>
    <!-- Form to add new MongoDB instance -->
    <form action="mongo" method="post">
        Host: <input type="text" name="host" required><br>
        Port: <input type="number" name="port" required><br>
        <input type="submit" value="Add Instance">
    </form>
</body>
</html>