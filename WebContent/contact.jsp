<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Us</title>
</head>
<body>
	<%@include file="navbar.jsp"%>	
	<%@page import="java.sql.*" import="java.io.IOException"%>
<%
Connection conn=null;
try
{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root","burlmouse77");
	
	String name=request.getParameter("name");
	String contact=request.getParameter("contact");
	String email=request.getParameter("email");
	String comment=request.getParameter("comment");
	
	if(name!=null && contact!=null && email!=null)
	{
		PreparedStatement st=conn.prepareStatement("insert into feedback values(?,?,?,?)");
		st.setString(1,name);
		st.setString(2,contact);
		st.setString(3,email);
		st.setString(4,comment);
		int r=st.executeUpdate();
		if(r>0)
		{
			out.println("Record Inserted Successfully");
		}
	}
}
catch(Exception e)
{
	out.println("Some exception here "+e);
}
%>
	<section class="my-5">
		<div class="py-5">
			<h2 class="text-center">Contact Us</h2>
		</div>

		<div class="w-50 m-auto">
			<form name="contact" action="contact.jsp" method="post">
				<div class="form-group">
					<label>Name</label> <input type="text" name="name"
						autocomplete="off" class="form-control"
						placeholder="Enter your Name" required>
				</div>
				<div class="form-group">
					<label>Contact Number</label> <input type="tel" name="contact"
						autocomplete="off" class="form-control"
						placeholder="Enter your Phone Number" pattern="^\d{3}-\d{3}-\d{4}$" required>
				</div>
				<div class="form-group">
					<label>Email Id</label> <input type="email" name="email"
						autocomplete="off" class="form-control"
						placeholder="Enter your Email ID" pattern="/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/" required>
				</div>
				<div class="form-group">
					<label>Comments</label>
					<textarea class="form-control" placeholder="Enter comments"></textarea>
				</div>
				<button type="submit" class="btn btn-success">Submit</button>
			</form>
		</div>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>