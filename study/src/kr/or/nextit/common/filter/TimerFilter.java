package kr.or.nextit.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;


@WebFilter(filterName="TimerFilter", urlPatterns = {"/","/*"}, description="프로세스 실행 시간 체크")
public class TimerFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("TimeFilter destroy 메서드 호출, 나 죽음");
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		// 주의: req 타입이 ServletRequest 이므로 HttpServletRequest 로 
		// 형변환해서 작업을 해야 할 때도 있음
		HttpServletRequest myreq = (HttpServletRequest) req;
		
		// 전처리 부분
		long startTime = System.currentTimeMillis();
		System.out.println("TimerFilter" + myreq.getRequestURI() + ",시작 : " + startTime);
		
		req.setAttribute("title", "넥스트IT(Filter Test)");
		req.setAttribute("title2", "넥스트IT2(Filter Test doFilter 아래)");
		// 여기가 포인트 **** 요청한 페이지를 실행 시키고 종결(윗부분 까지 실행, 아랫부분 반영x)
		chain.doFilter(req, resp);
		
		
		long endTime = (System.currentTimeMillis() - startTime);
		
		// 후처리 부분
		System.out.println("TimeFilter" + myreq.getRequestURI() + ",걸린시간 : " + endTime);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		// 메모리에 올라올 때
		// 초기화해야할 자원 있으면
		System.out.println("TimerFilter INIT 메서드 호출");

	}

}
