package kr.or.nextit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="ServletTest" , urlPatterns = {"/ServletTest"})
public class ServletTest extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html; charset=utf-8");
		resp.setCharacterEncoding("utf-8");
		
		PrintWriter out =  resp.getWriter();
		
		out.print("do.get : Test ==================<br>");
		out.println(req.getParameter("test"));
		out.println(req.getParameter("userName"));
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Enumeration<String> params =  req.getParameterNames();
		
		resp.setContentType("text/html; charset=utf-8");
		resp.setCharacterEncoding("utf-8");
		
		PrintWriter out =  resp.getWriter();
		
		while(params.hasMoreElements()) {
			String param = (String)params.nextElement();
			out.println(String.format("param Name : %s = value : %s ", param , req.getParameter(param)));
		}
	}
}
