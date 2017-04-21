<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="patient.modal.Patient, java.util.ArrayList, modal.Appointment, staff.modal.Doctor, utils.DateUtils"%>

<!DOCTYPE html>
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
					<li><a href="updatePatientProfile">Edit Profile</a></li>
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
					<% ArrayList<ArrayList<Appointment>> arrayList = (ArrayList<ArrayList<Appointment>>)request.getAttribute("appointments"); %>
					<li class=""><a href="openBookAppointment">Book
							Appointment</a></li>
					<li class="topic"><span class="upcoming">Upcoming
							Appointment</span> <% ArrayList<Appointment> appointments = arrayList.get(0);
			        	for(int i=0; i<appointments.size(); i++)
			        	{ Appointment appointment = appointments.get(i);
	        			%>
						<form class="form-signin" action="patientAppointmentDetails"
							method="post">
							<input type="hidden" class="form-control" name="appointmentId"
								value="<%= appointment.getId() %>" />
							<ul>
								<li class="subtopic">
									<button class="btn btn-default" type="submit">
										<div class="row">
											<div class="col-sm-12 text-left">
												<div>
													<b><%= appointment.getTitle() %> </b><br>
													<% Doctor doctor = appointment.getDoctor();
												if(doctor==null){
											%>Wating for doctor approval
													<% }else{ %>
													<%= doctor.getFirstName() %>
													<% } %>
													|
													<%= appointment.getStringDateCreated() %>
												</div>
											</div>
										</div>
									</button>
								</li>
							</ul>
						</form>

								<%  }
						        	
				        %>
				    </li>
					<li class="topic">Recent Appointment <% ArrayList<Appointment> appointments2 = arrayList.get(1);
			        	for(int i=0; i<appointments2.size(); i++)
			        	{ Appointment appointment = appointments2.get(i);
	        			%>
						<form class="form-signin" action="patientAppointmentDetails"
							method="post">
							<input type="hidden" class="form-control" name="appointmentId"
								value="<%= appointment.getId() %>" /> 
								<ul>
									<li class="subtopic">
										<button class="btn btn-default" type="submit">
											<div class="row">
												<div class="col-sm-12 text-left">
													<b><%= appointment.getTitle() %> </b><br>
													<% Doctor doctor = appointment.getDoctor();
													if(doctor==null){
												%>Wating for doctor approval
													<% }else{ %>
													<%= doctor.getFirstName() %>
													<% } %>
													|
													<%= appointment.getStringDateCreated() %>
												</div>
											</div>
										</button>
									</li>
								</ul>
							</form>
									<%  }
					        %>
					</li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 main">
				<h1 class="page-header">Book Appointment</h1>
				<form class="form-horizontal" method="post" action="bookAppointment">
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">Patient
							Name</label>
						<div class="col-sm-10">
							<p class="form-control-static"><%= patient.getFirstName() +" " + patient.getLastName() %></p>
							<input type="hidden" name="patientId" value="1">
						</div>
					</div>
					<div class="form-group">
						<label for="title" class="col-sm-2 control-label">Appointment
							Title</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="date"
								placeholder="Acute Stomach Ache" name="title" required>
						</div>
					</div>
					<div class="form-group">
						<label for="date" class="col-sm-2 control-label">Preferred
							Date of Appointment</label>
						<div class="col-sm-10">
							<input type="date" class="form-control" id="date"
								placeholder="Date" name="preferredDate"
								value="<%= DateUtils.getStringFromDate(System.currentTimeMillis()) %>">
						</div>
					</div>
					<div class="form-group">
						<label for="symptons" class="col-sm-2 control-label">Symptoms</label>
						<div class="col-sm-10">
							<textarea class="form-control" rows="2"
								placeholder="chest pain, fatigue, hallucination, swelling"
								name="symptons"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="disease" class="col-sm-2 control-label">Suspected
							Disease</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="disease"
								placeholder="Tuberculosis, Malaria, Acne, Diarrhea"
								name="disease">
						</div>
					</div>
					<div class="form-group">
						<label for="Documents" class="col-sm-2 control-label">Medical
							Documents</label>
						<div class="col-sm-10">
							<input type="file" id="Documents">
							<p class="help-block">Upload relevant documents here for
								better care.</p>
						</div>
					</div>
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