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
	<%@ include file="navbar.jsp"%>
	<%@ page import="java.sql.*" import="java.io.IOException"%>
	<section class="my-5">
		<div class="py-3">
			<h2 class="text-center">Choose Specialization</h2>
			</div>
	<%
		Connection conn = null;
	String doctorid=request.getParameter("dID");
	int doctor_id=Integer.parseInt(doctorid);
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "burlmouse77");
		Statement st=conn.createStatement();
		Statement st1=conn.createStatement();
		String sql = "Select * from specialization where doctorid=" +doctor_id;
		String sql2="Select doctorname from doctor where doctorid="+doctor_id;
		ResultSet rs = st.executeQuery(sql);
		
		while(rs.next())
		{
			session.setAttribute("doctorid",rs.getInt(5));
			
	%>
	
			<div class="container-fluid">
			<div class="row">
			<div class="col-lg-4 col-md-3 col-12">
			<img class="card-img-top" src="http://localhost:8080/PatientTracking2/imageDisplay.jsp?dID=<%=rs.getInt(5)%>" alt="card-image"
				class="img-fluid-cardimg">
			<div class="card-body">
				<p class="card-text">Specialization Name: <%=rs.getString(2) %></p>
				<p class="card-text">Total Experience: <%= rs.getString(3) %></p>
				<p class="card-text">Fees Charged: <%=rs.getString(4) %></p>
				<a href="Appointment.jsp?spec_id=<%= rs.getInt(1) %>" class="btn btn-success">Book Appointment</a>
				
			</div>
			</div>
			<% } %>
			</div>
		</div>
		<% ResultSet rs1 = st.executeQuery(sql2);
		while (rs1.next()){
			session.setAttribute("doctorname",rs1.getString(1));%>
			
	<% }
		%>
	
	<% } catch (Exception e)
	{
		out.println(e);
	}
	%>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>