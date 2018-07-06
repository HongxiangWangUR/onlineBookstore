package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.annotation.*;
import dao.*;

@WebServlet(name="signup_check",urlPatterns={"/signup_check"})
public class signupCheck extends HttpServlet{
	public void service(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
		String username=request.getParameter("username");
		System.out.println("username="+username);
		selectByUsername sb=new selectByUsername();
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out=new PrintWriter(response.getOutputStream());
		if(sb.getUser(username)){
			out.println("{\"result\":\"exist\"}");
		}else{
			out.println("{\"result\":\"ok\"}");
		}
		out.close();
	}
}