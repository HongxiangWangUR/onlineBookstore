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
    <div class="jumbotron">
      <h1 class="display-4">Success!</h1>
      <p class="lead">Thank you for choosing us!</p>
      <hr class="my-4">
      <p>Your order will be placed in few seconds.</p>
      <p class="lead">
        <a class="btn btn-primary btn-lg" href="index.jsp" role="button">
            Let Me Back Home
        </a>
        <a class="btn btn-primary btn-lg" href="orders.jsp" role="button">
            Let Me See My Orders
        </a>
      </p>
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