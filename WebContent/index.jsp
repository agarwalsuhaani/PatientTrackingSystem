<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Tracking</title>
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
	<%@include file="navbar.jsp"%>
	<div id="demo" class="carousel slide" data-ride="carousel">
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="   2"></li>
		</ul>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="images/2.jpg" alt="Los Angeles" width="1100" height="500">
			</div>
			<div class="carousel-item">
				<img src="images/3.jpg" alt="Chicago" width="1100" height="500">
			</div>
			<div class="carousel-item">
				<img src="images/4.jpg" alt="New York" width="1100" height="500">
			</div>
		</div>
		<a class="carousel-control-prev" href="#demo" data-slide="prev"> <span
			class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#demo" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>
	<section class="my-5">
		<div class="py-3">
			<h2 class="text-center">About Us</h2>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-12">
					<img src="images/12.jpg" class="img-fluid aboutimg">
				</div>
				<div class="col-lg-6 col-md-6 col-12">
					<h6 class="display-4">Patient Tracking System</h6>
					<p class="py-3">The Patient Tracking System will help patients
						schedule appointments with the choice of their doctors and
						according to their specializations.</p>
					<a href="about.jsp" class="btn btn-success">Know More</a>
				</div>
			</div>
		</div>
	</section>
	<section class="my-5">
		<div class="py-5">
			<h2 class="text-center">Contact Us</h2>
		</div>
		<div class="w-50 m-auto">
			<form action="contact.jsp">
				<div class="form-group">
					<label>Name</label> <input type="text" name="name"
						autocomplete="off" class="form-control"
						placeholder="Enter your Name" required>
				</div>
				<div class="form-group">
					<label>Contact Number</label> <input type="tel" name="contact"
						autocomplete="off" class="form-control"  
						placeholder="Enter your Contact Number" pattern="^\d{3}-\d{3}-\d{4}$" required>
				</div>
				<div class="form-group">
					<label>Email Id</label> <input type="email" name="email"
						autocomplete="off" class="form-control"
						placeholder="Enter Email Id" pattern="/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/" required>
				</div>
				<div class="form-group">
					<label>Comments</label>
					<textarea class="form-control" autocomplete="off"
						placeholder="Comments" required></textarea>
				</div>
				<button type="submit" class="btn btn-success">Submit</button>
			</form>
		</div>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>