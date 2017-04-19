<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="patient.modal.Patient, java.util.ArrayList, modal.Appointment, modal.Appointment, modal.AppointmentItems, staff.modal.Doctor"%>
		
	<%  
		if(request.getAttribute("doctor")==null || request.getAttribute("appointments")==null || request.getAttribute("apointment") == null){
			 response.sendRedirect("doctor"); 
		}
		else{
			Doctor doctor = (Doctor)request.getAttribute("doctor");
			ArrayList<ArrayList<Appointment>> arrayList = (ArrayList<ArrayList<Appointment>>)request.getAttribute("appointments");
			Appointment detailedAppointment = ((Appointment)request.getAttribute("apointment"));
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
<link rel="stylesheet" href="css/appointment.css">
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
				<li><a href="patient">Dashboard</a></li>
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
					<li class="topic"><span class="upcoming">Upcoming
							Appointment</span> <% ArrayList<Appointment> upcomingAppointments = arrayList.get(0);
			        	for(int i=0; i<upcomingAppointments.size(); i++)
			        	{ Appointment appointment = upcomingAppointments.get(i);
	        			%>
						<form class="form-signin" action="doctorAppointmentDetails"
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
						<form class="form-signin" action="doctorAppointmentDetails"
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
				<h1 class="page-header"><%= detailedAppointment.getTitle() %></h1>
				<div class="content">
					<div class="row ">
						<div class="col-sm-3">
						<b>Appointment ID: <%= detailedAppointment.getId() %></b>
						</div>
						<div class="col-sm-5">
						<b>Doctor Name: </b> 
						<% if(detailedAppointment.getDoctor()!=null) { %>
							<%= detailedAppointment.getDoctor().getFirstName() + " " + detailedAppointment.getDoctor().getLastName() %>
							<% }else{ %>
							Wating for doctor approval
						<% } %>
						</div>
						<div class="col-sm-4">
						<b>Date Created:</b> <%= detailedAppointment.getStringDateCreated() %>
						</div>
					</div>
					<br>
					<div class="row ">
						<div class="col-sm-8">
						<b>Symptons: </b> <%= detailedAppointment.getSymptons() %>
						</div>
						<div class="col-sm-4">
						<b>Suspected Disease </b><%= detailedAppointment.getDisease() %>
						</div>
					</div>
				</div>
				<% if(detailedAppointment.getItems()!=null) {%>
				<% for(int i=0; i<detailedAppointment.getItems().size(); i++) { 
					AppointmentItems item = detailedAppointment.getItems().get(i);
				%>
				<div class="content" style="">
					<div class="row ">
						<div class="col-sm-2">
							<div class="messageFrom">
								<% if(item.getType()==1){ 	%>
								<%= detailedAppointment.getPatient().getFirstName() %>
								
								<%}else if(item.getType()==2) {%>
								You
								<% }else if(item.getType()==6) { %>
								System
								<% } %>
							</div>
						</div>
						<div class="col-sm-10">
							<div class="message">
								<%= item.getDescription() %>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-10">
						</div>
						<div class="col-sm-2">
							<div class="" style="font-size:11px;">
								<%= item.getStringDate() %>
							</div>
						</div>
					</div>
				</div>
				<% } }%>
				<div class="">
					<form class="form-inline" action="newAppointmentItem" method="post">
					<div class="row ">
						<input type="hidden" name="type" value="1" />
						<input type="hidden" name="requestDispatcher" value="doctorAppointmentDetails" />
						<input type="hidden" name="appointmentId" value="<%= detailedAppointment.getId()%>" />
						<div class="col-sm-9 form-group">
							<label class="sr-only" for="exampleInputEmail3">Email address</label>
						    <textarea class="form-control textman" name="description" rows="3", placeholder="Type your message here"></textarea>
						</div>
						<div class="col-sm-3">
						  	<button type="submit" class="send btn btn-success">Send</button>
						</div>
					</div>
					</form>
				</div>
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