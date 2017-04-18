<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.io.*,java.util.*"%>
<%
 
if (!session.isNew() && session.getAttribute("UserID")!=null){
   Date lastAccessTime = new Date(session.getLastAccessedTime());
   session.setAttribute("LastAccess", lastAccessTime);
   String type = (String) session.getAttribute("UserType");
 
  if(type.equals("patient")){
	   response.sendRedirect("patient"); 
   }
   else if(type.equals("doctor")){
	   response.sendRedirect("doctor"); 
   }
  
 }
else{
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login - Central Medic Center</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/login.css">
</head>
<body>
	<br>
	<br>
	<h1><center>Central Medic Center</center> </h1>
	<div class="wrapper">
		<form class="form-signin" action="login" method="post">
			<h2 class="form-signin-heading"><center>Please login</center></h2>
			<br>
			<input type="text" class="form-control" name="username"
				placeholder="Username" required="true" autofocus="" /> 
			<br>
			<input
				type="password" class="form-control" name="password"
				placeholder="Password" required="true" />
			<%
		    String message = (String)request.getAttribute("error");
		    if (message!=null) {
		  %>
			<h4><%= message %></h4>
			<%
		    } 
		 %>
		 	<br>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
		</form>
	</div>
</body>
</html>
<% 
}
%>