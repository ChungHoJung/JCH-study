package kr.or.nextit.common.filter;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.nextit.function.service.ComCodeService;
import kr.or.nextit.function.service.CommCodeVo;
import kr.or.nextit.function.service.impl.ComCodeServiceImpl;
import kr.or.nextit.login.service.LoginVO;


@WebFilter(filterName = "IpCheckFilter", urlPatterns= {"/test123/*"})
public class IpCheckFilter implements Filter {

	private Map<String,String> ipMap;
	
	private ComCodeService codeService;
	
	private List<CommCodeVo> ipList = null;
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
		
		try {
			codeService = new ComCodeServiceImpl();
			ipList = codeService.getIpList();
			
			for(CommCodeVo commcodevo : ipList) {
				System.out.println(String.format("Ip Key = %s : 승인여부 = %s", 
						commcodevo.getKey(), commcodevo.getValue()));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			
			
			e.printStackTrace();
		}
		
		ipMap = new HashMap<>();
		ipMap.put("127.0.0.1", "a");
		ipMap.put("192.168.10.80", "a");
		ipMap.put("192.168.10.22", "d");
		ipMap.put("192.168.10.50", "d");
		
		System.out.println("ipMap data init() 등록된 ip 확인");
		Set<String> ipkey = ipMap.keySet();
		
		for(String key : ipkey) {
			System.out.println(String.format("Ip Key = %s : 승인여부 = %s", key, ipMap.get(key)));
		}
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
//		HttpServletRequest myreq = (HttpServletRequest) req;
//		HttpServletResponse myresp = (HttpServletResponse) resp;
		
//		HttpServletRequest request = (HttpServletRequest) req;
//		HttpSession session =  request.getSession();
//		LoginVO loginInfo = (LoginVO)session.getAttribute("loginInfo");
//		
//		if(loginInfo != null) {
//			// 로그인 됨
//			chain.doFilter(req, resp);
//		} else {
//			// 로그인 안됨
//			RequestDispatcher dispatcher = req.getRequestDispatcher("/Deny.jsp");
//			dispatcher.forward(req, resp);
//		}
		
		String ip = req.getRemoteAddr();
		
		// 접근 승인 여부
		try {
		CommCodeVo resultCodeVo =  codeService.getIpItem(ip);
		
		System.err.println("==============================");
		System.err.println(ip);
		System.err.println(resultCodeVo.getKey());
		System.err.println(resultCodeVo.getValue());
		System.err.println("==============================");
		
		if(ip != null && 
				resultCodeVo != null && 
				ip.equals(resultCodeVo.getKey()) &&
						"a".equals(resultCodeVo.getValue())) {
							
			chain.doFilter(req, resp);
		
			}else {
				throw new Exception(String.format(" '%s' 사용자는 접근 금지",ip));
			}
				
			
		}catch (Exception e) {
			e.printStackTrace();
	
			System.out.println("존재하지 않는 IP index.jsp");
			resp.setCharacterEncoding("utf-8");
			resp.setContentType("text/html");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/Deny.jsp");
			dispatcher.forward(req, resp);
		}
	}

		
//	if(ip != null && ipMap.containsKey(ip)) {
//		
//		if("a".equals(ipMap.get(ip))) {
//			System.out.println("존재하는 ip 승인");
//			chain.doFilter(req, resp);
			
//	System.out.println("존재하는 ip 거부");
//	resp.setCharacterEncoding("utf-8");
//	resp.setContentType("text/html");
//	RequestDispatcher dispatcher = req.getRequestDispatcher("/Deny.jsp");
//	dispatcher.forward(req, resp);
//	
			
//		} else {
//			// 존재하지 않는 ip
//			// senRedirect, forward
//			System.out.println("존재하지 않는 IP index.jsp");
//			RequestDispatcher dispatcher = req.getRequestDispatcher("/Deny.jsp");
//			dispatcher.forward(req, resp);
//			// servlet은 requestDispatcher 객체를 통해 사용자의 원래 요청을
//			// 다른 동적 웹 자원으로 전달함
//		}

	

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		ipMap = null;
	}
}
