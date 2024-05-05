<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement" %>

<%
String userId = request.getParameter("userId");
boolean status = request.getParameter("status") != null; // Check if the checkbox is checked

String jdbcURL = "jdbc:mysql://localhost:3306/eschool";
String jdbcUsername = "root";
String jdbcPassword = "";

try {
    Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    String updateQuery = "UPDATE users SET enable = ? WHERE id = ?"; // Change the table name and column name as needed
    PreparedStatement preparedStatement = connection.prepareStatement(updateQuery);
    preparedStatement.setBoolean(1, status);
    preparedStatement.setInt(2, Integer.parseInt(userId));
    preparedStatement.executeUpdate();
    connection.close();
    
    response.sendRedirect("adminHome.jsp"); // Redirect back to the admin page
} catch (Exception e) {
    e.printStackTrace();
}
%>
