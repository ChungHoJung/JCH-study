package kr.or.nextit.login;

import javax.servlet.http.HttpServletRequest;

import kr.or.nextit.login.service.LoginVO;

public class LoginServiceImpl implements LoginService {

	@Override
	public void loginCheck(HttpServletRequest req) {
		
		String userid = req.getParameter("userId");
		String userpw = req.getParameter("userPw");
		
		if(userid.equals("master") && userpw.equals("12345")){
			req.setAttribute("result", true);
			req.setAttribute("message", "정상 로그인");
		}else {
			req.setAttribute("result", false);
			req.setAttribute("message", "로그인 실패");
		}
	}

	@Override
	public LoginVO loginCheck(String userId, String userPw) {
		// TODO Auto-generated method stub
		LoginVO result = new LoginVO();
		
		try {
			if("admin".equals(userId) && "12345".equals(userPw)) {
				result.setUserId(userId);
				result.setUserPw("");
				result.setUserName("관리자");
				result.setUserEmail("admin@naver.com");
				
				result.setResult(true);
				result.setMessage("로그인 성공");
			}else {
				result.setUserId(userId);
				result.setUserPw("");
				result.setUserName("");
				result.setUserEmail("");
				
				result.setResult(false);
				result.setMessage("로그인 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.setResult(false);
			result.setMessage(e.getMessage());
		}
		
		return result;
	}
	
	
	

}
