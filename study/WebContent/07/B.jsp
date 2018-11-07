<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>B형 입니다</title>
</head>
<body>
이름 : ${param.userName}
	<br>
	취미 : <% 
				 String []  hobby = request.getParameterValues("userHobby");
					if(hobby == null){
				for(String hobbys : hobby){
					out.println(hobbys);
					}
				}
				else{
					out.println("userHobby Data not null");
				}
					
			%>
			
	B형 입니다
	
	<%
		List<String> hello = (List<String>)request.getAttribute("hello");
	
		if(hello != null){
		for(String value : hello){
			out.println(value);
			}
		}else{
			out.println("Data null");
		}
	%>
</body>
</html>