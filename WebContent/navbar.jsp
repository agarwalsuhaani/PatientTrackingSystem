<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.mit2.patient.Role"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="index.jsp">Patient Tracking</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="index.jsp">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="about.jsp">About</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact
						Us</a></li>
				<%
					if (Role.patient.equals(session.getAttribute("Role"))) {
				%>
				<li class="nav-item"><a class="nav-link" href="Explore.jsp">Find
						Doctors</a></li>
						<li class="nav-item">
        <a class="nav-link" href="PatientDashboard.jsp">Dashboard</a>
      </li>

				<%
					}
				%>
				<%
					if (Role.doctor.equals(session.getAttribute("Role"))) {
				%>
						<li class="nav-item">
        <a class="nav-link" href="DoctorDashboard.jsp">Dashboard</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="DoctorSpecialization.jsp">Specialization</a>
      </li>

				<%
					}
				%>
				<%
					if (session.getAttribute("loggedInUser") == null) {
				%>
				<li class="nav-item"><a class="nav-link" href="Login.jsp">Login</a>
				</li>
				<%
					} else {
				%>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="navbarDropdown" role="button"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<%=session.getAttribute("loggedInUser")%>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="logout.jsp">Logout</a>

					</div></li>
				<%
					}
				%>
			</ul>
		</div>
	</nav>
</body>
</html>