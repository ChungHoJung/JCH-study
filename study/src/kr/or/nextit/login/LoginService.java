package kr.or.nextit.login;

import javax.servlet.http.HttpServletRequest;

import kr.or.nextit.login.service.LoginVO;

public interface LoginService {
	
	public void loginCheck(HttpServletRequest req);
	
	public LoginVO loginCheck(String userId, String userPw); 
}
