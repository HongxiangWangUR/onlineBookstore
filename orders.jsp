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
        <a class="nav-link active" href="orders.jsp">My Orders</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="personalInfo.jsp">Change Personal Info</a>
      </li>
    </ul>
  </div>
</nav>
<!-- Orders -->
<%
String sql="select bookname,author,order_date,a.amount,order_id from Book_Order as a,Book as b where book_id=id and username=?";
Connection conn=databaseConnect.getLocaleConnection();
PreparedStatement ps=conn.prepareStatement(sql);
ps.setString(1,username);
ResultSet rs=ps.executeQuery();
%>
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Order Date</th>
      <th scope="col">Number purchased</th>
      <th scope="col">Operation</th>
    </tr>
  </thead>
  <tbody>
  	<%
  	while(rs.next()){
  	%>
    <tr>
      <td scope="row"><%=rs.getString(1)%></td>
      <td><%=rs.getString(2)%></td>
      <td><%=rs.getDate(3)%></td>
      <td><%=rs.getInt(4)%></td>
      <td>
      	<button type="button" class="btn btn-secondary" value="<%=rs.getInt(5)%>">
		    Delete
		</button>
	  </td>
    </tr>
    <%}
    rs.close();
    conn.close();
    %>
  </tbody>
</table>
<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.cookie.js"></script>
    <script type="text/javascript" src="js/order.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>