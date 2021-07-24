<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.Date"%>
    <%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
	<% 
	Connection conn=null;
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "burlmouse77");
	try{
		PreparedStatement stmt=conn.prepareStatement("insert into appointment values(?,?,?,?)");
		String spec_name=(String)session.getAttribute("spec_name");
		String doc_name=(String)session.getAttribute("doctorname");
		String date_time= request.getParameter("appointment");
		String date_time_arr[]=date_time.split("T");
		String date =date_time_arr[0];
		String time= date_time_arr[1];
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date d = sdf.parse(date);
		SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MM-yyyy");
		String final_date = sdf2.format(d);
		System.out.println(final_date);
		System.out.println(date);
		System.out.println(time);
		stmt.setString(1,final_date+ " "+ time);
		stmt.setString(2,(String)session.getAttribute("loggedInUser"));
		stmt.setString(3,spec_name);
		stmt.setString(4,doc_name);
		int r=stmt.executeUpdate();
		if(r>0)
		{
			response.sendRedirect("index.jsp");			
			out.println("Schedule added Successfully");
		}

	}
	catch(Exception e)
	{
		System.out.println(e);
	}
	%>
</body>
</html>