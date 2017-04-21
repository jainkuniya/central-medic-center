	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<%@ page
		import="patient.modal.Patient, java.util.ArrayList, modal.Appointment, modal.Appointment, modal.AppointmentItems, staff.modal.Doctor, prescription.Lab, prescription.Prescription"%>
	
	<%
	if (request.getAttribute("patient") == null || request.getAttribute("appointments") == null
			|| request.getAttribute("apointment") == null) {
		response.sendRedirect("patient");
	} else {
		Patient patient = (Patient) request.getAttribute("patient");
		ArrayList<ArrayList<Appointment>> arrayList = (ArrayList<ArrayList<Appointment>>) request
				.getAttribute("appointments");
		Appointment detailedAppointment = ((Appointment) request.getAttribute("apointment"));
		ArrayList<Prescription> prescriptions = (ArrayList<Prescription>)request.getAttribute("prescriptions");
		ArrayList<Lab> labs = (ArrayList<Lab>)request.getAttribute("labs");
	%>
	
	<!DOCTYPE html>
	<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Patient Appointment Dashboard - Central Medic Center</title>
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
										<br> <span class="name"><%=patient.getFirstName() + " " + patient.getLastName()%></span><br>
									<img src="media/gender.png"><span class="details">
										<%=patient.getGender() + ", " + patient.getAge()%></span><br> <img
										src="media/bloodGroup.png"><span class="blood"> <%=patient.getBloodGroup()%></span><br>
									<img src="media/Location.png"><span class="location">
										<%=patient.getAddress()%></span>
								</div>
							</div>
						</li>
						
						<li class=""><a href="openBookAppointment">Book
								Appointment</a></li>
						<li class="topic"><span class="upcoming">Upcoming
												Appointment</span> 
							<%
								ArrayList<Appointment> upcomingAppointments = arrayList.get(0);
									for (int i = 0; i < upcomingAppointments.size(); i++) {
										Appointment upcomingAppointment = upcomingAppointments.get(i);
							%>
							<form class="form-signin" action="patientAppointmentDetails"
								method="post">
								<input type="hidden" class="form-control" name="appointmentId"
									value="<%=upcomingAppointment.getId()%>" />
								<ul>
									<li class="subtopic">
										<%
									if (detailedAppointment.getId() == upcomingAppointment.getId()) {
								%>
										<button class="btn btn-default activeAppointment" type="submit">
											<%
										} else {
									%>
											<button class="btn btn-default " type="submit">
												<%
											}
										%>
												<div class="row">
													<div class="col-sm-12 text-left">
														<b><%=upcomingAppointment.getTitle()%> </b><br>
														<%
													Doctor doctor2 = upcomingAppointment.getDoctor();
															if (doctor2 == null) {
												%>Wating for doctor approval
														<%
													} else {
												%>
														<%=doctor2.getFirstName()%>
														<%
													}
												%>
														|
														<%=upcomingAppointment.getStringDateCreated()%>
													</div>
												</div>
											</button>
										</li>
									</ul>
								</form>
		
					<%
							}
						%>
					</li>
					<li class="topic">Recent Appointment <%
							ArrayList<Appointment> recentAppointments = arrayList.get(1);
								for (int i = 0; i < recentAppointments.size(); i++) {
									Appointment recentAppointment = recentAppointments.get(i);
						%>
						
						<form class="form-signin" action="patientAppointmentDetails"
							method="post">
							<input type="hidden" class="form-control" name="appointmentId"
								value="<%=recentAppointment.getId()%>" />
							<ul>
								<li class="subtopic">
									<%
											if (detailedAppointment.getId() == recentAppointment.getId()) {
										%>
									<button class="btn btn-default activeAppointment" type="submit">
										<%
												} else {
											%>
										<button class="btn btn-default " type="submit">
											<%
													}
												%>
											<div class="row">
												<div class="col-sm-12 text-left">
													<b><%=recentAppointment.getTitle()%> </b><br>
													<%
															Doctor doctor1 = recentAppointment.getDoctor();
																	if (doctor1 == null) {
														%>Wating for doctor approval
													<%
															} else {
														%>
													<%=doctor1.getFirstName()%>
													<%
															}
														%>
													|
													<%=recentAppointment.getStringDateCreated()%>
												</div>
											</div>
										</button>
									</li>
								</ul>
							</form>
								<%
										}
									%>
					</li>
				</ul>
			</div>
			
			<div class="col-sm-9 col-sm-offset-3 main">
				<h1 class="page-header"><%=detailedAppointment.getTitle()%></h1>
				<div class="content">
					<div class="row ">
						<div class="col-sm-3">
							<b>Appointment ID: <%=detailedAppointment.getId()%></b>
						</div>
						<div class="col-sm-5">
							<b>Doctor Name: </b>
							<%
								if (detailedAppointment.getDoctor() != null) {
							%>
							<%=detailedAppointment.getDoctor().getFirstName() + " "
							+ detailedAppointment.getDoctor().getLastName()%>
							<%
								} else {
							%>
							Wating for doctor approval
							<%
								}
							%>
						</div>
						<div class="col-sm-4">
							<b>Date Created:</b>
							<%=detailedAppointment.getStringDateCreated()%>
						</div>
					</div>
					<br>
					<div class="row ">
						<div class="col-sm-8">
							<b>Symptons: </b>
							<%=detailedAppointment.getSymptons()%>
						</div>
						<div class="col-sm-4">
							<b>Suspected Disease </b><%=detailedAppointment.getDisease()%>
						</div>
					</div>
					<br>
					<% if(detailedAppointment.getIsClosed()==0){ %>
						<div class="row">
							<form method="post" action="closeAppointment">
							<input type="hidden" name="appointmentId" value="<%=detailedAppointment.getId() %>" >
							<input
									type="hidden" name="by"
									value="<%="By patient: - " + patient.getFirstName() %>" /> 
							<input
									type="hidden" name="requestDispatcher"
									value="patientAppointmentDetails" /> 
							<button type="submit" class="send btn btn-success">Close</button>
						</form>
						</div>
					<%}else { %>
						<h3 style="text-align:center">Closed</h3>
					<% } %>
				</div>
				<%
					if (detailedAppointment.getItems() != null) {
				%>
				<%
					for (int i = 0; i < detailedAppointment.getItems().size(); i++) {
								AppointmentItems item = detailedAppointment.getItems().get(i);
				%>
				<div class="content" style="">
					<div class="row ">
						<div class="col-sm-2">
							<div class="messageFrom">
								<% if(item.getType()==1){ 	%>
								<%= detailedAppointment.getDoctor().getFirstName() %>
								<%}else if(item.getType()==2) {%>
								You
								<% }else if(item.getType()==3) { %>
								<%= detailedAppointment.getDoctor().getFirstName() %> -> Prescription 
								<%}else if(item.getType()==4) {%>
								Lab Report -><% for(int k = 0; k< labs.size(); k++){ 
										if(labs.get(k).getItemId() == item.getItemId()){ %>
											<%= labs.get(k).getLabName() %>											
									<%	} } %>
								<% }else if(item.getType()==5) { %>
								<%= detailedAppointment.getDoctor().getFirstName() %>
								<%}else if(item.getType()==6) {%>
								System
								<% } %>
							</div>
						</div>
						<div class="col-sm-10">
							<div class="message">
								<%if(item.getType()==1 || item.getType()==2 || item.getType()==5 || item.getType()==6){ %>
								<%= item.getDescription() %>
								<%}else if(item.getType()==3) {%>
								<% for(int k = 0; k< prescriptions.size(); k++){ 
										if(prescriptions.get(k).getItemId() == item.getItemId()){ %>
											<div>Take <%= prescriptions.get(k).getQuantity() %> <b><%= prescriptions.get(k).getMedicineName() %></b> <%= prescriptions.get(k).getTimes() %> times a day.</div>											
									<%	} } %>
								<%}else if(item.getType()==4) {%>
								<% for(int k = 0; k< labs.size(); k++){ 
										if(labs.get(k).getItemId() == item.getItemId()){ %>
											<div>Your lab result for <b><%= labs.get(k).getTestFor() %></b> is <b><%= labs.get(k).getLabResult() %></b>.</div>											
									<%	} } %>
								<%} %>
							</div>
						</div>
					</div>
	
					<div class="row">
						<div class="col-sm-10"></div>
						<div class="col-sm-2">
							<div class="" style="font-size: 11px;">
								<%=item.getStringDate()%>
							</div>
						</div>
					</div>
				</div>
				<%
					}
						}
				%>
				<% if(detailedAppointment.getIsClosed()==0){ %>
					<div class="">
						<form class="form-inline" action="newAppointmentItem" method="post">
							<div class="row">
								<input type="hidden" name="sendType" value="2" /> 
								<input
									type="hidden" name="requestDispatcher"
									value="patientAppointmentDetails" /> 
								<input type="hidden"
									name="appointmentId" value="<%=detailedAppointment.getId()%>" />
								<div class="col-sm-9 form-group">
									<textarea class="form-control textman" name="description"
										rows="3" placeholder="Type your message here"></textarea>
								</div>
								<div class="col-sm-3">
									<button type="submit" class="send btn btn-success">Send</button>
								</div>
							</div>
						</form>
					</div>
				<%} %>
			</div>
		</div>
	</div>
	
	<!-- Bootstrap core JavaScript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')
	</script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
	</html>
	<%
		}
	%>