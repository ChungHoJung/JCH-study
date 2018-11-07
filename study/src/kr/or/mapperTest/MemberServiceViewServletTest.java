package kr.or.mapperTest;

import java.io.IOException;

import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import kr.or.nextit.member.service.MemberVo;

@WebServlet(name="MemberServiceViewServletTest", urlPatterns="/memberView.nextTest")
public class MemberServiceViewServletTest implements Servlet {
	
	private MemberService memberService;
	
	@Override
	public void init(ServletConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		memberService = new MemberServiceImpl();
	}

	@Override
	public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId = req.getParameter("userId");
		
		try {
			MemberVo result =  memberService.getSelectMember(userId);
			req.setAttribute("result", result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.err.println(e.getMessage());
		}

		RequestDispatcher disp = req.getRequestDispatcher("17/servletViewTest.jsp");
		disp.forward(req, resp);
	}
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public ServletConfig getServletConfig() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getServletInfo() {
		// TODO Auto-generated method stub
		return null;
	}

	
	

}
