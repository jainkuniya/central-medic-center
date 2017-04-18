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
<title>Sign Up - Central Medic Center</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/signup.css">
</head>
<body>
	<br>
	<br>
	<h1><center>Central Medic Center</center> </h1>
	<div class="container">
        <form class="form-horizontal form-signup" role="form">
            <h2 class="form-signin-heading"><center>Please register</center></h2>
            <br>
            <div class="form-group">
                <label for="firstName" class="col-sm-3 control-label">First Name</label>
                <div class="col-sm-9">
                    <input type="text" id="firstName" placeholder="First Name" class="form-control" autofocus>
                    <span class="help-block">First Name, eg.: Shubham, Vishwesh, Vishal</span>
                </div>
            </div>
            <div class="form-group">
                <label for="lastName" class="col-sm-3 control-label">Last Name</label>
                <div class="col-sm-9">
                    <input type="text" id="lastName" placeholder="Last Name" class="form-control" autofocus>
                </div>
            </div>
            <div class="form-group">
                <label for="username" class="col-sm-3 control-label">Username</label>
                <div class="col-sm-9">
                    <input type="username" id="username" placeholder="Username" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-3 control-label">Password</label>
                <div class="col-sm-9">
                    <input type="password" id="password" placeholder="Password" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label for="birthDate" class="col-sm-3 control-label">Date of Birth</label>
                <div class="col-sm-9">
                    <input type="date" id="birthDate" class="form-control">
                </div>
            </div>
            
            <div class="form-group">
                <label class="control-label col-sm-3">Gender</label>
                <div class="col-sm-6">
                    <div class="row">
                        <div class="col-sm-4">
                            <label class="radio-inline">
                                <input type="radio" id="femaleRadio" value="Female">Female
                            </label>
                        </div>
                        <div class="col-sm-4">
                            <label class="radio-inline">
                                <input type="radio" id="maleRadio" value="Male">Male
                            </label>
                        </div>
                        <div class="col-sm-4">
                            <label class="radio-inline">
                                <input type="radio" id="uncknownRadio" value="Unknown">Unknown
                            </label>
                        </div>
                    </div>
                </div>
            </div> 
            <div class="form-group">
                <label for="address" class="col-sm-3 control-label">Address</label>
                <div class="col-sm-9">
                    <input type="address" id="address" placeholder="BH3, The LNMIIT, Jaipur" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label for="number" class="col-sm-3 control-label">Phone Number</label>
                <div class="col-sm-9">
                    <input type="number" id="number" placeholder="9521113802" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label for="userType" class="col-sm-3 control-label">User Type</label>
                <div class="col-sm-9">
                    <select id="userType" name="userType" class="form-control">
                        <option >Choose One</option>
                        <option value="Patient">Patient</option>
                        <option value="Doctor">Doctor</option>
                        <option value="Admin">Admin</option>
                    </select>
                </div>
            </div>
            
            <div id="Patient" style="display:none;">
                <div class="form-group">
                <label for="Height" class="col-sm-3 control-label">Height</label>
                <div class="col-sm-9">
                    <input type="number" id="height" placeholder="in cms" class="form-control">
                </div>
                </div>
                <div class="form-group">
                <label for="Weight" class="col-sm-3 control-label">Weight</label>
                <div class="col-sm-9">
                    <input type="number" id="weight" placeholder="in kgs" class="form-control">
                </div>
                </div>
                <div class="form-group">
                <label for="BloodGroup" class="col-sm-3 control-label">Blood Group</label>
                <div class="col-sm-9">
                    <input type="string" id="BloodGroup" placeholder="A+" class="form-control">
                </div>
                </div>
            </div>
            <div id="Doctor" style="display:none;">
                <div class="form-group">
                <label for="Degree" class="col-sm-3 control-label">Degree</label>
                <div class="col-sm-9">
                    <input type="string" id="Degree" placeholder="MBBS" class="form-control">
                </div>
                </div>
                <div class="form-group">
                <label for="Specialization" class="col-sm-3 control-label">Specialization</label>
                <div class="col-sm-9">
                    <input type="string" id="Specialization" placeholder="Cardiologist" class="form-control">
                </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-9 col-sm-offset-3">
                    <button type="submit" class="btn btn-primary btn-block">Register</button>
                </div>
            </div>
        </form> <!-- /form -->
    </div> <!-- ./container -->

    <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
                $('#userType').on('change',function(){
                var selection = $(this).val();
                switch(selection){
                case "Patient":
                $("#Patient").show()
                $("#Doctor").hide()
                $("#Admin").hide()
                break;
                case "Doctor":
                $("#Patient").hide()
                $("#Doctor").show()
                $("#Admin").hide()
                break;
                case "Admin":
                $("#Patient").hide()
                $("#Doctor").hide()
                $("#Admin").show()
                break;
                default:
                $("#Patient").hide()
                $("#Doctor").hide()
                $("#Admin").hide()
                }
            });
    </script>
</body>
</html>
<% 
}
%>