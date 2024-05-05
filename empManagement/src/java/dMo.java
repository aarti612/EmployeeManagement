import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoDatabase;

public class dMo extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String dbName = request.getParameter("dbName");

        try {
            // Connect to MongoDB
            MongoClient mongoClient = MongoClients.create();
            // Drop database
            mongoClient.dropDatabase(dbName);
            // Close MongoDB connection
            mongoClient.close();

            response.sendRedirect("mMo.jsp");
        } catch (Exception e) {
            // Handle exception
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}