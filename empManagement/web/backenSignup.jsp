<%@ page import="com.mongodb.client.MongoClients" %>
<%@ page import="com.mongodb.client.MongoClient" %>
<%@ page import="com.mongodb.client.MongoDatabase" %>
<%@ page import="com.mongodb.client.MongoCollection" %>
<%@ page import="org.bson.Document" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.security.NoSuchAlgorithmException" %>
<%@ page import="java.io.UnsupportedEncodingException" %>

<%
// Get form data
String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("password");


System.out.println("Name: " + name);
System.out.println("Email: " + email);
System.out.println("Password: " + password);



// Display received data on the web page
out.println("Name: " + name);
out.println("<br>");
out.println("Email: " + email);
out.println("<br>");
out.println("Password: " + password);
out.println("<br>");


// Encrypt password
String hashedPassword = hashPassword(password);

// MongoDB connection parameters
String connectionString = "mongodb://localhost:27017";
String dbName = "userManage";
String collectionName = "login";

try {
    // Connect to MongoDB
    MongoClient mongoClient = MongoClients.create(connectionString);
    MongoDatabase database = mongoClient.getDatabase(dbName);
    MongoCollection<Document> collection = database.getCollection(collectionName);

    // Create document to insert into MongoDB
    Document newUser = new Document();
    newUser.append("name", name)
           .append("email", email)
           .append("password", hashedPassword);

    // Insert document into MongoDB collection
    collection.insertOne(newUser);

    // Close MongoDB resources
    mongoClient.close();

    // Display success message
    String successMessage = "User registered successfully!";
    request.setAttribute("successMessage", successMessage);
    request.getRequestDispatcher("signup.jsp").forward(request, response);
} catch (MongoWriteException e) {
    // Handle MongoDB write exceptions
    String errorMessage = "Failed to insert user. ";
    if (e.getError().getCode() == 11000) {
        errorMessage += "User with this email already exists.";
    } else {
        errorMessage += "Unknown error occurred.";
    }
    request.setAttribute("errorMessage", errorMessage);
    request.getRequestDispatcher("signup.jsp").forward(request, response);
} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
    // Handle hashing error
    e.printStackTrace();
    response.sendRedirect("signup_error.jsp");
} catch (Exception e) {
    // Handle other exceptions
    e.printStackTrace();
    String errorMessage = "Failed to insert user due to an unknown error.";
    request.setAttribute("errorMessage", errorMessage);
    request.getRequestDispatcher("signup.jsp").forward(request, response);
}

// Function to hash the password using SHA-256 algorithm
private String hashPassword(String password) {
    try {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] hash = digest.digest(password.getBytes("UTF-8"));
        StringBuffer hexString = new StringBuffer();

        for (int i = 0; i < hash.length; i++) {
            String hex = Integer.toHexString(0xff & hash[i]);
            if (hex.length() == 1) hexString.append('0');
            hexString.append(hex);
        }

        return hexString.toString();
    } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
        // Handle hashing error
        e.printStackTrace();
        return null;
    }
}
%>
