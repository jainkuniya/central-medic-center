<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="staff.modal.Staff, java.util.ArrayList, prescription.Lab"%>
<%  
		if(request.getAttribute("labPerson")==null || request.getAttribute("labs")==null){
			 response.sendRedirect("labPerson"); 
		}
		else{
			Staff labPerson = (Staff)request.getAttribute("labPerson");
			ArrayList<ArrayList<Lab>> labs = (ArrayList<ArrayList<Lab>>)request.getAttribute("labs");
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
									<%= labPerson.getGender() +", " + labPerson.getAge() %></span><br>
								<img src="media/degree.png"><span class="degree">
									Lab Person</span><br> <img src="media/Location.png"><span
									class="location"> <%= labPerson.getAddress() %></span>
							</div>
						</div>

					</li>
					<li class="labReports activeReports" id="openLabReports">Open
						Lab Reports</li>
					<li class="labReports" id="closedLabReports">Closed Lab
						Reports</li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 main">
				<div class="row tableHere">
					<div class="col-sm-12">
						<div id="openLabs">
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th>Report Id :-</th>
										<th>Doctor Name</th>
										<th>Lab Name</th>
										<th>Test For</th>
										<th>Lab Result</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<% ArrayList<Lab> openLabs = labs.get(0);
											for(int i=0; i<openLabs.size(); i++) { 
												Lab lab = openLabs.get(i);
											%>
									<tr>
										<td class="padding-up"><%=lab.getLabId() %></td>
										<td class="padding-up"><%=lab.getDoctor().getFirstName() %></td>
										<td class="padding-up"><%=lab.getLabName() %></td>
										<td class="padding-up"><%=lab.getTestFor() %></td>
										<form action="submitLabReport" method="post">
											<input type="hidden" name="labId"
												value="<%= lab.getLabId() %>">
												<input type="hidden" name="itemId"
												value="<%= lab.getItemId() %>">
											<td><input type="text" class="form-control"
												placeholder="Result" name="result" required></td>
											<td><button type="submit" class="btn btn-default">Submit</button></td>
										</form>
									</tr>
									<% } %>
								</tbody>
							</table>
						</div>
						<div id="closedLabs" style="display: none;">
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th>Report Id :-</th>
										<th>Doctor Name</th>
										<th>Lab Name</th>
										<th>Test For</th>
										<th>Lab Result</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<% ArrayList<Lab> closedLabs = labs.get(1);
											for(int i=0; i<closedLabs.size(); i++) { 
												Lab lab = closedLabs.get(i);
											%>
									<tr>
										<td><%=lab.getLabId() %></td>
										<td><%=lab.getDoctor().getFirstName() %></td>
										<td><%=lab.getLabName() %></td>
										<td><%=lab.getTestFor() %></td>
										<td><%=lab.getLabResult() %></td>
									</tr>
									<% } %>
								</tbody>
							</table>
						</div>
						</tbody>
						</table>
					</div>
				</div>
				<br>
				<div class="row text-center">
					<div class="col-sm-12">
						<div class="panel panel-primary">
							<div class="panel-heading">Last Login</div>
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
	<script type="text/javascript">
                $('#closedLabReports').on('click',function(){
                	$("#closedLabs").show();
                	$("#openLabs").hide();
                	$("#closedLabReports").toggleClass("activeReports");
                	$("#openLabReports").toggleClass("notActiveReports");
            });
    </script>
	<script type="text/javascript">
                $('#openLabReports').on('click',function(){
                	$("#closedLabs").hide();
                	$("#openLabs").show();
                	$("#closedLabReports").toggleClass("notActiveReports");
                	$("#openLabReports").toggleClass("activeReports");
            });
    </script>
</body>
</html>
<%
		}
%>