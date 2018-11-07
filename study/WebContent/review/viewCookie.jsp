<%@page import="java.net.URLEncoder"%>
<%@ page import = "java.net.URLDecoder" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쿠키</title>
</head>
<body>
	<%
	
		// key,value 인자를 갖는 형태 
 		/*
 		Cookie createcookie = new Cookie("test",URLEncoder.encode("ㅎㅇ","utf-8"));
		createcookie.setMaxAge(20); // 초 단위 뒤에 삭제
		response.addCookie(createcookie);  
	
		Cookie cookie2 = new Cookie("review",URLEncoder.encode("review 에서만 보이는 쿠키","utf-8"));
		cookie2.setPath("/review");
		cookie2.setMaxAge(10);
		response.addCookie(cookie2);  */
	
		Cookie[] cookie = request.getCookies();
		/* 브라우저 저장, 클라이언트 생성 */
		
	
		if(cookie != null){
			for(Cookie cok : cookie){
				out.println("getName() : " + cok.getName() + "<br>");
				out.println("getValue() : " + cok.getValue() + "<br>");	// 브라우저 고유번호
				out.println("URLDecoder.decode(cok.getValue() : " 
						+ URLDecoder.decode(cok.getValue(), "utf-8") + "<br>");
				out.println("getComment() : " + cok.getComment() + "<br>");
				out.println("getDomain() : " + cok.getDomain() + "<br>");
				out.println("getMaxAge() : " + cok.getMaxAge() + "<br>");
				out.println("getPath() : " + cok.getPath() + "<br>");
				out.println("getVersion() : " + cok.getVersion() + "<br>");
				out.println("getSecure() : " + cok.getSecure() + "<br>");
				out.println("============================================<br>");
			}
		}
	%>
</body>
</html>