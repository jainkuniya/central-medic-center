
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="staff.modal.Staff"%>
<%  
		if(request.getAttribute("labPerson")==null){
			 response.sendRedirect("labPerson"); 
		}
		else{
			Staff labPerson = (Staff)request.getAttribute("labPerson");
	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LabPerson Dashboard - Central Medic Center</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/dashboard.css">
<link rel="stylesheet" href="css/patient.css">

</head>
<body>


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
				<a class="navbar-brand" href="labPerson">Central Medic Center</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="#">Dashboard</a></li>
					<li><a href="updateLabPersonProfile">Edit Profile</a>
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
									<img class="profilePic" src="media/labPerson.png">
								</div>
							</div>
							<div class="col-sm-12 col-md-6 col-lg-8 info">
								<br> <span class="name"><%= labPerson.getFirstName() +" " + labPerson.getLastName() %></span><br>
								<img src="media/gender.png"><span class="details">
									<%= labPerson.getGender() +", " + labPerson.getAge() %></span><br> <img
									src="media/degree.png"><span class="degree"> LabPerson</span><br>
								<img src="media/Location.png"><span class="location">
									<%= labPerson.getAddress() %></span>
							</div>
						</div>

					</li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 main">
				<h1 class="page-header">Dashboard</h1>
				<div class="row">
					<div class="col-sm-3">
						<div class="card">
							<div class="cardImage">
								<img src="media/appointment.png">
							</div>
							<div class="cardText">4 Appointments</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="card">
							<div class="cardImage">
								<img src="media/bmi.png">
							</div>
							<div class="cardText">BMI : 19</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="card">
							<div class="cardImage">
								<img src="media/prescription.png">
							</div>
							<div class="cardText">4 Medicines</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="card">
							<div class="cardImage">
								<img src="media/edit.png">
							</div>
							<div class="cardText">90% Profile</div>
						</div>
					</div>
				</div>
				<h2 class="sub-header">Section title</h2>
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
<%
		}
%>