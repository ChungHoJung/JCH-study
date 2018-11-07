<%@page import="kr.or.nextit.common.utils.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.*"%>
    <%@ page import = "kr.or.nextit.login.service.*" %>
    
    <%
    	String userId = "";
    
	    LoginVO login = (LoginVO)request.getSession().getAttribute("loginfom");
    
    	CookieBox ck = new CookieBox(request);
    	
    	if(ck.exists("userId")){
    		userId = ck.getValue("userId");
    	}
    
    	if(login != null){
	    	out.println(login.getUserId());
	    	out.println(login.getUserPw());
	    	out.println(login.getUserName());
	    	out.println(login.getUserRemember());
    	}
    	
    	
    %>
    <br>
   	 ${loginfom.userName}
   	 ${loginfom.userId}
   	 ${loginfom.userPw}
   	 ${loginfom.userEmail}
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<jsp:include page="/inc/lib.jsp"></jsp:include>
</head>
<body>
	
	<jsp:include page="/inc/navbar.jsp"></jsp:include>
	
	<form action="<%=request.getContextPath()%>/11p/loginProc.jsp" method="get">
	<table class="table">
		<tbody>
			<tr>
				<td>아이디</td>
				<td><input type = "text" name ="userId" value="<%=userId %>" >
				</td>
			</tr>
			
			<tr>
				<td>비밀번호</td>
				<td><input type = "password" name ="userPw" ></td>
			</tr>
			
			<tr>
				<td>아이디 저장</td>
				<td><input type = "checkbox" name ="userRemember" value ="y" ></td>
			</tr>
			
			<tr>
				<td colspan="2">
					<button type = "submit"> 로그인</button>
				</td>
			</tr>
			
		</tbody>
	</table>
	</form>
	
</body>
</html>