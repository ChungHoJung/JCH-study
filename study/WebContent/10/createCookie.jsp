<%@page import="java.net.URLDecoder"%>
<%@page import="kr.or.nextit.common.utils.CookieBox"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
    
    
    <%@page import = "kr.or.nextit.common.utils.*" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	쿠키 생성 전체 적용하는 쿠키
	<a href = "<%= request.getContextPath() %>/10/viewCookie.jsp" target="_blank">
		전체 보이는 쿠키
	</a>
	<%
	
			Cookie cookieAll = new Cookie("title",URLEncoder.encode("ㅎㅇㅎㅇ","utf-8"));
			cookieAll.setDomain("127.0.0.1");
			cookieAll.setPath("/");
			cookieAll.setMaxAge(120);
		
			response.addCookie(cookieAll);
		
	%>
	
	<br>
	
	쿠키 생성 review 적용하는 쿠키
	<a href = "<%= request.getContextPath() %>/review/viewCookie.jsp" target="_blank">
		review 적용하는 쿠키
	</a>
	<%
		Cookie cookieItem = new Cookie("review",URLEncoder.encode("reviewㅎㅇ","utf-8"));
		cookieItem.setDomain("127.0.0.1");
		cookieItem.setPath("/review");
		cookieItem.setMaxAge(120);
			
		response.addCookie(cookieItem);
		
		out.println( "<br>" + 7 * 7);
	%>
	
	
	
	쿠키 utils(API) 활용
	<a href = "<%= request.getContextPath() %>/10/viewCookieBox.jsp" target="_blank">
		view CookieBox 보이는 쿠키
	</a>
	<%
	 	CookieBox cookieBox = new CookieBox(request);
	
		Cookie userCookie = cookieBox.createCookie("userCookie", "쿠키1");
		response.addCookie(userCookie);
		
		Cookie userCookie2 = CookieBox.createCookie("userCookie2", "쿠키2");
		response.addCookie(userCookie2);
		
		response.addCookie(CookieBox.createCookie("userCookie3", "쿠키3","/",20));  
	%>
	<br>
	<%-- 쿠키 연습
	<%
		CookieBox c = new CookieBox(request);

		out.print("이름" + c.getCookie("title") + "<br>");
		
		out.print("값 " + c.getValue("title"));
		
		CookieTest ct = new CookieTest(request);
		Cookie ckk = ct.getCookie("dd", "tt");
		response.addCookie(ckk);
		
		
	%> --%>
</body>
</html>