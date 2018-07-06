package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import dao.*;
import javax.servlet.annotation.*;

@WebServlet(name="login",urlPatterns={"/login"})
public class loginServlet extends HttpServlet{
	public void service(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
		response.setContentType("application/json;charset=UTF-8");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		login log=new login();
		PrintStream out=new PrintStream(response.getOutputStream());
		if(log.loginCheck(username,password)){
			out.println("{\"result\":\"ok\"}");
		}else{
			out.println("{\"result\":\"error\"}");
		}
		out.close();
	}
}