<%@page import="java.util.Enumeration"%>
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

	혈액형 : <% 
				String blood = request.getParameter("userBlood");
// 		   		out.println(blood);
				StringBuilder path = new StringBuilder();	// 변경할 수 있는 문자열
		   		
				/* String path = ""; */
				/* path = request.getContextPath() + "/07/" + blood + ".jsp"; */
				List<String> hello = new ArrayList();
				
		   		switch(blood){
		   			case "A" :
		   				hello.add("A");
		   				break;
		   			case "B" :
		   				hello.add("B");
		   				break;
		   			case "O" :
		   				hello.add("C");
		   				break;
		   			case "AB" :
		   				hello.add("AB");
		   				break;
		   			default:
		   				out.print("모름");	
		   				break;
		   		}
		   		
		   		
		   		
		   		request.setAttribute("hello", hello);
				
		   		path.setLength(0);			// 0번부터 사용
		   		path = new StringBuilder(); 	// 초기화
		   		
		   		path.append(request.getContextPath());
		   		path.append("/07/");
		   		path.append(blood);
		   		path.append(".jsp?");
		   		
				out.println(path.toString());
				
				response.sendRedirect(path.toString());  
			 %>
			 
			 
			 
			<%--  <jsp:forward page="<%=path.toString() %>"></jsp:forward>   --%>
			 
			 
	
</body>
</html>