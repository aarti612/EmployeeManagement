<%@ page import="java.sql.*" %>
<%@ page import="java.security.MessageDigest" %>

<%
String course = request.getParameter("course");
String branch = request.getParameter("branch");
String name = request.getParameter("name");
String fatherName = request.getParameter("fatherName");
String gender = request.getParameter("gender");
String studentPassword = request.getParameter("password");
String hashedPassword = hashPassword(studentPassword); // Call the hashPassword function

Connection con = null;
PreparedStatement userStatement = null;
PreparedStatement studentStatement = null;
int generatedUserId = -1;

try {
    Class.forName("com.mysql.jdbc.Driver");

    String url = "jdbc:mysql://localhost:3306/eschool";
    String username = "root";
    String dbPassword = "";

    con = DriverManager.getConnection(url, username, dbPassword);

    if (con != null) {
        con.setAutoCommit(false);

        String userQuery = "INSERT INTO users (password, role, name) VALUES (?, ?, ?)";
        userStatement = con.prepareStatement(userQuery, Statement.RETURN_GENERATED_KEYS);
        userStatement.setString(1, hashedPassword);
        userStatement.setString(2, "student");
        userStatement.setString(3, name);

        int userRowsAffected = userStatement.executeUpdate();

        if (userRowsAffected > 0) {
            ResultSet generatedKeys = userStatement.getGeneratedKeys();
            if (generatedKeys.next()) {
                generatedUserId = generatedKeys.getInt(1);
            }
        }

        String studentQuery = "INSERT INTO student (course, branch, id, name, fatherName, gender) VALUES (?, ?, ?, ?, ?, ?)";
        studentStatement = con.prepareStatement(studentQuery);
        studentStatement.setString(1, course);
        studentStatement.setString(2, branch);
        studentStatement.setInt(3, generatedUserId);
        studentStatement.setString(4, name);
        studentStatement.setString(5, fatherName);
        studentStatement.setString(6, gender);

        int studentRowsAffected = studentStatement.executeUpdate();

        if (userRowsAffected > 0 && studentRowsAffected > 0) {
            con.commit();
%>
            <script type="text/javascript">
                alert("Student data INSERTED successfully.");
            </script>
<%
        } else {
            con.rollback();
%>
            <script type="text/javascript">
                alert("Failed to insert the student data.");
            </script>
<%
        }
    } else {
%>
        <script type="text/javascript">
            alert("Failed to establish a database connection.");
        </script>
<%
    }
} catch (SQLException | ClassNotFoundException e) {
%>
    <script type="text/javascript">
        alert("Error: <%= e.getMessage() %>");
    </script>
<%
    if (con != null) {
        try {
            con.rollback();
        } catch (SQLException ex) {
%>
            <script type="text/javascript">
                alert("Error while rolling back the transaction: <%= ex.getMessage() %>");
            </script>
<%
        }
    }
} finally {
    try {
        if (userStatement != null) {
            userStatement.close();
        }
        if (studentStatement != null) {
            studentStatement.close();
        }
        if (con != null) {
            con.setAutoCommit(true);
            con.close();
        }
    } catch (SQLException e) {
%>
        <script type="text/javascript">
            alert("Error while closing resources: <%= e.getMessage() %>");
        </script>
<%
    }
}
%>

<%!
// Method to hash the password
private String hashPassword(String password) {
    try {
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] bytes = md.digest(password.getBytes());

        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02x", b));
        }

        return sb.toString();
    } catch (Exception e) {
        System.out.println("Error while hashing password: " + e.getMessage());
        return null;
    }
}
%>
