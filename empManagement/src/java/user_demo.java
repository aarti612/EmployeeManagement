
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoDatabase;

public class user_demo extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String accessRole = request.getParameter("accessRole");
        String database = request.getParameter("database");

        try {
            // Connect to MongoDB
            MongoClient mongoClient = MongoClients.create();
            // Add user logic here (e.g., create user in the specified database with the given access role)
            // Close MongoDB connection
            mongoClient.close();

            response.sendRedirect("user-management.jsp");
        } catch (Exception e) {
            // Handle exception
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
user-management.jsp: