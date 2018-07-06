package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import dao.*;
import javax.servlet.annotation.*;

@WebServlet(name="signup",urlPatterns="/signup")
public class signup_servlet extends HttpServlet{
	public void service(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException{
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		signup s=new signup();
		response.setContentType("application/json;charset=UTF-8");
		PrintStream out=new PrintStream(response.getOutputStream());
		if(s.addUser(username,password,email)){
			out.println("{\"result\":\"ok\"}");
		}else{
			out.println("{\"result\":\"error\"}");
		}
		out.close();
	}
}