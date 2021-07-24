<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.mit2.patient.impl.DoctorName" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="CSS/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
</head>
<body>
<%@include file="navbar.jsp"%>	
	<%@page import="java.sql.*" import="java.io.IOException"%>
	<%
Connection conn=null;
try
{
	DoctorName docid=new DoctorName();
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root","burlmouse77");
	String spec_name=request.getParameter("spec_name");
	String total_exp=request.getParameter("tot_exp");
	String fees=request.getParameter("fees");
	String dname=(String)session.getAttribute("loggedInUser");
	
	
	if(spec_name!=null && total_exp!=null && fees!=null)
	{
		PreparedStatement st=conn.prepareStatement("insert into `specialization`(spec_name,tot_exp,fees,doctorid,doctorname) values(?,?,?,?,?)");
		st.setString(1,spec_name);
		st.setString(2,total_exp);
		st.setString(3,fees);
		st.setInt(4,docid.getDoctorName(dname));
		st.setString(5,dname);
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
			<h2 class="text-center">Add Specialization</h2>
		</div>

		<div class="w-50 m-auto">
			<form name="spec" action="AddSpecialization.jsp" method="post">
				<div class="form-group">
					<label>Enter Specialization Name</label> <input type="text" name="spec_name"
						autocomplete="off" class="form-control"
						placeholder="Enter your Specialization" required>
				</div>
				<div class="form-group">
					<label>Enter Total Experience</label> <input type="text" name="tot_exp"
						autocomplete="off" class="form-control"
						placeholder="Enter your Experience" required>
				</div>
				<div class="form-group">
					<label>Enter Fees Charged</label> <input type="text" name="fees"
						autocomplete="off" class="form-control"
						placeholder="Enter Fees charged" required>
				</div>
				<button type="submit" class="btn btn-success">Submit</button>
			</form>
		</div>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>