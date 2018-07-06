package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import dao.*;
import javax.servlet.annotation.*;

@WebServlet(name="delete",urlPatterns="/deleteOrder")
public class deleteOrderServlet extends HttpServlet{
	public void service(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException{
		String order_id=request.getParameter("order_id");
		PrintStream out=new PrintStream(response.getOutputStream());
		int id=0;
		try{
			id=Integer.parseInt(order_id);
		}catch(NumberFormatException e){
			out.println("{\"result\":\"error\"}");
			return;
		}
		deleteOrder d=new deleteOrder();
		if(d.delete(id)){
			out.println("{\"result\":\"ok\"}");
		}else{
			out.println("{\"result\":\"error\"}");
		}
	}
}