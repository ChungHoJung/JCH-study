package kr.or.nextit.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="GuguDan", urlPatterns = {"/guguDan.test"})
public class GuGuDanServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		PrintWriter out = resp.getWriter();	// 응답으로 내보내 줄 출력 스트림
		
		String flag = req.getParameter("flag");
		
		resp.setContentType("text/html; charset=UTF-8");
		resp.setCharacterEncoding("utf-8");
		
		out.println("<html>");
		out.println("<head>");
		out.println("<title> gugudan </title>");
		out.println("</head>");
		out.println("<body>");
		out.println(flag);
		out.println("한글");
		
		// out.println("<tr stlye= \"text-algin: center;\"> \n <td>");	아스키코드\ -> 다음문자열
		
		out.println("<table border=1>");
		if("left".equals(flag)) {
			out.println("<tr>");
		}
		for(int i = 1; i<=9 ; i++) {
			if(!"left".equals(flag)) {					
				out.println("<tr>");
			}
			for(int j= 1 ; j<=9; j++) {
				out.println("<td>");	
				out.println(i + "*" + j + "=" + i * j);
				out.println("</td>");
			}
			if(!"left".equals(flag)) {
				out.println("</tr>");
			}
		}
		if("left".equals(flag)) {
			out.println("</tr>");
		}
		out.println("</table>");
		out.println("</body>");
		out.println("</html>");
	}
}
