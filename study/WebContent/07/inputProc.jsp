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
	이름 : ${param.userName}
	<br>
	취미 : <% 
				/* String []  hobby = request.getParameterValues("userHobby");
				for(String hobbys : hobby){
					out.println(hobbys);
				}	 */
				String result = "";
				String[] value;
 				Enumeration a = request.getParameterNames();
 				
 				while(a.hasMoreElements()){
 					result = (String)a.nextElement();
 					value = request.getParameterValues(result);
 					
 					out.print(result);
 					
 					for(int i=0; i<value.length; i++){
 						out.println(value[i]);
 					}
 				}
		   %>
   <br>
	혈액형 : <% 
				String blood = request.getParameter("userBlood");
// 		   		out.println(blood);
				StringBuilder path = new StringBuilder();	// 변경할 수 있는 문자열
		   		
				/* String path = ""; */
				/* path = request.getContextPath() + "/07/" + blood + ".jsp"; */
				
		   		switch(blood){
		   			case "A" :
		   				out.print("A형 입니다");
		   				path.append(request.getContextPath());
		   				path.append("/07/A.jsp");
		   				break;
		   			case "B" :
		   				out.print("B형 입니다");
		   				path.append(request.getContextPath());
		   				path.append("/07/B.jsp");
		   				break;
		   			case "O" :
		   				out.print("O형 입니다");
		   				break;
		   			default:
		   				out.print("AB형 입니다");	
		   				break;
		   		}
		   		
		   		/* path = request.getContextPath() + "/07/" + blood + ".jsp?blood = " + blood; */
		   		
		   		path.setLength(0);			// 0번부터 사용
		   		path = new StringBuilder(); 	// 초기화
		   		
		   		path.append(request.getContextPath());
		   		path.append("/07/");
		   		path.append(blood);
		   		path.append(".jsp?blood=");
		   		path.append(blood);
		   		
		   		response.sendRedirect(path.toString());
		   		
		   		/* response.sendRedirect(path);	// 페이지 이동 */
			 %>
			 
			  <jsp:forward page = ""></jsp:forward> 
	
</body>
</html>