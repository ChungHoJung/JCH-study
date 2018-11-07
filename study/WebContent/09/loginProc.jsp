<%@page import="kr.or.nextit.common.utils.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="kr.or.nextit.login.service.*"%>

<%
	request.setCharacterEncoding("utf-8");
%> 
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		LoginVO loginVo = new LoginVO();
		loginVo.setMessage("메시지");
		
		String userId = request.getParameter("userId");
		loginVo.setUserId(userId);
		loginVo.setUserPw(request.getParameter("userPw"));
		loginVo.setUserRemember(request.getParameter("userRemember"));
	%>
	
	<pre>
		아이디 : <%=loginVo.getUserId() %>
		이름 : <%=loginVo.getUserPw() %>
		아이디 저장 유무 : <%=loginVo.getUserRemember() %>
	</pre>
	
	<%
		LoginVO loginvo = new LoginVO();
		loginvo.setUserId(request.getParameter("userId"));
		
		out.println("아이디" + loginvo.getUserId());
	%>
	
	<jsp:useBean 
		id="loginInfo" 
		class="kr.or.nextit.login.service.LoginVO" 
		scope = "page">
	</jsp:useBean>
	<!-- LoginVO 객체 생성이랑 똑같은 정의 -->
	
	
	<jsp:setProperty property="*" name="loginInfo"/>
	<jsp:setProperty property="userId" name="loginInfo"/>
	<jsp:setProperty property="userId" name="loginInfo" value="master" />
	<jsp:setProperty property="userEmail" name="loginInfo" value="@@@@@네이버@@@@" />
	
	<pre>
		아이디 : <jsp:getProperty property="userId" name="loginInfo"/>
		아이디 : <jsp:getProperty property="userPw" name="loginInfo"/>
		아이디 : <jsp:getProperty property="userRemember" name="loginInfo"/>
		아이디 : <jsp:getProperty property="userEmail" name="loginInfo"/><br>
		
		아이디 : ${loginInfo.userId }
		이름 : ${loginInfo.userPw }
		아이디 저장 유무 : ${loginInfo.userRemember == 'Y' ? '저장o' : '저장x'}
	</pre>
	
	<%
		CookieBox cookieBox = new CookieBox(request);
	
		if("y".equals(request.getParameter("userRemember"))){
			Cookie cId = CookieBox.createCookie("userId", request.getParameter("userId"),"/",60);
			Cookie cRemember = CookieBox.createCookie("userRemember", request.getParameter("userRemember"),"/",60);
			response.addCookie(cId);
			response.addCookie(cRemember);
			
		}else{
			
			Cookie cId = CookieBox.createCookie("userId", "","/",0);
			Cookie cRemember = CookieBox.createCookie
					("userRemember", "","/",0);
			
			response.addCookie(cId);
			response.addCookie(cRemember);
		}
		
		response.sendRedirect(request.getContextPath() + "/09/loginForm.jsp"); 
	%>

</body>
</html>












