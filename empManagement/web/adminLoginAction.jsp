

<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.client.MongoClients" %>
<%@ page import="com.mongodb.client.MongoClient" %>
<%@ page import="com.mongodb.client.MongoDatabase" %>
<%@ page import="com.mongodb.client.MongoCollection" %>
<%@ page import="com.mongodb.client.model.Filters" %>
<%@ page import="com.mongodb.client.model.Updates" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
String id = request.getParameter("id");
String enteredPassword = request.getParameter("password");

// Hash the entered password (you can use your hashPassword method if needed)
String hashedPassword = hashPassword(enteredPassword);

// MongoDB connection parameters
String connectionString = "mongodb://localhost:27017";
String dbName = "userManage";
String collectionName = "login";

try {
    // Connect to MongoDB
    MongoClient mongoClient = MongoClients.create(connectionString);
    MongoDatabase database = mongoClient.getDatabase(dbName);
    MongoCollection<Document> collection = database.getCollection(collectionName);

    // Find user in MongoDB
    Document query = new Document("id", id).append("password", hashedPassword);
    Document user = collection.find(query).first();

    if (user != null) {
        String role = user.getString("role");
        int enabled = user.getInteger("Enabled");
        String name = user.getString("name");

        if (enabled == 0) {
            System.out.println("User is not enabled.");
            response.sendRedirect("index.html");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("userId", id);
            session.setAttribute("studentName", name);

            if ("student".equals(role)) {
                response.sendRedirect("empDashboard.jsp");
            } else if ("admin".equals(role)) {
                response.sendRedirect("adminHome.jsp");
            } 
            else {
                response.sendRedirect("index.html");
            }
        }
    } else {
        System.out.println("User not found or password does not match.");
        response.sendRedirect("index.html");
    }

    // Close MongoDB resources
    mongoClient.close();
} catch (Exception e) {
    // Handle exceptions (e.g., database errors)
    e.printStackTrace();
}
%>

<%!
private String hashPassword(String password) {
    try {
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] bytes = md.digest(password.getBytes());

        // Convert bytes to a hexadecimal representation
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02x", b));
        }

        return sb.toString();
    } catch (NoSuchAlgorithmException e) {
        return null;
    }
}
%>
