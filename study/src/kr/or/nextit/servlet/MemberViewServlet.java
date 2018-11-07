package kr.or.nextit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.nextit.member.service.MemberService;
import kr.or.nextit.member.service.MemberVo;
import kr.or.nextit.member.service.impl.MemberServiceImpl;

@WebServlet(name = "MemberViewServlet" 
		  , urlPatterns = {"/memberView.next"})
public class MemberViewServlet extends HttpServlet {
	
	private MemberService memberService;
	
	
	@Override
	public void init() throws ServletException {
		memberService = new MemberServiceImpl();
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html; charset=UTF-8");
		resp.setCharacterEncoding("utf-8");
		System.out.println("회원 쩡뽀 출력");
		
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>회원 목록</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1> 회원목록입니다 </h1>");
		
		out.println("</body>");
		out.println("</html>");

		
		MemberVo memberVo = new MemberVo();
		
//		try {
//			List<MemberVo> memberList = memberService.getMemberList(memberVo);
//			req.setAttribute("memberList", memberList);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		String userId =  req.getParameter("userId");
		
		try {
			MemberVo memberResult =  memberService.getMemberItem(userId);
			req.setAttribute("memberInfo", memberResult);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.err.println(e.getMessage());
			//throw new ServletException(e.getMessage(),e);		
			throw new IOException(e.getMessage(),e);
		}
		
		// # url 확인해보기 #
		RequestDispatcher dispatcher = req.getRequestDispatcher("/17/memberViewServlet.jsp");
		
		dispatcher.forward(req, resp);
		
		/* 
		   1. 마이바티스 mapper 선언
		   2. MemberMapper.xml sql 문 선언
		   3. memberMapper 에서 선택된 id로 나머지 정보를 얻어 올 함수 선언
		   4. MemberService  인터페이스 선언
		   5. MeberServiceImpl 에서 
    	 - sqlsession -> 은 데이터베이스에 대해 SQL명령어를 실행하기 위해 필요한 모든 메소드를 가지고 있음
    	
    	
		*/
	}
}



