
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="patient.modal.Patient, java.util.ArrayList, modal.Appointment, staff.modal.Doctor"%>
<%  
		if(request.getAttribute("doctor")==null || request.getAttribute("appointments")==null){
			 response.sendRedirect("doctor"); 
		}
		else{
			Doctor doctor = (Doctor)request.getAttribute("doctor");
			ArrayList<ArrayList<Appointment>> arrayList = (ArrayList<ArrayList<Appointment>>)request.getAttribute("appointments");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Doctor Dashboard - Central Medic Center</title>
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
				<li><a href="updateDoctorProfile">Edit Profile</a>
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
								<br> <span class="name"><%= doctor.getFirstName() +" " + doctor.getLastName() %></span><br>
								<img src="media/gender.png"><span class="details">
									<%= doctor.getGender() +", " + doctor.getAge() %></span><br> <img
									src="media/bloodGroup.png"><span class="blood"> <%= doctor.getDegree() %></span><br>
								<img src="media/Location.png"><span class="location">
									<%= doctor.getSpecialization() %></span>
							</div>
						</div>

					</li>
					<li class="topic"><span class="upcoming">Wating for approval
							</span> <% ArrayList<Appointment> uncomfirmedAppointments = arrayList.get(2);
			        	for(int i=0; i<uncomfirmedAppointments.size(); i++)
			        	{ Appointment appointment = uncomfirmedAppointments.get(i);
	        			%>
						<form class="form-signin" action="patientAppointmentDetails"
							method="post">
							<input type="hidden" class="form-control" name="appointmentId"
								value="<%= appointment.getId() %>" /></li>
					<ul>
						<li class="subtopic">
							<button class="btn btn-default" type="submit">
								<div class="row">
									<div class="col-sm-12 text-left">
										<b><%= appointment.getTitle() %> </b><br>
										<% Patient patient = appointment.getPatient();
										if(patient==null){
									%>Wating for doctor approval
										<% }else{ %>
										<%= patient.getFirstName() %>
										<% } %>
										|
										<%= appointment.getStringDateCreated() %>
									</div>
								</div>
							</button>
							</form>
						</li>
					</ul>

					<%  }
	        %>
					<li class="topic"><span class="upcoming">Upcoming
							Appointment</span> <% ArrayList<Appointment> upcomingAppointments = arrayList.get(0);
			        	for(int i=0; i<upcomingAppointments.size(); i++)
			        	{ Appointment appointment = upcomingAppointments.get(i);
	        			%>
						<form class="form-signin" action="patientAppointmentDetails"
							method="post">
							<input type="hidden" class="form-control" name="appointmentId"
								value="<%= appointment.getId() %>" /></li>
					<ul>
						<li class="subtopic">
							<button class="btn btn-default" type="submit">
								<div class="row">
									<div class="col-sm-12 text-left">
										<b><%= appointment.getTitle() %> </b><br>
										<% Patient patient = appointment.getPatient();
										if(patient==null){
									%>Wating for doctor approval
										<% }else{ %>
										<%= patient.getFirstName() %>
										<% } %>
										|
										<%= appointment.getStringDateCreated() %>
									</div>
								</div>
							</button>
							</form>
						</li>
					</ul>

					<%  }
	        %>
					<li class="topic">Recent Appointment <% ArrayList<Appointment> appointments2 = arrayList.get(1);
			        	for(int i=0; i<appointments2.size(); i++)
			        	{ Appointment appointment = appointments2.get(i);
	        			%>
						<form class="form-signin" action="patientAppointmentDetails"
							method="post">
							<input type="hidden" class="form-control" name="appointmentId"
								value="<%= appointment.getId() %>" /></li>
					<ul>
						<li class="subtopic">
							<button class="btn btn-default" type="submit">
								<div class="row">
									<div class="col-sm-12 text-left">
										<b><%= appointment.getTitle() %> </b><br>
										<% Patient patient = appointment.getPatient();
										if(patient==null){
									%>Wating for doctor approval
										<% }else{ %>
										<%= patient.getFirstName() %>
										<% } %>
										|
										<%= appointment.getStringDateCreated() %>
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