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
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Profile - Doctor Dashboard - Central Medic Center</title>
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
					<li><a href="doctor">Dashboard</a></li>
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
				<h1 class="page-header" style="text-align: center">
					 Edit Profile 
				</h1>
				<h4 class="sub-header">Personal Information</h4>
				<form class="form-horizontal" action="editDoctorProfile"
					method="post">
					<div class="form-group">
						<label for="firstName" class="col-sm-2 control-label">First
							Name</label>
						<div class="col-sm-10">
							<p class="form-control-static"><%= doctor.getFirstName() %></p>
						</div>
					</div>
					<div class="form-group">
						<label for="lastName" class="col-sm-2 control-label">Last
							Name</label>
						<div class="col-sm-10">
							<p class="form-control-static"><%= doctor.getLastName() %></p>
						</div>
					</div>
					<div class="form-group">
						<label for="gender" class="col-sm-2 control-label">Gender</label>
						<div class="col-sm-10">
							<p class="form-control-static"><%= doctor.getGender() %></p>
						</div>
					</div>
					<div class="form-group">
						<label for="date" class="col-sm-2 control-label">Date Of
							Birth</label>
						<div class="col-sm-10">
							<input type="date" class="form-control" name="dob" id="date"
								placeholder="Date" value="<%= doctor.getStringDob() %>">
						</div>
					</div>
					<div class="form-group">
						<label for="phoneNumber" class="col-sm-2 control-label">Phone
							Number</label>
						<div class="col-sm-10">
							<input type="tel" class="form-control"
								name="contactNumber" id="phoneNumber"
								placeholder="+91 9521113802"
								value="<%= doctor.getContactNumber() %>">
						</div>
					</div>
					<div class="form-group">
						<label for="address" class="col-sm-2 control-label">Address</label>
						<div class="col-sm-10">
							<textarea class="form-control" rows="2" name="address"
								placeholder="BH-3, The LNMIIT"> <%= doctor.getAddress() %></textarea>
						</div>
					</div>
					<h4 class="sub-header">Medical Information</h4>
					<div class="form-group">
						<label for="dgree" class="col-sm-2 control-label">Degree</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="degree" id="degree"
								placeholder="MBBS etc." value="<%= doctor.getDegree() %>">
						</div>
					</div>
					<div class="form-group">
						<label for="specialization" class="col-sm-2 control-label">Specialization</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="specialization"
								id="specialization" placeholder="Dermatalogist etc."
								value="<%= doctor.getSpecialization() %>">
						</div>
					</div>
					<h4 class="sub-header">Account Information</h4>
					<div class="form-group">
						<label for="userName" class="col-sm-2 control-label">User
							Name</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="userName"
								placeholder="rakeshsharma" value="<%= doctor.getUserName() %>">
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-2 control-label">Password</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" name="password"
								id="password" placeholder="password">
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
<%
		}
%>