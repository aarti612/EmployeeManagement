import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.List;
import java.util.ArrayList;

public class mongo extends HttpServlet {
    private List<MongoDBInstance> instances = new ArrayList<>();

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String host = request.getParameter("host");
        int port = Integer.parseInt(request.getParameter("port"));
        // You might want to add more validation here

        // Create a new MongoDB instance and add it to the list
        MongoDBInstance instance = new MongoDBInstance(host, port);
        instances.add(instance);

        // Redirect back to the management page
        response.sendRedirect("manage-instances.jsp");
    }
}
