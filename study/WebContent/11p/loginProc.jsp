<%@page import="kr.or.nextit.common.utils.CookieBox"%>
<%@page import="kr.or.nextit.login.service.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		List<LoginVO> loginList = new ArrayList<>();
		loginList.add(new LoginVO("정충호","user","1234","ghrhzh@naver.com"));
	
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userRemember = request.getParameter("userRemember");

		
		
		CookieBox cookie = new CookieBox(request);
			
		if("y".equals(userRemember)){
			Cookie id = cookie.createCookie("userId",userId,"/",60);
			Cookie remember = cookie.createCookie("userRemember",userRemember,"/",60);
			response.addCookie(id);
			response.addCookie(remember);
			
		}else{
			Cookie id = cookie.createCookie("userId","","/",0);
			Cookie remember = cookie.createCookie("userRemember","","/",0);
			response.addCookie(id);
			response.addCookie(remember);
		}
		
		
		for(LoginVO lv : loginList){
			if(userId.equals(lv.getUserId()) && userPw.equals(lv.getUserPw())){
				request.getSession().setAttribute("loginfom", lv );
			}
			else{
				request.getSession().removeAttribute("loginfom");
			}
		}
		
		response.sendRedirect(request.getContextPath()+"/11p/loginForm.jsp");
	%>
</body>
</html>