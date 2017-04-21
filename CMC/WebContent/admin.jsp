
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="staff.modal.Staff, patient.modal.Patient, staff.modal.Doctor, java.util.ArrayList, modal.Appointment"%>
<%  
		if(request.getAttribute("admin")==null || request.getAttribute("doctors")==null 
			|| request.getAttribute("patients")==null || request.getAttribute("appointments") == null
			|| request.getAttribute("staffs")==null){
			 response.sendRedirect("admin"); 
		}
		else{
			Staff admin = (Staff)request.getAttribute("admin");
			ArrayList<Doctor> doctors = (ArrayList<Doctor>)request.getAttribute("doctors");
			ArrayList<Patient> patients = (ArrayList<Patient>)request.getAttribute("patients");
			ArrayList<Appointment> appointments = (ArrayList<Appointment>)request.getAttribute("appointments");
			ArrayList<Staff> staffs = (ArrayList<Staff>)request.getAttribute("staffs");
	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Dashboard - Central Medic Center</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/dashboard.css">
<link rel="stylesheet" href="css/patient.css">
<link rel="stylesheet" href="css/lab.css">

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
				<a class="navbar-brand" href="admin">Central Medic Center</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="#">Dashboard</a></li>
					<li><a href="updateAdminProfile">Edit Profile</a>
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
									<img class="profilePic" src="media/admin.png">
								</div>
							</div>
							<div class="col-sm-12 col-md-6 col-lg-8 info">
								<br> <span class="name"><%= admin.getFirstName() +" " + admin.getLastName() %></span><br>
								<img src="media/gender.png"><span class="details">
									<%= admin.getGender() +", " + admin.getAge() %></span><br> <img
									src="media/degree.png"><span class="degree"> Admin</span><br>
								<img src="media/Location.png"><span class="location">
									<%= admin.getAddress() %></span>
							</div>
						</div>

					</li>
					<li class="labReports activeReports" id="openHome">Home</li>
					<li class="labReports" id="openPatients">Patients</li>
					<li class="labReports" id="openDoctors">Doctors</li>
					<li class="labReports" id="openStaff">Staff</li>
					<li class="labReports" id="openAppointments">Appointments</li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 main" id="home">
				<h1 class="page-header">Dashboard</h1>
				<div class="row">
					<div class="col-sm-3">
						<div class="card">
							<div class="cardImage">
								<img src="media/patient.png">
							</div>
							<div class="cardText"><%=patients.size() %> Patients</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="card">
							<div class="cardImage">
								<img src="media/doctor.png" style="width:128px">
							</div>
							<div class="cardText"><%=doctors.size() %> Doctors</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="card">
							<div class="cardImage">
								<img src="media/admin.png">
							</div>
							<div class="cardText"><%=staffs.size() %> Staff</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="card">
							<div class="cardImage">
								<img src="media/appointment.png">
							</div>
							<div class="cardText"><%=appointments.size() %> Appointments</div>
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
			<div class="col-sm-9 col-sm-offset-3 main" id="patients" style="display: none;">
				<table class="table table-striped table-hover">
					<thead>
					  <tr>
					    <th>Id</th>
					    <th>username</th>
					    <th>First name</th>
					    <th>last name</th>
					    <th>Date of Birth</th>
					    <th>Gender</th>
					    <th>Address</th>
					    <th>Contact Number</th>
					    <th>Height</th>
					    <th>Weight</th>
					    <th>Blood Group</th>
					  </tr>
					 </thead>
					 <tbody>
					  <% for(int i=0; i<patients.size(); i++){
						  Patient person = patients.get(i);
						  %>
					  <tr>
					    <td><%= person.getId() %></td>
					    <td><%= person.getUserName() %></td>
					    <td><%= person.getFirstName() %></td>
					    <td><%= person.getLastName() %></td>
					    <td><%= person.getStringDob() %></td>
					    <td><%= person.getGender() %></td>
					    <td><%= person.getAddress() %></td>
					    <td><%= person.getContactNumber() %></td>
					    <td><%= person.getHeight() %></td>
					    <td><%= person.getWeight() %></td>
					    <td><%= person.getBloodGroup() %></td>
					  </tr>
					  <%} %>
					 </tbody>
				</table>
			</div>
			<div class="col-sm-9 col-sm-offset-3 main" id="doctors" style="display: none;">
				<table class="table table-striped table-hover">
					<thead>
					  <tr>
					    <th>Id</th>
					    <th>username</th>
					    <th>First name</th>
					    <th>last name</th>
					    <th>Date of Birth</th>
					    <th>Gender</th>
					    <th>Address</th>
					    <th>Contact Number</th>
					    <th>Degree</th>
					    <th>Specialization</th>
					  </tr>
					 </thead>
					 <tbody>
					  <% for(int i=0; i<doctors.size(); i++){
						  Doctor person = doctors.get(i);
						  %>
					  <tr>
					    <td><%= person.getId() %></td>
					    <td><%= person.getUserName() %></td>
					    <td><%= person.getFirstName() %></td>
					    <td><%= person.getLastName() %></td>
					    <td><%= person.getStringDob() %></td>
					    <td><%= person.getGender() %></td>
					    <td><%= person.getAddress() %></td>
					    <td><%= person.getContactNumber() %></td>
					    <td><%= person.getDegree() %></td>
					    <td><%= person.getSpecialization() %></td>
					  </tr>
					  <%} %>
					 </tbody>
				</table>
			</div>
			<div class="col-sm-9 col-sm-offset-3 main" id="staffs" style="display: none;">
				<table class="table table-striped table-hover">
					<thead>
					  <tr>
					    <th>Id</th>
					    <th>username</th>
					    <th>First name</th>
					    <th>last name</th>
					    <th>Date of Birth</th>
					    <th>Gender</th>
					    <th>Address</th>
					    <th>Contact Number</th>
					    <th>Designation</th>
					  </tr>
					 </thead>
					 <tbody>
					  <% for(int i=0; i<staffs.size(); i++){
						  Staff person = staffs.get(i);
						  %>
					  <tr>
					    <td><%= person.getId() %></td>
					    <td><%= person.getUserName() %></td>
					    <td><%= person.getFirstName() %></td>
					    <td><%= person.getLastName() %></td>
					    <td><%= person.getStringDob() %></td>
					    <td><%= person.getGender() %></td>
					    <td><%= person.getAddress() %></td>
					    <td><%= person.getContactNumber() %></td>
					    <td>
					    	<% if(person.getUserType()==3){ %>
					    		Admin
					    	<%}else if(person.getUserType()==4){ %>
					    		Lab Person
					    	<%}else if(person.getUserType()==5){ %>
					    		Receptionist
					    	<%} %>	
					    </td>
					  </tr>
					  <%} %>
					 </tbody>
				</table>
			</div>
			<div class="col-sm-9 col-sm-offset-3 main" id="appointments" style="display: none;">
				<table class="table table-striped table-hover">
					<thead>
					  <tr>
					    <th>Id</th>
					    <th>Title</th>
					    <th>Doctor</th>
					    <th>Patient</th>
					    <th>Status</th>
					    <th>Preferred Date</th>
					    <th>Allocated Date</th>
					    <th>Date Created</th>
					    <th>Symptons</th>
					    <th>Disease</th>					    
					  </tr>
					 </thead>
					 <tbody>
					  <% for(int i=0; i<appointments.size(); i++){
						  Appointment appointment = appointments.get(i);
						  %>
					  <tr>
					    <td><%= appointment.getId() %></td>
					    <td><%= appointment.getTitle() %></td>
					    <% if( appointment.getDoctor() == null){ %>
					    <td>Not Allocated</td>
					    <%}else { %>
					    <td><%= appointment.getDoctor().getFirstName() %></td>
					    <%
					    }%>
					    
					    <td><%= appointment.getPatient().getFirstName() %></td>
					    <td>
					    	<% if(appointment.getIsClosed()==1){ %>
					    		Closed
					    	<%}else { %>
					    		In progress
					    	<%} %>	
					    </td>
					    <td><%= appointment.getStringPreferredDate() %></td>
					    <td><%= appointment.getStringAllocatedDate() %></td>
					    <td><%= appointment.getStringDateCreated() %></td>
					    <td><%= appointment.getSymptons() %></td>
					    <td><%= appointment.getDisease() %></td>
					  </tr>
					  <%} %>
					 </tbody>
				</table>
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
		<script type="text/javascript">
                $('#openPatients').on('click',function(){
                	$("#patients").show();
                	$("#doctors").hide();
                	$("#staffs").hide();
                	$("#home").hide();
                	$("#appointments").hide();
                	$("#openPatients").addClass("activeReports");
                	$("#openDoctors").addClass("notActiveReports");
                	$("#openStaff").addClass("notActiveReports");
                	$("#openAppointments").addClass("notActiveReports");
                	$("#openHome").addClass("notActiveReports");
            });
    </script>
	<script type="text/javascript">
	 $('#openDoctors').on('click',function(){
		     	$("#patients").hide();
		     	$("#doctors").show();
		     	$("#staffs").hide();
		     	$("#appointments").hide();
		     	$("#home").hide();
		     	$("#openPatients").addClass("notActiveReports");
		     	$("#openDoctors").addClass("activeReports");
		     	$("#openStaff").addClass("notActiveReports");
		     	$("#openAppointments").addClass("notActiveReports");
		     	$("#openHome").addClass("notActiveReports");
            });
    </script>
    <script type="text/javascript">
	 $('#openStaff').on('click',function(){
		     	$("#patients").hide();
		     	$("#doctors").hide();
		     	$("#staffs").show();
		     	$("#appointments").hide();
		     	$("#home").hide();
		     	$("#openPatients").addClass("notActiveReports");
		     	$("#openDoctors").addClass("notActiveReports");
		     	$("#openStaff").addClass("activeReports");
		     	$("#openAppointments").addClass("notActiveReports");
		     	$("#openHome").addClass("notActiveReports");
            });
    </script>
    <script type="text/javascript">
	 $('#openAppointments').on('click',function(){
		     	$("#patients").hide();
		     	$("#doctors").hide();
		     	$("#staffs").hide();
		     	$("#appointments").show();
		     	$("#home").hide();
		     	$("#openPatients").addClass("notActiveReports");
		     	$("#openDoctors").addClass("notActiveReports");
		     	$("#openStaff").addClass("notActiveReports");
		     	$("#openAppointments").addClass("activeReports");
		     	$("#openHome").addClass("notActiveReports");
            });
    </script>
     <script type="text/javascript">
	 $('#openHome').on('click',function(){
		     	$("#patients").hide();
		     	$("#doctors").hide();
		     	$("#staffs").hide();
		     	$("#appointments").hide();
		     	$("#home").show();
		     	$("#openPatients").addClass("notActiveReports");
		     	$("#openDoctors").addClass("notActiveReports");
		     	$("#openStaff").addClass("notActiveReports");
		     	$("#openAppointments").addClass("notActiveReports");
		     	$("#openHome").addClass("activeReports");
            });
    </script>
</body>
</html>
<%
		}
%>