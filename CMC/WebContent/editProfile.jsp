<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="patient.modal.Patient, java.util.ArrayList, modal.Appointment"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Appointment - Patient Dashboard - Central Medic
	Center</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/dashboard.css">
<link rel="stylesheet" href="css/patient.css">
</head>
<body>
	<% Patient patient = (Patient)request.getAttribute("patient"); %>
	
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="patient">Central Medic Center</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="patient">Dashboard</a></li>
				<li class="active"><a href="#">Edit Profile</a></li>
				<li><a href="logout">Logout</a></li>
			</ul>
			<form class="navbar-form navbar-right">
				<input type="text" class="form-control" placeholder="Search...">
			</form>
		</div>
	</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 sidebar">
				<ul class="nav nav-sidebar">
					<li class="active">

						<div class="row intro">
							<div class="col-sm-12 col-md-6 col-lg-4">
								<div class="">
									<img class="profilePic" src="media/user.png">
								</div>
							</div>
							<div class="col-sm-12 col-md-6 col-lg-8 info">
								<br> <span class="name"><%= patient.getFirstName() +" " + patient.getLastName() %></span><br>
								<img src="media/gender.png"><span class="details">
									<%= patient.getGender() +", " + patient.getAge() %></span><br> <img
									src="media/bloodGroup.png"><span class="blood"> <%= patient.getBloodGroup() %></span><br>
								<img src="media/Location.png"><span class="location">
									<%= patient.getAddress() %></span>
							</div>
						</div>

					</li>
					<li><a href="bookAppointment.jsp">Book Appointment</a></li>
					<li><a href="#">Upcoming Appointments</a></li>
					<li><a href="#">Appointment History</a></li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 main">
				<h1 class="page-header">
					<center>Edit Profile</center>
				</h1> 
				<h4 class="sub-header">Personal Information</h4>
				<form class="form-horizontal" action="editProfile" method="post">
				<input type="hidden"  name="patientId"
								value="<%= ""+ session.getAttribute("UserID") %>" />
					<div class="form-group">
						<label for="firstName" class="col-sm-2 control-label">First
							Name</label>
						<div class="col-sm-10">
							<p class="form-control-static"><%= patient.getFirstName() %></p>
						</div>
					</div>
					<div class="form-group">
						<label for="lastName" class="col-sm-2 control-label">Last
							Name</label>
						<div class="col-sm-10">
							<p class="form-control-static"><%= patient.getLastName() %></p>
						</div>
					</div>
					<div class="form-group">
						<label for="gender" class="col-sm-2 control-label">Gender</label>
						<div class="col-sm-10">
							<p class="form-control-static"><%= patient.getGender() %></p>
						</div>
					</div>
					<div class="form-group">
						<label for="date" class="col-sm-2 control-label">Date Of
							Birth</label>
						<div class="col-sm-10">
							<input type="date" class="form-control" name="dob" id="date"
								placeholder="Date" value="<%= patient.getStringDob() %>" >>
								<h1><%= patient.getStringDob() %></h1>
						</div>
					</div>
					<div class="form-group">
						<label for="phoneNumber" class="col-sm-2 control-label">Phone
							Number</label>
						<div class="col-sm-10">
							<input type="phoneNumber" class="form-control" name="contactNumber" id="phoneNumber"
								placeholder="+91 9521113802" value="<%= patient.getContactNumber() %>">
						</div>
					</div>
					<div class="form-group">
						<label for="address" class="col-sm-2 control-label">Address</label>
						<div class="col-sm-10">
							<textarea class="form-control" name="address" rows="2"
								placeholder="BH-3, The LNMIIT" value="" ><%= patient.getAddress() %></textarea>
						</div>
					</div>
					<h4 class="sub-header">Health Information</h4>
					<div class="form-group">
						<label for="height" class="col-sm-2 control-label">Height</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="height" id="height"
								placeholder="in cm" value="<%= patient.getHeight() %>">
						</div>
					</div>
					<div class="form-group">
						<label for="weight" class="col-sm-2 control-label">Weight</label>
						<div class="col-sm-10">
							<input type="Number" class="form-control" name="weight" id="weight"
								placeholder="in kgs" value="<%= patient.getWeight() %>">
						</div>
					</div>
					<div class="form-group">
						<label for="bloodGroup" class="col-sm-2 control-label">Blood
							Group</label>
						<div class="col-sm-10">
							<input type="string" class="form-control" name="bloodGroup" id="bloodGroup"
								placeholder="A+" value="<%= patient.getBloodGroup() %>">
						</div>
					</div>
					<h4 class="sub-header">Account Information</h4>
					<div class="form-group">
						<label for="userName" class="col-sm-2 control-label">User
							Name</label>
						<div class="col-sm-10">
							<input type="string" class="form-control" id="userName"
								placeholder="rakeshsharma" value="<%= patient.getUserName() %>">
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-2 control-label">Password</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" name="password" id="password"
								placeholder="password">
						</div>
					</div>
				<!-- 	<div class="form-group">
						<label for="emailAddress" class="col-sm-2 control-label">Email
							Address</label>
						<div class="col-sm-10">
							<input type="string" class="form-control" id="emailAddress"
								placeholder="rakeshsharma.y15@gmail.com" value="">
						</div>
					</div>-->
					<div class="form-group">
						<div class="col-sm-offset-6 col-sm-2">
							<button type="submit" class="btn btn-default">Submit</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>