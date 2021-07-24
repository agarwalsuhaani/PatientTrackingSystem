<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Choose User Type</title>
<link rel="stylesheet" type="text/css" href="CSS/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="card-group">
  <div class="card">
    <img class="card-img-top" src="images/patient.jpg" alt="Card image cap">
    <div class="card-body">
      <h5 class="card-title">Patient</h5>
      <p class="card-text">Register Here</p>
      <a href="RegisterPatient.jsp" class="btn btn-primary">Register as Patient</a>
    </div>
  </div>
  <div class="card">
    <img class="card-img-top" src="images/doctor.png" alt="Card image cap">
    <div class="card-body">
      <h5 class="card-title">Doctor</h5>
      <p class="card-text">Register here</p>
      <a href="RegisterDoctor.jsp" class="btn btn-primary">Register as Doctor</a>
    </div>
  </div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>