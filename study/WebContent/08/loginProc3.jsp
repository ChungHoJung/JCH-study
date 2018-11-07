<%@page import="kr.or.nextit.login.service.LoginVO"%>
<%@ page import = "java.net.*" %>
<%@ page import = "kr.or.nextit.login.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	아이디 : ${param.userId}<br>
	비밀번호 : ${param.userPw}<br>
	
	<% 
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
		LoginService loginService = new LoginServiceImpl(); 
		LoginVO loginVo = loginService.loginCheck(userId, userPw);
		
		out.println(loginVo.getMessage());
		out.println(loginVo.isResult());
		out.println(loginVo.getUserEmail());
		
		loginVo.setUserEmail("test@@@@@@@");
		
		out.println(loginVo.getUserEmail());
		
		request.setAttribute("loginInfo", loginVo);
		
		if(loginVo.isResult()){
			// 메인 페이지로 이동
			
			%>
				<jsp:forward page="/index.jsp"></jsp:forward>
			<%
		}else{
			// 로그인 페이지로 이동
			%>
				<jsp:forward page="/08/loginForm.jsp"></jsp:forward>
			<%
		}
	%>
	
	<%-- <jsp:useBean id=""></jsp:useBean> --%>
	
</body>
</html>