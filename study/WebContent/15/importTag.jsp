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
	
		<h3>import / out 태그 예제</h3>
		
		<%
			out.println("out 객체가 <br> 출력한 내용");
		%>
		<br>
		<pre>
			escapeXml="false" : <c:out value="out 태그가 <br> 출력한 내용." escapeXml="false"></c:out>
			escapeXml="true"  : <c:out value="out 태그가 <br> 출력한 내용." escapeXml="true"></c:out>
			
		</pre>
	</div>
	
	<form action="importTag.jsp" method="get">
		<select name = "where">
			<option value="nexearch" 
				${param.where eq 'nexerch' ? 'selected="selected"' : ''}>통합</option>
			<option value="article"
			${param.where eq 'article' ? 'selected="selected"' : ''}>카페</option>
			<option value="post" 
			${param.where eq 'post' ? 'selected="selected"' : ''}>블로그</option>
		</select> 
		<input type = "text" size="30" name="query" value="${param.query}">
		<input type = "submit" value="검색">
	</form>
	<hr color= "red">
	
	<p> 검색결과가 아래에 표출 </p>
<!--  	&gtc:import url=""&lt   -->
	<c:if test="${not empty param.query }">
		<c:url var="searchURL"
			value = "https://search.naver.com/search.naver?ie=utf8"></c:url>
				<c:import url="${searchURL }" var = "result" scope="request"
			charEncoding="utf-8">
					<c:param name="where" value="${param.where}"></c:param>
					<c:param name="query" value="${param.query}"></c:param>
				</c:import>		
			<p>${result }</p>
	</c:if>
</body>
</html>












