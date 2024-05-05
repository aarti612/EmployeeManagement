<%@ page import="java.sql.Connection, java.sql.Statement, java.sql.ResultSet, java.sql.DriverManager, java.sql.PreparedStatement" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
String jdbcUrl = "jdbc:mysql://localhost:3306/eschool";
String dbUser = "root";
String dbPassword = "";

HttpSession sessions = request.getSession();
String studentName = (String) sessions.getAttribute("studentName");

String studentId = request.getParameter("id");

if (studentName == null && studentId != null) {
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

        // Use prepared statement to avoid SQL injection
        String sql = "SELECT name FROM student WHERE id = ?";
        System.out.println("SQL Query: " + sql);  // Print the SQL query

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, studentId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                studentName = resultSet.getString("name");
                sessions.setAttribute("studentName", studentName);
            }

            resultSet.close();
        }

        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <title>Class Schedule</title>
   <style>
    /* Sidebar */
    .sidebar {
        width: 250px;
        background-color: #333;
        color: #fff;
        padding: 20px;
        position: fixed;
        height: 100%;
        overflow-y: auto; /* Enable vertical scrolling if needed */
    }

    .menu ul {
        list-style-type: none;
        padding: 0;
    }

    .menu li {
        margin-bottom: 15px; /* Increase the margin for more spacing between items */
    }

    .menu a {
        text-decoration: none;
        color: #fff;
        padding: 12px;
        display: block;
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    .menu a:hover {
        background-color: #555;
    }

    .menu i {
        margin-right: 8px;
    }

    /* Main Content */
    .main-content {
        flex-grow: 1;
        padding: 20px;
        margin-left: 250px;
    }

    /* Header */
    .header {
        background-color: #3498db;
        color: #fff;
        padding: 20px;
        text-align: center;
        border-radius: 5px;
    }

    /* Section */
    .section {
        background-color: #fff;
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .section table {
        width: 100%;
        border-collapse: collapse;
    }

    .section th, .section td {
        padding: 8px;
        text-align: left;
    }

    .section th {
        background-color: #3498db;
        color: #fff;
    }
</style>

</head>
<body>
    <div class="sidebar">
        <ul class="menu" style="list-style: none;">
            <li><a href="#timetable"><i class="fas fa-home"></i> Dashboard</a></li>
            <li><a href="view_assignment.jsp"><i class="fas fa-pencil-alt"></i> Assignments</a></li>
            <li><a href="viewResult.jsp"><i class="fas fa-poll"></i> Test Results</a></li>
            <li><a href="profile.jsp"><i class="fas fa-user"></i> Profile Details</a></li>
            <li><a href="Login.html"><i></i>Logout</a></li>

        </ul>
    </div>

    <div class="main-content">
        <div class="header">
            <h1>Welcome, <%= studentName %></h1>
        </div>
        <div class="section">
            <h2>Your Class Schedule</h2>
            <table>
                <tr>
                    <th>Teacher ID</th>
                    <th>Class Name</th>
                    <th>Subject</th>
                </tr>
                <%@ page import="java.sql.Connection, java.sql.Statement, java.sql.ResultSet, java.sql.DriverManager" %>
                <%

                    String scheduleQuery = "SELECT teacherId, className, subject FROM teacher_time_table";
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
                        Statement statement = connection.createStatement();
                        ResultSet resultSet = statement.executeQuery(scheduleQuery);

                        while (resultSet.next()) {
                            String teacherId = resultSet.getString("teacherId");
                            String className = resultSet.getString("className");
                            String subject = resultSet.getString("subject");
                %>
                <tr>
                    <td><%= teacherId %></td>
                    <td><%= className %></td>
                    <td><%= subject %></td>
                </tr>
                <%
                        }
                        resultSet.close();
                        statement.close();
                        connection.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
        </div>
    </div>
</body>
</html>