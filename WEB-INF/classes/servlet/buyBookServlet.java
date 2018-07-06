package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import dao.*;
import javax.servlet.annotation.*;

@WebServlet(name="buyBook",urlPatterns="/buyBook")
public class buyBookServlet extends HttpServlet{
	public void service(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException{
		Cookie[] cooks=request.getCookies();
		String username="";
		for(Cookie c:cooks){
			if(c.getName().equals("userpass")){
				String userpass=c.getValue();
				username=userpass.split("\\|")[0];
			}
		}
		if(username==null || username=="")
			request.getRequestDispatcher("error.jsp").forward(request,response);
		String[] nums=request.getParameterValues("num");
		int[] ns=new int[nums.length];
		try{
			for(int i=0;i<nums.length;i++)
				ns[i]=Integer.parseInt(nums[i]);
		}catch(NumberFormatException e){
			request.getRequestDispatcher("error.jsp").forward(request,response);
			return;
		}
		buyBook buy=new buyBook();
		if(buy.purchase(ns,username)){
			request.getRequestDispatcher("success.jsp").forward(request,response);
		}else{
			request.getRequestDispatcher("error.jsp").forward(request,response);
		}
	}
}