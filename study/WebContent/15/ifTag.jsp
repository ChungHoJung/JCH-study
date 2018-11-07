<%@page import="kr.or.nextit.mber.service.impl.MberServiceImpl"%>
<%@page import="kr.or.nextit.mber.service.MberService"%>
<%@page import="kr.or.nextit.mber.service.MberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
    
    
    <%
    	MberVO member = new MberVO();
    	member.setMemId("master");
    	member.setMemName("ㅎㅇ");
    	
    	//request.setAttribute("member", member);
    
    	int age = 20;
    	
	    if (age >= 10){
	    	out.println(age);	
	    }else{
	    	out.println();
	    }
    
	    request.setAttribute("age", age);
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<pre>
	${age>=10 ? '10보다 크거나 같음' : '10보다 작거나 같다'}
	
	<c:if test="${age >= 10}">
		10보다 크거나 같다
	</c:if>
	<c:set var="age" value="5"></c:set>
	<c:if test="${age <= 10}">
		10보다 작거나 같다
	</c:if>
	<!--else가 없으므로 if절로 해야함-->
	
	<%
		MberService mberservice = new MberServiceImpl();
		//mberservice.getMemberItem("user");
		MberVO mberInfo = mberservice.getMemberItem("user");
	%>	
	<c:set var = "mberItem" value ="<%=mberInfo %>"></c:set>
	아이디: ${mberItem.memId }
	이름 : ${mberItem.memName}
	
	
	
	
	
<!--    	//request.setAttribute("member", member);  아래와 같은 기능-->
	<c:set var = "member" value="<%=member%>"></c:set>
	
	<c:if test="${ not empty member }">
		${member.memId }
		${(member.memId eq 'master' ? '관리자':'사용자')}
	</c:if>
	
	<c:if test="${empty member }">
		사용자 정보가 없습니다
	</c:if>
		
</pre>
	
</body>
</html>