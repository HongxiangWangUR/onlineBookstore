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
        <a class="nav-link active" href="books.jsp">Books</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="orders.jsp">My Orders</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="personalInfo.jsp">Change Personal Info</a>
      </li>
    </ul>
  </div>
</nav>
<!--books-->
<%
String sql="select * from Book";
Connection conn=databaseConnect.getLocaleConnection();
PreparedStatement ps=conn.prepareStatement(sql);
ResultSet rs=ps.executeQuery();
%>
<form action="buyBook" method="post">
	<table class="table table-striped">
	  <thead>
	    <tr>
	      <th scope="col">#</th>
	      <th scope="col">Book Name</th>
	      <th scope="col">Author</th>
	      <th scope="col">ISBN</th>
	      <th scope="col">Amount Left</th>
	      <th scope="col">Price</th>
	      <th scope="col">Number</th>
	    </tr>
	  </thead>
	  <tbody>
	  	<%
	  	while(rs.next()){
	  	%>
	    <tr>
	      <th scope="row"><%=rs.getInt(1)%></th>
	      <td><%=rs.getString(2)%></td>
	      <td><%=rs.getString(3)%></td>
	      <td><%=rs.getString(4)%></td>
	      <td><%=rs.getInt(5)%></td>
	      <td><%=rs.getDouble(6)%></td>
	      <td>
	      	<select class="custom-select" name="num" id="num">
	      	  <option value="0">0</option>
			  <option value="1">1</option>
			  <option value="2">2</option>
			  <option value="3">3</option>
			</select>
		  </td>
	    </tr>
	    <%}
	    rs.close();
	    conn.close();
	    %>
	    <tr>
	    	<td colspan="7" align="center">
	    		<input type="submit" value="Check Out!" id="check" class="btn btn-outline-primary"/>
	    	</td>
	    </tr>
	  </tbody>
	</table>
</form>

	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.cookie.js"></script>
    <script type="text/javascript" src="js/book.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>