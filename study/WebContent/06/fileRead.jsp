<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>   
<%@ page import="java.io.*" %>
   
   <% request.setCharacterEncoding("utf-8"); %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<jsp:include page="/inc/lib.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/inc/navbar.jsp"></jsp:include>
	<pre>
		<div class = "container">
		
			<%
				// application.getRealPath -> 웹URL에 path에 대한 파일 디렉토리 경로 리턴
				String path = application.getRealPath("");	
				out.println(path);
				
				path = application.getRealPath("/06/README.txt");
				out.println(path);
				
			%>
			
			<%
				// char로 받는건 약속이다....@
				// binary 데이터
				
				char[] buff = new char[1024];
				int len = -1;
				
				try(InputStreamReader br = new InputStreamReader
						(application.getResourceAsStream("/06/README.txt"), "utf-8")){
					
					// 특정한 path에 대한 자원을 read 하기 위한 inputStream을 반환
// 					br.wait();
					
					while((len = br.read(buff)) != -1){
						out.print(new String(buff,0,len));
						out.print("<br>"); 
					}
				}catch(IOException ex){
					out.println("예외 발생 : " + ex.getMessage());
				}

			%>
		</div>
	
	</pre>
</body>
</html>