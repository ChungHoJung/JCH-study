package kr.or.nextit.common.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IController {
	
	// 페이지를 리다이렉트 처리 할지 안할지 여부
	public boolean isRedirect();
	
	// 비즈니스(업무) 처리 레이어 영역
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception;
}
