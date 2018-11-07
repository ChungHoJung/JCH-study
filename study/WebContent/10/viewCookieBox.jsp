<%@page import="java.io.IOException"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="kr.or.nextit.common.utils.CookieBox"%>
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

<%
try{ %>
	<%
		CookieBox cookieBox = new CookieBox(request);
 	
		Cookie userCookie =  cookieBox.getCookie("userCookie");
	%>
	
	쿠키 명 :<%=userCookie.getName()%><br>
	쿠키 값 :<%= URLDecoder.decode(userCookie.getValue()) %><br>
	userCookie.getVersion() : <%=userCookie.getVersion() %><br>
	
	쿠키 값 (userCookie) :<%= (cookieBox.getValue("userCookie"))%><br>
	쿠키 값 (userCookie) :<%= (cookieBox.getValue("userCookie2"))%><br>
	쿠키 값 (userCookie) :<%
								if(cookieBox.exists("userCookie3")){
									out.println(cookieBox.getValue("userCookie3"));
								}else{
									out.print("쿠키 없음");
								}
						%>
						
	<% }catch(Exception e){
		out.println(e.getMessage());
	}
		%>
</body>
</html>