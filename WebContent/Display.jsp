<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="CSS/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="navbar.jsp" %>
<%@page import="java.sql.*" import="java.io.IOException"%>
<%
String img_path;
Connection conn=null;
String doctorid=request.getParameter("dID");
int doctor_id = Integer.parseInt(doctorid);
try
{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root","burlmouse77");
	Statement st = conn.createStatement();
	String sql= "Select * from doctor where doctorid ="+doctor_id;
	ResultSet rs = st.executeQuery(sql);
	while(rs.next())
	{
		session.setAttribute("doctorid",rs.getInt(6));
 		img_path = "images/" + rs.getString(5);%>				  
	<section class="my-5">
	<div class="container-fluid">
	<div class="row">
		<div class="col-lg-6 col-md-6 col-12">
			<img src="http://localhost:8080/PatientTracking2/imageDisplay.jsp?dID=<%=rs.getInt(6)%>" class="img-fluid displayimg" >
		</div>
			<div class="col-lg-6 col-md-6 col-12">
				<h2 class="display-4">Name: <%out.println(rs.getString(1)); %></h2>
				<h2>Location :<%out.println(rs.getString(2)); %></h2>
				<h3> Contact Number: <%out.println(rs.getString(3)); %></h3>
				<h3> Email ID: <%out.println(rs.getString(4)); %></h3> <br> <br> <br>
				<a href="Specializations.jsp?dID=<%= rs.getString(6) %>" class="btn btn-success">Look for Specializations</a>
			</div>
		</div>
	</div>
</section>
		<%
		
	}
}
catch(Exception e)
{
	out.println(e);
}

%>

<%@include file="footer.jsp" %>
</body>
</html>