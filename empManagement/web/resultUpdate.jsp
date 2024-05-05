<%@ page import="java.sql.*" %>

<%
Connection con = null; // Declare the Connection variable outside the try block

try {
    if (request.getMethod().equals("POST")) {
        // Retrieve form parameters
        String rollNumber = request.getParameter("roll_number");
        String enggPhysicsParam = request.getParameter("engg_physics");
        String enggChemistryParam = request.getParameter("engg_chemistry");
        String enggMathematicsParam = request.getParameter("engg_mathematics");
        String basicElectricalEnggParam = request.getParameter("basic_electrical_engg");
        String electronicEnggParam = request.getParameter("electronic_engg");
        String enggChemistryLabParam = request.getParameter("engg_chemistry_lab");
        String enggPhysicsLabParam = request.getParameter("engg_physics_lab");

        try {
            Class.forName("com.mysql.jdbc.Driver"); // Adjust the driver class for your database

            // Replace 'your_url', 'your_username', and 'your_password' with your database details
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eschool", "root", "");

            // Create a PreparedStatement to insert data
            PreparedStatement ps = con.prepareStatement("INSERT INTO result (roll_number, engg_physics, engg_chemistry, engg_mathematics, basic_electrical_engg, electronic_engg, engg_chemistry_lab, engg_physics_lab) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");

            // Set the values for the placeholders
            ps.setString(1, rollNumber);
            ps.setString(2, enggPhysicsParam);
            ps.setString(3, enggChemistryParam);
            ps.setString(4, enggMathematicsParam);
            ps.setString(5, basicElectricalEnggParam);
            ps.setString(6, electronicEnggParam);
            ps.setString(7, enggChemistryLabParam);
            ps.setString(8, enggPhysicsLabParam);

            // Execute the update
            ps.executeUpdate();

            // Close the PreparedStatement
            ps.close();
        } catch (SQLException ex) {
            out.println("An error occurred: " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            // Close the database connection in the 'finally' block to ensure it's closed even in case of an exception
            if (con != null) {
                con.close();
            }
        }

        // Redirect to the adminHome.jsp page if the insertion was successful
        response.sendRedirect("teachers.jsp");
    }
} catch (Exception ex) {
    out.println("An error occurred: " + ex.getMessage());
    ex.printStackTrace();
}
%>
