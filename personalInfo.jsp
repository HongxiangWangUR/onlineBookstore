<%@page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp"%>
<%@page import="dao.*,java.sql.*"%>
<%
Cookie[] cooks=request.getCookies();
boolean find=false;
String username="";
String password="";
for(Cookie c:cooks){
	if(c.getName().equals("userpass")){
		String userpass=c.getValue();
		String[] result=userpass.split("\\|");
		if(result==null || result.length!=2){
			continue;
		}else{
			username=result[0];
			password=result[1];
			login log=new login();
			if(log.loginCheck(username,password)){
				find=true;
				break;
			}else{
				continue;
			}
		}
	}
}
if(!find){
	request.getRequestDispatcher("index.jsp").forward(request,response);
}
%>
<!--HTML-->
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body style="background-color: #eee;">
	<!--Navbar-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
   <a class="navbar-brand" href="index.jsp">Bookstore</a>

   <div class="collapse navbar-collapse">
    <ul class="navbar-nav"  id="navbar_ul">
      <li class="nav-item">
        <a class="nav-link" href="books.jsp">Books</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="orders.jsp">My Orders</a>
      </li>
      <li class="nav-item">
        <a class="nav-link active" href="personalInfo.jsp">
        Change Personal Info
	    </a>
      </li>
    </ul>
  </div>
</nav>

<!-- personal info -->
<div class="card border-primary mb-3" style="width: 800px;margin:auto;">
  <div class="card-header">
    Hi <%=username%>, you can change your personal info below
    <input type="text" id="username" value="<%=username%>" style="display: none;"/>
  </div>
  <div class="card-body">
    <h5 class="card-title"><%=username%></h5>
    <div class="input-group mb-3">
	  <div class="input-group-prepend">
	    <label class="input-group-text" for="inputGroupSelect01">
		    New Password
		</label>
	  </div>
	  <input type="text" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1" id="password"/>
	</div>

	<div class="input-group mb-3">
	  <div class="input-group-prepend">
	    <label class="input-group-text" for="inputGroupSelect01">
		    Retype Password
		</label>
	  </div>
	  <input type="text" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1" id="re_password"/>
	</div>

	<div class="input-group mb-3">
	  <div class="input-group-prepend">
	    <label class="input-group-text" for="inputGroupSelect01">
		    New Email
		</label>
	  </div>
	  <input type="text" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1" id="email"/>
	</div>
    <button type="button" id="change" class="btn btn-outline-primary">
	    Change My Info
	</button>
	<!--success button-->
	<button type="button" id="success" style="display: none;" class="btn btn-outline-primary" data-toggle="modal" data-target="#successModal">
	    success
	</button>
	<!--error button-->
	<button type="button" id="error" style="display: none;" class="btn btn-outline-primary" data-toggle="modal" data-target="#errorModal">
	    error
	</button>
  </div>

  <!-- Modal Part -->
  <!--success Modal-->
	<div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="alert alert-primary">
	        <h5 class="modal-title" id="exampleModalLabel">
	        	Change Personal Info Success!
	        </h5>
	      </div>
	      <div class="modal-body">
	        You need to login to system again using your new password
	      </div>
	      <div class="modal-footer">
	        <button type="button" id="success_modal_button" class="btn btn-secondary" data-dismiss="modal">Close
	        </button>
	      </div>
	    </div>
	  </div>
	</div>
	<!--error Modal-->
	<div class="modal fade" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="alert alert-danger">
	        <h5 class="modal-title" id="exampleModalLabel">
	        	Change Personal Info error
	        </h5>
	      </div>
	      <div class="modal-body">
	        Sorry we face some problems, please try again
	      </div>
	      <div class="modal-footer">
	        <button type="button" id="error_modal_button" class="btn btn-secondary" data-dismiss="modal">
		        Close
		    </button>
	      </div>
	    </div>
	  </div>
	</div>

</div>
<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.cookie.js"></script>
    <script type="text/javascript" src="js/personalInfo.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>