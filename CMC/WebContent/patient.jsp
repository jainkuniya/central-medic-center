
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="patient.modal.Patient, java.util.ArrayList, modal.Appointment"%>
	<%  
		if(request.getAttribute("patient")==null){
			 response.sendRedirect("patient"); 
		}
		else{
			Patient patient = (Patient)request.getAttribute("patient");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Patient Dashboard - Central Medic Center</title>
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
			<a class="navbar-brand" href="patient">Central Medic Center</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a href="#">Dashboard</a></li>
				<li><a href="updatePatientProfile">Edit Profile</a>
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
					<li class=""><a href="openBookAppointment">Book Appointment</a></li>
					<li class="topic">
						<span class="upcoming">Upcoming Appointment</span>
						<% ArrayList<Appointment> appointments = (ArrayList<Appointment>)request.getAttribute("appointments");
			        	for(int i=0; i<appointments.size(); i++)
			        	{ Appointment appointment = appointments.get(i);
	        			%>
	        			<form class="form-signin" action="patientAppointmentDetails" method="post">
	        			<input type="hidden" class="form-control" name="appointmentId" value="<%= appointment.getId() %>" />
					</li>
					<ul>
						<li class="subtopic">
							<button class="btn btn-default" type="submit">
							<div class="row">
								<div class="col-sm-12 text-left">
									<b>Title </b><br>
									Dr. Name | Date 
								</div>
							</div>
							</button>
							</form>
						</li>
					</ul>
					
						<%  }
	        %>
					<li class="topic">
						Recent Appointment
						<% ArrayList<Appointment> appointments2 = (ArrayList<Appointment>)request.getAttribute("appointments");
			        	for(int i=0; i<appointments2.size(); i++)
			        	{ Appointment appointment = appointments2.get(i);
	        			%>
	        			<form class="form-signin" action="patientAppointmentDetails" method="post">
	        			<input type="hidden" class="form-control" name="appointmentId" value="<%= appointment.getId() %>" />
					</li>
					<ul>
						<li class="subtopic">
							<button class="btn btn-default" type="submit">
							<div class="row">
								<div class="col-sm-12 text-left">
									<b><%= appointment.getSymptons() %> </b><br>
									Dr. Name | Date 
								</div>
							</div>
							</button>
							</form>
						</li>
					</ul>
					
						<%  }
	        %>

				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 main">
				<h1 class="page-header">Dashboard</h1>
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