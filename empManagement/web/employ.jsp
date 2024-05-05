
<%@ page import="com.mongodb.client.MongoClients" %>
<%@ page import="com.mongodb.client.MongoClient" %>
<%@ page import="com.mongodb.client.MongoIterable" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Management</title>
</head>
<body>
    <h1>User Management</h1>
    <h2>Add User</h2>
    <a href="addUser.jsp">Add User</a>

    <h2>Change Password</h2>
    <form action="ChangePasswordServlet" method="post">
        Username: <input type="text" name="username" required><br>
        New Password: <input type="password" name="newPassword" required><br>
        <input type="submit" value="Change Password">
    </form>

    <h2>Remove User</h2>
    <form action="RemoveUserServlet" method="post">
        Username: <input type="text" name="username" required><br>
        <input type="submit" value="Remove User">
    </form>

    <h2>Assign User to Database</h2>
    <form action="AssignUserToDatabaseServlet" method="post">
        Username: <input type="text" name="username" required><br>
        Database:
        <select name="database">
            <!-- Populate database options dynamically from MongoDB -->
        </select><br>
        <input type="submit" value="Assign User to Database">
    </form>
</body>
</html>