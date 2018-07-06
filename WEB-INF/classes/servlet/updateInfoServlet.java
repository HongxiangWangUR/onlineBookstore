package servlet;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import dao.*;
import javax.servlet.annotation.*;

@WebServlet(name="update",urlPatterns="/updateServlet")
public class updateInfoServlet extends HttpServlet{
	public void service(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException{
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		System.out.println("username="+username+",password="+password+",email="+email);
		updateInfo up=new updateInfo();
		boolean result=up.update(username,password,email);
		PrintStream out=new PrintStream(response.getOutputStream());
		if(result){
			out.println("{\"result\":\"ok\"}");
		}else{
			out.println("{\"result\":\"error\"}");
		}
	}
}