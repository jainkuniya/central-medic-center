<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Login - Central Medic Center</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="css/login.css">	
</head>
<body>
	<div class="wrapper">
    	<form class="form-signin">       
      	<h2 class="form-signin-heading">Please login</h2>
      	<input type="text" class="form-control" name="username" placeholder="Email Address" required="" autofocus="" />
      	<input type="password" class="form-control" name="password" placeholder="Password" required=""/>      
      	<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>   
    	</form>
	</div>
</body>
</html>