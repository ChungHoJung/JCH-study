<%@page import="kr.or.nextit.function.service.CommCodeVo"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.nextit.function.service.impl.ComCodeServiceImpl"%>
<%@page import="kr.or.nextit.function.service.ComCodeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("utf-8"); %>
	<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
	*jstl 이란?
	표준 태그 라이브러리의 약어
	자신만의 태그를 추가할 수 있는 기능
	
    *jstl 문법
    == 또는 eq
	!= 또는 ne 
	< 또는 lt
	> 또는 gt
	<= 또는 le
	>= 또는 ge

    <%
    	ComCodeService codeServcie = new ComCodeServiceImpl();
    	List<CommCodeVo> hobbys = codeServcie.getCodeList("a1");
    	List<CommCodeVo> gender = codeServcie.getCodeList("b2");
    	
    	request.setAttribute("hobbys", hobbys);
    	request.setAttribute("gender", gender);
    %>
	
	
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
		<h3> 회원가입 </h3>
		
		<c:url var = "actionUrl" value="/16/memInsertProc.jsp" ></c:url>
		
	<form action = "${actionUrl}" method="post">		
		<table class="table">
			<tbody>
				<tr>
					<td>아이디</td>
					<td><input type = "text" name="userId"> </td>
				</tr>
				
				<tr>
					<td>비밀번호</td>
					<td><input type = "password" name="userPw"></td>
				</tr>
				
				<tr>
					<td>이름</td>
					<td><input type = "text" name="userName"></td>
				</tr>
				
				<tr>
					<td>성별</td>
					<td>
						<select name = "userGender">
							<c:forEach var="item" items="${gender}" >
								<option value = "${item.key}" ${param.userGender eq 
								item.key ? 'selected = "selected"' : '' }>
								
								'' 문자열 의미 -> '' 안에 ""를 사용해서 문자열 의미
								
									${item.value }
								</option>
							</c:forEach>
						</select> 
					</td>
				</tr>
				
				<tr>
					<td>취미</td>
					<td>
					<%
						/*
						String[] userHobby = request.getParameterValues("userHobby");
						for(CommCodeVo item : hobbys){
							out.print("<input type='checkbox' name='userHobby' value='");
							out.print(item.getKey());
							out.print("'");
							for(String h : userHobby){
								if(h.equals(item.key) ){	
									out.print(" checked='checked'");
								}
							}
							
							out.print(">" + item.getValue() + "<br />" );
							out.println();
							
						}
						*/
						String[] userHobby = request.getParameterValues("userHobby");
					%>
					
						<c:set var="hobby" value="<%=userHobby %>"></c:set>
						
						<c:forEach var="item" items="${hobbys}">
							<input type = "checkbox" name="userHobby" value = "${item.key}" 
								
									<c:forEach var ="item1" items="${hobby}">
										${item1 eq item.key ? 'checked="checked"' : ''}
									</c:forEach>
							  	>${item.value }<br>
						</c:forEach>
                   	 				
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<button type= "submit"> 가입 </button>
					</td>
				</tr>
				
			</tbody>
		</table>
		</form>
	</div>
</body>
</html>


							