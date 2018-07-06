<%@page errorPage="error.jsp" import="dao.*"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Bookstore</title>
  </head>

  <body style="background-color: #eee;">
  	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	   <a class="navbar-brand" href="#">Bookstore</a>

	   <div class="collapse navbar-collapse">
	    <ul class="navbar-nav"  style="display: none;" id="navbar_ul">
	      <li class="nav-item">
	        <a class="nav-link" href="books.jsp">Books</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="orders.jsp">My Orders</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="personalInfo.jsp">Change Personal Info</a>
	      </li>
	    </ul>
	  </div>

		<div class="btn-group" role="group" aria-label="Basic example" id="button_div">
		  <button type="button" class="btn btn-info" data-toggle="modal" data-target="#loginModal">Login</button>
		  <button type="button" class="btn btn-info" data-toggle="modal" data-target="#signupModal">Signup</button>
		</div>
		<button type="button" class="btn btn-secondary" style="display: none;" id="sign_out">
		Sign out</button>
	</nav>
    <!-- Button trigger modal -->

	<!-- Login Modal -->
	<div class="modal fade pull-right" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Personal Info</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="login_close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form>
			  <div class="form-group">
			    <label for="login_username">Username</label>
			    <input type="text" class="form-control" id="login_username" aria-describedby="username" placeholder="Enter username">
			    <small id="usernameHelp" class="form-text text-muted">Please enter your username.</small>
			  </div>
			  <div class="form-group">
			    <label for="login_password">Password</label>
			    <input type="password" class="form-control" id="login_password" placeholder="Password"/>
			  </div>
			  <div class="form-check">
			    <input type="checkbox" class="form-check-input" id="check1">
			    <label class="form-check-label" for="check1">Remember me</label>
			  </div>
			  <input type="button" class="btn btn-primary" value="Submit" id="login_submit"/>
			</form>
	      </div>
	      <div class="modal-footer">
	        
	      </div>
	    </div>
	  </div>
	</div>

	<!--Signup Modal-->
	<div class="modal fade pull-right" id="signupModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Personal Info</h5>
	        <button type="button" id="signup_close" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form id="signup_form">
			  <div class="form-group">
			    <label for="username">Username</label>
			    <input type="text" class="form-control" id="signup_username" aria-describedby="username" placeholder="Enter username">
			    <small class="form-text text-muted" id="signup_tag1">Please enter your username.</small>
			  </div>
			  <div class="form-group">
			    <label for="signup_password1">Password</label>
			    <input type="password" class="form-control" id="signup_password1" placeholder="Password">
			  </div>
			  <div class="form-group">
			    <label for="signup_password2">Retype Password</label>
			    <input type="password" class="form-control" id="signup_password2" placeholder="Password">
			  </div>
			  <div class="form-group">
			    <label for="email">Email address</label>
			    <input type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
			  </div>
			  <div class="form-check">
			    <input type="checkbox" class="form-check-input" id="check2">
			    <label class="form-check-label" for="check2">Remember me</label>
			  </div>
			  <button type="submit" class="btn btn-primary" id="signup_submit">Submit</button>
			</form>
	      </div>
	      <div class="modal-footer"></div>
	    </div>
	  </div>
	</div>

	<!--Main page-->
	<div id="carouselExampleControls" class="carousel slide" data-ride="carousel" style="width: 1200px; margin: 0 auto">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img class="d-block w-100" src="img/1.jpg" alt="First slide">
	    </div>
	    <div class="carousel-item">
	      <img class="d-block w-100" src="img/2.jpg" alt="Second slide">
	    </div>
	    <div class="carousel-item">
	      <img class="d-block w-100" src="img/3.jpg" alt="Third slide">
	    </div>
	  </div>
	  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	</div>


	<!--footer of the page-->
	<div class="footer-copyright text-center py-3 fixed-bottom bg-dark text-white">
		Created By: Hongxiang Wang (whx0509@gmail.com or hongxiang_wang@126.com)
	</div>
	
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.cookie.js"></script>
    <script type="text/javascript" src="js/mainPage.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>