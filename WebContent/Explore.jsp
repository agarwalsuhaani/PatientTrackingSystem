<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<%@ page import="java.sql.*" import="java.io.IOException"%>
	<%
		Connection conn = null;
	List<String> list = new ArrayList<String>();

	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "burlmouse77");
		String sql = "Select * from doctor";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
	%>
	<section class="my-5">
		<div class="py-3">
			<h2 class="text-center">Find Doctors</h2>
		</div>
		<div class="container-fluid">
			<div class="row">
				<%
					while (rs.next()) {
				%>
				<div class="col-lg-4 col-md-3 col-12">
					<div class="card">
						<img class="card-img-top" src="http://localhost:8080/PatientTracking2/imageDisplay.jsp?dID=<%=rs.getInt(6)%>" alt="Card image"
							class="img-fluid cardimg">
						<div class="card-body">
							<h5 class="card-title">Doctor Name : <%=rs.getString(1)%></h5>
							<p class="card-text">Location :<%=rs.getString(2)%></p>
							<a href="Display.jsp?dID=<%=rs.getInt(6)%>"
								class="btn btn-success">See Profile</a>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</section>
	<%
		} catch (Exception e) {
	out.println(e);
	}
	%>
<%@include file="footer.jsp" %>
</body>
</html>