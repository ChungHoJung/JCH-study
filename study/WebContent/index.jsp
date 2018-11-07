<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page ="/inc/lib.jsp"></jsp:include>
</head>
<body>
<jsp:include page ="/inc/navbar.jsp"></jsp:include>
	<div class="container">
	
	 ${param.result}<br>
	 ${param.message}
	 
	
	안녕하세요
	request.getContextPath() : <%=request.getContextPath()%>
	<%  
		String name = "오하영";
	
	%>
	<br>
	이름은 무엇인가요? <%= name %>
	<br>
	이름은 무엇인가요? <% out.print(name); %>
	</div>
</body>
</html>