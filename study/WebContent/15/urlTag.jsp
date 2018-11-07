<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	request.setCharacterEncoding("utf-8");	
    %>
    
    <%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/inc/lib.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="/inc/navbar.jsp"></jsp:include>
	<div class = "container">
		<pre>
			request.getContextPath() = c:url
			request.getContextPath() : <%=request.getContextPath() + "" %>
			c:url 					 : 	<c:url value = "/"></c:url>
			
			request.getContextPath() : <%=request.getContextPath() + "/15/urlTag.jsp" %>
			c:url 					 : 	<c:url value = "/15/urlTag.jsp"></c:url>
			
			<c:url var = "testUrl" value = "/15/urlTag.jsp">
				<c:param name="key" value="test"></c:param>
			<!-- form 에서 ?로 파라미터 넘기는거와 같음 -->
			</c:url>
			${testUrl}
			<a href="${testUrl }">test url</a>
		</pre>
	</div>
</body>
</html>