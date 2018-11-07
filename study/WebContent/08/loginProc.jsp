<%@ page import = "java.net.*" %>

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
	비밀번호 : ${param.userPw}
	
	<%
		// 아이디가 master / 12345 로그인 성공
		// 					아니면 로그인 실패
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
		if(userId.equals("master") && userPw.equals("12345")){
			// 로그인 성공 하였으면 index.jsp
			application.log(String.format("로그인 %s", true));
			/* request.setAttribute("result", false);
			request.setAttribute("message", "아이디 비번 틀림"); */
			
			StringBuilder redirect = new StringBuilder();
			redirect.append("/index.jsp?");
			redirect.append(String.format("result=%s",true));
		redirect.append(String.format("&message=%s",URLEncoder.encode("정상 로그인","utf-8")));
			/* URLDecoder.decode(s, enc) */
			response.sendRedirect(redirect.toString());
		}else{
			// 로그인 실패 했으면 : loginForm.jsp
			request.setAttribute("result", false);
			request.setAttribute("message", "아이디 비번 틀림");
			application.log(String.format("로그인 %s", false));
			/* response.sendRedirect("/08/loginForm.jsp"); */
			
			%>
				<jsp:forward page="/08/loginForm.jsp"></jsp:forward>
			<% 
		}
	%>
</body>
</html>