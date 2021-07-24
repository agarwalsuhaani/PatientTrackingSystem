<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList" %>
    <%@page import="java.util.List"%>
    <%@page import="java.io.OutputStream" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ include file="navbar.jsp" %>
<%@page import="java.sql.*" import="java.io.IOException"%>
<% 
Connection conn=null;
List<String> list= new ArrayList<String>();

try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root","burlmouse77");
	String sql= "Select img from doctor where doctorid="+request.getParameter("dID");
	Statement st=conn.createStatement();
	ResultSet rs= st.executeQuery(sql);
	byte[] imgData=null;
	
	while(rs.next())
	{
		Blob blob=rs.getBlob(1);
		imgData= blob.getBytes(1, (int) blob.length());
	}
	response.setContentType("image/png");
	OutputStream os= response.getOutputStream();
	os.write(imgData);
	os.flush();
	os.close();
	rs.close();
	st.close();
	conn.close();
}
catch(Exception e)
{
	out.println("Some exception here " +e);
}
%>
<%@ include file="footer.jsp" %>
</body>
</html>