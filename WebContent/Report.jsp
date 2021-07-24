<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.mit2.patient.impl.PatientDetails"%>
<%@page import="com.mit2.patient.impl.SpecializationDetails"%>
<%@page import="com.mit2.patient.impl.DoctorName"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Report</title>
<meta name="author" content="harnishdesign.net">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900'
	type='text/css'>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="vendor/font-awesome/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="CSS/styleinvoice.css">
<style>
table, th, td {
	border: 1px solid black;
}
</style>
</head>
<body>
	<% 
Connection conn=null;
String pname=(String)session.getAttribute("loggedInUser");
Date d=new Date();
PatientDetails patientdetails=new PatientDetails();
SpecializationDetails spec_details=new SpecializationDetails();
DoctorName dname=new DoctorName();
try{
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root","burlmouse77");
	Statement st=conn.createStatement();
	String sql="Select * from appointment where patientname='"+pname+"'";
	ResultSet rs=st.executeQuery(sql);
	patientdetails.setDetails(pname);
	
	while(rs.next())
	{
	spec_details.setSpecDetails(rs.getString(3));%>
	<div class="container-fluid invoice-container"></div>
	<header>
		<div class="row align-items-center">
			<div class="col-sm-5 text-center text-sm-right">
				<h4 class="text-7 mb-0">Invoice</h4>
			</div>
		</div>
		<hr>
	</header>
	<div class="row">
		<div class="col-sm-6">
			<strong>Date:</strong><%=d %></div>
		<hr>
	</div>
	<div class="row">
		<div class="col-sm-6 text-sm-right order-sm-1">
			<strong>Invoiced To:</strong>
			<address>
				<%=rs.getString(2) %><br>
			</address>
		</div>
		<div class="col-sm-6 order-sm-0">
			<strong>Patient Details:</strong>
			<address>
				<%= pname %><br>
			</address>
			<strong>Doctor Details:</strong>
			<address>
			<%= rs.getString(4) %>
			</address>
		</div>
	</div>
	<div class="card">
		<div class="card-header px-2 py-0">
			<table class="table mb-0">
				<thead>
					<tr>
						<th><strong>Service</strong></th>
						<th><strong>Description</strong></th>
						<th><strong>Amount</strong></th>
					</tr>
				</thead>
				<tbody>
				<tr>
				<td>Specialization Price</td>
				<td>Specialization price excluding tax</td>
				<td class="bg-light-2 text-right"><%=spec_details.getPrice() %></td>
				</tr>
				<tr>
				<td>Doctor fees</td>
              <td >Charges include doctor and equipment fees</td>
			  <td class="bg-light-2 text-right">$<%=(spec_details.getPrice())*5/100 %></td>
            </tr>
            <tr>
              <td class="bg-light-2 text-right" colspan="2"><strong>Sub Total:</strong></td>
              <td class="bg-light-2 text-right">$<%=(spec_details.getPrice())*105/100 %></td>
            </tr>
            <tr>
              <td class="bg-light-2 text-right" colspan="2" ><strong>Tax:</strong></td>
              
              <td class="bg-light-2 text-right" >$<%=((spec_details.getPrice())*105/100)*5/100 %></td>
            </tr>
            <tr>
              <td class="bg-light-2 text-right" colspan="2"><strong>Total:</strong></td>
              <td class="bg-light-2 text-right">$<%=((spec_details.getPrice())*105/100)*105/100 %></td>
            </tr>
          </tbody>
          </table>
				
		</div>
	</div>
	<% }
	
}
catch(Exception e)
{
	out.println(e);
}

%>
<footer class="text-center mt-4">
  <p class="text-1"><strong>NOTE :</strong> This is computer generated receipt and does not require physical signature.</p>
  <div class="btn-group btn-group-sm d-print-none"> <a href="javascript:window.print()" class="btn btn-light border text-black-50 shadow-none"><i class="fa fa-print"></i> Print</a> <a href="http://localhost:8080/hospital/Report.jsp?pname=<%=pname %>"  class="btn btn-light border text-black-50 shadow-none" download><i class="fa fa-download"></i> Download</a> </div>
  </footer>
</body>
</html>