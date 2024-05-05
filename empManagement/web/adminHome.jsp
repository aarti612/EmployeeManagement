
 <%@include file="header.html"%>
<!DOCTYPE html>
<html>
<title>eSchool</title>
<body>
    
    <style>
    /* Style for the tab buttons */
    .tablink {
        background-color: #007bff;
        color: #fff;
        padding: 10px 20px;
        border: none;
        cursor: pointer;
    }
    .tablink:hover {
        background-color: #0056b3;
    }
    /* Style for the active tab button */
    .w3-red {
        background-color: #ff0000 !important;
    }

    /* Style for the container */
    .w3-container {
        padding: 20px;
    }

    /* Style for the card in the form sections */
    .card {
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .card-header {
        background-color: #007bff;
        color: #fff;
        padding: 10px;
    }

    .card-body {
        padding: 20px;
    }

    /* Style for form inputs and labels */
    .form-group {
        margin-bottom: 15px;
    }

    label {
        font-weight: bold;
    }

    /* Style for buttons */
    .btn-primary {
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        padding: 10px 20px;
        cursor: pointer;
    }

    .btn-primary:hover {
        background-color: #0056b3;
    }

    /* Style for the table section */
    #student-section, #teacher-section {
        background: #000;
        padding: 20px;
        color: #fff; /* Set text color to white */
    }

    .tbl-header {
        background-color: #007bff;
        color: #fff;
        padding: 10px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        color: #fff; /* Set text color to white */
    }

    th, td {
        padding: 8px;
    }

    /* Remove alternating row background color */
    tr:nth-child(even) {
        background-color: transparent;
    }

    /* Style for the time table form */
    #timeTableForm {
        max-width: 400px;
        margin: 0 auto;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    #timeTableForm label {
        font-weight: bold;
        color: #000; /* Set label text color to black */
    }

    #timeTableForm select, #timeTableForm input[type="text"] {
        width: 100%;
        padding: 10px;
        margin: 5px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    #timeTableForm input[type="submit"] {
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        padding: 10px 20px;
        cursor: pointer;
    }

    #timeTableForm input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>

<!--<img src="logo.png"  align="left"width="100" height="100">
<center><img src="dgi.png" width="100" height="100">
<img src="apj sir.png" align="right"  width="100" height="100"></center>-->
<div class="w3-container">
  <div class="w3-bar w3-black">
    <button class="w3-bar-item w3-button tablink w3-red" onclick="openCity(event,'London')">Add New Student</button>
    <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'NewTeacher')">Add New Teacher</button>
    <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'Tokyo')">Registered Students</button>
    <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'ViewTeacher')">Registerd Teacher</button>
     <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'Time_table')">Teacher Time Table</button>
     <a href="Login.html" class="w3-bar-item w3-button tablink">Logout</a>
  </div>
  
  <div id="London" class="w3-container w3-border city">
  <br>
<!--   <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->


<!------ Include the above in your HEAD tag ---------->

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">

    <link rel="icon" href="Favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

    <!-- jQuery (before Bootstrap JavaScript) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    
     

</head>
<body>
<main class="my-form">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-8">
                    <div class="card">
                        <div class="card-header" style="background-color: black;">Add New Students</div>
                        <div class="card-body">
                            <form name="my-form" onsubmit="return validform()" action="addNewStudent.jsp" method="post">
                                <div class="form-group row">
                                    <label for="full_name" class="col-md-4 col-form-label text-md-right">Course Name</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="course" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="email_address" class="col-md-4 col-form-label text-md-right">Branch Name</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="branch" required>
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <label for="phone_number" class="col-md-4 col-form-label text-md-right">Name</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="name" >
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="present_address" class="col-md-4 col-form-label text-md-right">Father Name</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="fatherName">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="gender" class="col-md-4 col-form-label text-md-right">Gender</label>
                                        <div class="col-md-6">
                                            <select class="form-control" name="gender" id="gender">
                                                <option value="male">Male</option>
                                                <option value="female">Female</option>
                                            </select>
                                        </div>
                                </div>

                                
                                <div class="form-group row">
                                    <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>
                                    <div class="col-md-6">
                                        <input type="password" class="form-control" name="password">
                                    </div>
                                </div>


                                    <div class="col-md-6 offset-md-4">
                                        <button type="submit" class="btn btn-primary">
                                        Save
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
            </div>
        </div>
    </div>
    
  <div id="NewTeacher" class="w3-container w3-border city" style="display:none">
    <br>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <!-- Your code for adding new teachers -->

    <div class="card">
        <div class="card-header" style="background-color: black;">Add New Teacher</div>
        <div class="card-body">
            <form name="teacher-form" onsubmit="return validTeacherForm()" action="addNewTeacher.jsp" method="post">
                <div class="form-group row">
                    <label for="teacherName" class="col-md-4 col-form-label text-md-right">Teacher Name</label>
                    <div class="col-md-6">
                        <input type="text" class="form-control" name="teacherName">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="qualification" class="col-md-4 col-form-label text-md-right"> Qualification</label>
                    <div class="col-md-6">
                        <input type="text" class="form-control" name="qualification">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="experience" class="col-md-4 col-form-label text-md-right">Experience</label>
                    <div class="col-md-6">
                        <input type="text" class="form-control" name="experience">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="salary" class="col-md-4 col-form-label text-md-right">Salary</label>
                    <div class="col-md-6">
                        <input type="int" class="form-control" name="salary">
                    </div>
                </div>

                
                 <div class="form-group row">
                        <label for="gender" class="col-md-4 col-form-label text-md-right">Gender</label>
                            <div class="col-md-6">
                                <select class="form-control" name="gender" id="gender">
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                </select>
                            </div>
                 </div>
                <div class="form-group row">
                    <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>
                    <div class="col-md-6">
                        <input type="password" class="form-control" name="password">
                    </div>
                </div>
                
                                <!-- Add more fields as needed -->

                <div class="col-md-6 offset-md-4">
                    <button type="submit" class="btn btn-primary">
                        Save
                    </button>
                </div>
            </form>
        </div>
    </div>
  </div>
</div>
    
</main>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
  </div>

  <div id="Paris" class="w3-container w3-border city" style="display:none">
  <br>
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html> 
  </div>

  
  <div id="Tokyo" class="w3-container w3-border city" style="display:none">
  
<section id="student-section" style="background:black">
  <!--for demo wrap-->
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
         <th>Course Name</th>
          <th>Branch Name</th>
          <th>Roll Number</th>
          <th>Name</th>
          <th>Father Name</th>
          <th>Gender</th>
          <th>Not Enable</th>
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
          
        <%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement" %>

        
        <%
        try {
            String jdbcURL = "jdbc:mysql://localhost:3306/eschool";
            String jdbcUsername = "root";
            String jdbcPassword = "";
            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            Statement statement = connection.createStatement();
            String sql = "SELECT s.roll_number, s.course, s.branch, s.name, s.fatherName, s.gender, u.id, u.Enabled FROM student as s  LEFT JOIN Users as u ON s.id = u.id" ;
            ResultSet resultSet = statement.executeQuery(sql);
            
             while (resultSet.next()) {
        String roll_number = resultSet.getString("roll_number");
        String course = resultSet.getString("course");
        String branch = resultSet.getString("branch");
        String name = resultSet.getString("name");
        String fatherName = resultSet.getString("fatherName");
        String gender = resultSet.getString("gender");
        int enabled = resultSet.getInt("Enabled"); // Get the enabled status from the database

        // Determine if the checkbox should be checked based on the value of "enabled"
        boolean isChecked = (enabled == 0); // If enabled is 0, the checkbox is checked

        %>
        <tr>
            <td><%= course %></td>
            <td><%= branch %></td>
            <td><%= roll_number %></td>
            <td><%= name %></td>
            <td><%= fatherName %></td>
            <td><%= gender %></td>
            <td>
<input type="checkbox" id="<%= roll_number %>_checkbox" <%= isChecked ? "checked" : "" %> onchange="toggleStudentStatus('<%= roll_number %>')">

            </td>
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
       
      </tbody>
    </table>
  </div>
<script>
function toggleStudentStatus(rollNumber) {
    console.log("Function called with rollNumber: " + rollNumber);

    // Send an AJAX request to update the student's eligibility
    const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                const response = xhr.responseText;
                if (response === 'success') {
                    alert("Failed to update student eligibility.");
                } else {
                    alert("Student eligibility updated successfully.");
                }
            } 
        }
    };

    xhr.open("POST", "updateStudentStatus.jsp", true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.send("roll_number=" + rollNumber);
}
</script>


</section>
</div>
        
          
        
  <div id="ViewTeacher" class="w3-container w3-border city" style="display:none">
    <section id="teacher-section" style="background:black">
        <div class="tbl-header">
            <table cellpadding="0" cellspacing="0" border="0">
                <thead>
                    <tr>
                        <th>Teacher ID</th>
                        <th>Teacher Name</th>
                        <th>Qualification</th>
                        <th>Salary</th>
                        <th>Experience</th>
                        <th>Gender</th>
                        <th>Not Enabled</th>
                    </tr>
                </thead>
            </table>
        </div>
        <div class="tbl-content">
            <table cellpadding="0" cellspacing="0" border="0">
                <tbody>
                    <%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement" %>
                    <%
                    try {
                        String jdbcURL = "jdbc:mysql://localhost:3306/eschool";
                        String jdbcUsername = "root";
                        String jdbcPassword = "";
                        Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                        Statement statement = connection.createStatement();
                        String sql = "SELECT t.teacherId, t.id, t.salary, t.teacherName, t.gender, t.experience, t.qualification, u.id, u.Enabled FROM teacher as t  LEFT JOIN Users as u ON t.id = u.id";
                        ResultSet resultSet = statement.executeQuery(sql);

                        while (resultSet.next()) {
                            String teacherId = resultSet.getString("teacherId");
                            String teacherName = resultSet.getString("teacherName");
                            String qualification = resultSet.getString("qualification");
                            String salary = resultSet.getString("salary");
                            String experience = resultSet.getString("experience");
                            String gender = resultSet.getString("gender");
                            int enabled = resultSet.getInt("Enabled");

                            // Determine if the checkbox should be checked based on the value of "enabled"
                            boolean isChecked = (enabled == 0);

                    %>
                            <tr>
                                <td><%= teacherId %></td>
                                <td><%= teacherName %></td>
                                <td><%= qualification %></td>
                                <td><%= salary %></td>
                                <td><%= experience %></td>
                                <td><%= gender %></td>
                                <td>
                                    <input type="checkbox" id="<%= teacherId %>_checkbox" <%= isChecked ? "checked" : "" %> onchange="toggleTeacherStatus('<%= teacherId %>')">
                                </td>
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
                </tbody>
            </table>
        </div>
        <script>
            function toggleTeacherStatus(teacherId) {
                console.log("Function called with teacherId: " + teacherId);

                // Send an AJAX request to update the teacher's status
                const xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4) {
                        if (xhr.status === 200) {
                            const response = xhr.responseText;
                            if (response === 'success') {
                                alert("Failed to update teacher status.");
                            } else {
                                alert("Teacher status updated successfully.");
                            }
                        }
                    }
                };

                xhr.open("POST", "updateTeacherStatus.jsp", true);
                xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhr.send("teacherId=" + teacherId);
            }
        </script>
    </section>
</div>
      

</div>


<div id="Time_table" class="w3-container w3-border city" >
    <section id="teacher-section" style="background:black">
     
    <form id="timeTableForm" action="insertTimeTable.jsp" method="post">
        <label for="teacher" style="color:white;">Teacher Name:</label>
        <select id="teacherDropdown" name="teacherId" required>
            <option value="" disabled selected>Select Teacher</option>
            <%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement" %>
            <%
            try {
                String jdbcURL = "jdbc:mysql://localhost:3306/eschool";
                String jdbcUsername = "root";
                String jdbcPassword = "";
                Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                Statement statement = connection.createStatement();
                String teacherSql = "SELECT teacherId, teacherName FROM teacher";
                ResultSet teachers = statement.executeQuery(teacherSql);
                while (teachers.next()) {
                    String teacherId = teachers.getString("teacherId");
                    String teacherName = teachers.getString("teacherName");
            %>
            <option value="<%= teacherId %>"><%= teacherName %></option>
            <%
                }
                teachers.close();
                statement.close();
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
        </select><br>

        <label for="class" style="color:white;">Class:</label>
        <input type="text" id="classInput" name="className" required><br>

        <label for="subject" style="color:white;">Subject:</label>
         <input type="text" id="subjectInput" name="subject" required><br>
        <input type="submit" value="Add Time Table">
    </form>
</div>

        <script>

    document.getElementById('teacherDropdown').addEventListener('change', function () {
        const teacherId = this.value;
        document.getElementById('timeTableForm').elements['teacherId'].value = teacherId;
    });
</script>

                    
    </section>
</div>
        
    <hr class="new1">
  <center><h5>Note: Any errors occur then contact/h5></center>
  <hr class="new1">
  <hr class="new1">
<br>
</body>
</html>