
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="patient.modal.Patient, java.util.ArrayList, modal.Appointment, staff.modal.Doctor, patient.modal.DashBoard"%>
<%  
		if(request.getAttribute("doctor")==null || request.getAttribute("appointments")==null){
			 response.sendRedirect("doctor"); 
		}
		else{
			Doctor doctor = (Doctor)request.getAttribute("doctor");
			ArrayList<ArrayList<Appointment>> arrayList = (ArrayList<ArrayList<Appointment>>)request.getAttribute("appointments");
			DashBoard dashBoard = (DashBoard)request.getAttribute("dashBoard"); 
	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Doctor Dashboard - Central Medic Center</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/dashboard.css">
<link rel="stylesheet" href="css/doctor.css">
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
									<img class="profilePic" src="media/doctor.png">
								</div>
							</div>
							<div class="col-sm-12 col-md-6 col-lg-8 info">
								<br> <span class="name"><%= doctor.getFirstName() +" " + doctor.getLastName() %></span><br>
								<img src="media/gender.png"><span class="details">
									<%= doctor.getGender() +", " + doctor.getAge() %></span><br> <img
									src="media/degree.png"><span class="blood"> <%= doctor.getDegree() %></span><br>
								<img src="media/specialization.png"><span class="location">
									<%= doctor.getSpecialization() %></span>
							</div>
						</div>

					</li>
					<li class="topic"><span class="upcoming">Upcoming
							Appointment</span> 
							<% 
								ArrayList<Appointment> upcomingAppointments = arrayList.get(0);
					        	for(int i=0; i<upcomingAppointments.size(); i++)
					        	{ Appointment appointment = upcomingAppointments.get(i);
		        			%>
							<form class="form-signin" action="doctorAppointmentDetails"
								method="post">
							<input type="hidden" class="form-control" name="appointmentId"
								value="<%= appointment.getId() %>" />
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
								</li>
							</ul>
						</form>
								<%  }
				        %>
				    </li>
					<li class="topic">Recent Appointment 
						<%
							ArrayList<Appointment> appointments2 = arrayList.get(1);
				        	for(int i=0; i<appointments2.size(); i++)
				        	{ Appointment appointment = appointments2.get(i);
	        			%>
						<form class="form-signin" action="doctorAppointmentDetails"
							method="post">
							<input type="hidden" class="form-control" name="appointmentId"
								value="<%= appointment.getId() %>" />
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
								</li>
							</ul>
						</form>
									<%  }
					        %>
					</li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 main">
				<h1 class="page-header">Dashboard</h1>
				<div class="row">
					<div class="col-sm-4">
						<div class="card">
							<div class="cardImage">
								<img src="media/appointment.png">
							</div>
							<div class="cardText"><%= dashBoard.getNoOfAppointment() %> Appointments</div>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="card">
							<div class="cardImage">
								<img src="media/patient.png">
							</div>
							<div class="cardText"><%= dashBoard.getPatientCount() %> Patients Treated</div>
						</div>
					</div>
<!-- 				<div class="col-sm-4">
						<div class="card">
							<div class="cardImage">
								<img src="media/prescription.png">
							</div>
							<div class="cardText">4 Medicines</div>
						</div>
					</div>-->
					<div class="col-sm-4">
						<div class="card">
							<div class="cardImage">
								<img src="media/edit.png">
							</div>
							<div class="cardText"><%= dashBoard.getPercentProfile() %>% Profile</div>
						</div>
					</div>
				</div>
				<br>
				<div class="row text-center">
					<div class="col-sm-12">
						<div class="panel panel-primary">
							<div class="panel-heading">
								Last Login
							</div>
							<div class="panel-body">
								<%= session.getAttribute("LastAccess") %>
							</div>
						</div>
					</div>
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