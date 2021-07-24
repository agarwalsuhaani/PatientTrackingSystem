<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<%@include file="navbar.jsp" %>
<section class="my-5">
		<div class="py-5">
			<h2 class="text-center">Register Patient</h2>
		</div>
		<div class="w-50 m-auto">
			<form name="patient" action="patient" method="post"
				enctype="multipart/form-data">
				<div class="form-group">
					<label>Name</label> <input type="text" name="PatientName"
						autocomplete="off" class="form-control" required>
				</div>
				<div class="form-group">
					<label>Password</label> <input type="password" name="password"
						autocomplete="off" class="form-control" required>
				</div>
				<div class="form-group">
					<label>Contact</label> <input type="number" name="PatientContact"
						autocomplete="off" class="form-control"  required>
				</div>
				<div class="form-group">
					<label>Address</label> <input type="text" name="PatientAddress"
						autocomplete="off" class="form-control" required>
				</div>
				<div class="form-group">
					<label>Email</label> <input type="email" name="PatientEmail"
						autocomplete="off" class="form-control" pattern="/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/" required>
				</div>
				<div class="form-group">
					<label>Upload</label> <input type="file" name="photo"
						class="form-control">
				</div>
				<button type="submit" class="btn btn-success">Submit</button>
			</form>
		</div>
	</section>
<%@include file="footer.jsp" %>
</body>
</html>