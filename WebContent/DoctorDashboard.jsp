<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="CSS/style.css">
<link
	href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="navbar.jsp"%>
	<%@page import="java.sql.*" import="java.io.IOException"%>
	<%
	Connection conn = null;
	try {

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "burlmouse77");
		Statement st = conn.createStatement();
		String doctor_name = (String) session.getAttribute("loggedInUser");
		String sql = "Select * from appointment where doctorname ='" + doctor_name + "'";
		ResultSet rs = st.executeQuery(sql);
	%>
	<section class="my-5">
		<div class="py-5">
			<h2 class="text-center">My Appointments</h2>
		</div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Serial No</th>
					<th>Patient Name</th>
					<th>Specialization Name</th>
					<th>Date and Time</th>
					<th>Doctor Name</th>
				</tr>
			</thead>
			<tbody>
				<%
					while (rs.next()) {
					int count = 1;
				%>
				<tr>
					<td><%=count%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(4) %></td>
				</tr>

				<%
					count++;
				}
				%>
			</tbody>
		</table>
	</section>
	<%
		} catch (Exception e) {

	}
	%>
	<br>
	<br>
	<br>
	<br>
	<%@include file="footer.jsp" %>
</body>
</html>