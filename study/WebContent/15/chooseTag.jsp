<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<% request.setCharacterEncoding("utf-8"); %>
	<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:set var="pa" value="A" ></c:set>
	
	<c:choose>
	
		<c:when test="${pa == 'A'}">
			A형
		</c:when>
		
		<c:when test="${pa == 'B'}">
			B형
		</c:when>
		
		<c:when test="${pa == 'AB'}">
			AB형
		</c:when>
		
		<c:otherwise>
			C형
		</c:otherwise>
	</c:choose>
	
	${loginInfo.userId }
	
	<c:choose>
		<c:when test="${loginInfo.userId eq 'user'}">
			관리자
		</c:when>
		
		<c:otherwise>
			일반 사용자
		</c:otherwise>
	</c:choose>
	
</body>
</html>