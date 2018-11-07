<%@page import="kr.or.nextit.common.error.BizException"%>
<%@page import="kr.or.nextit.function.service.impl.ComCodeServiceImpl"%>
<%@page import="kr.or.nextit.function.service.ComCodeService"%>
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

<c:import url="/inc/lib.jsp"></c:import>

</head>
<body>
	<c:import url="/inc/navbar.jsp"></c:import>
	
	<div class = "container">
	<% 
// 		try{
	
			ComCodeService codeService = new ComCodeServiceImpl();
// 			codeService.getErrorTest("ㅎㅇ");
// 			codeService.getErrorTest2("ㅎㅇ");
// 			codeService.getBizErrorTest("ㅎㅎㅎ");
//  		codeService.getBizErrorTest2("ㅎㅎ2");
			codeService.getBizErrorTest3("ㅎㅎ2");
			
			//String value = "맙소사";
			//int num = Integer.parseInt(value);
// 		}catch(Exception e){
// 			out.println(e.getMessage());
// 			throw new BizException(e.getMessage());
// 		}
	%>
	
	</div>
</body>
</html>