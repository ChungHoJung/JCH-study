package kr.or.nextit.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter {

	private String encoding = null;
	
	@Override	// 초기화 함수 와스서버에서 필터시 가장 먼저 호출되는 함수
				//(한번실행, 선언이 완료 되야지 doFilter부분에서 필터 작업 실행 가능)
	public void init(FilterConfig config) throws ServletException {
		System.out.println("CharacterEncodingFilter.init");
		encoding = config.getInitParameter("encoding");
		
		if(encoding == null) {
			encoding = "utf-8";
		}
	}
	
	@Override	// 브라우저에서 데이터 요청
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		System.out.println("CharacterEncodingFilter.doFilter");
		
		//필터 작업
		request.setCharacterEncoding(encoding);
		response.setCharacterEncoding(encoding);
		
		//(필터 작업이 끝나고 바꿔줄 것들)
		chain.doFilter(request, response);
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("CharacterEncodingFilter.destroy");
	}

	
}
