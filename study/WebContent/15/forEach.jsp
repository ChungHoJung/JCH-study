<%@page import="kr.or.nextit.function.service.CommCodeVo"%>
<%@page import="kr.or.nextit.function.MemberUtil"%>
<%@page import="kr.or.nextit.mber.service.MberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "java.util.*" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
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
		<%
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("memId","user");
			map.put("memName","홍길동");
		%>
		
		<c:set var = "item" value ="<%=map %>"></c:set>
		아이템 : ${item}	<br>
		
<!-- 		items 확인 -->
		<c:forEach var="m" items="${item}">
			key = ${m.key } : value = ${m.value } <br>
		</c:forEach>
		
		<%
			List<MberVO> items = new ArrayList();
		
			MberVO item = new MberVO();
			item.setMemId("master");
			item.setMemName("홍길동");
			items.add(item);
			
			item = new MberVO();
			item.setMemId("admin");
			item.setMemName("말자");
			items.add(item);
			
			item = new MberVO();
			item.setMemId("user");
			item.setMemName("철수");
			items.add(item);
			
			request.setAttribute("ds",items);
		%>
		<c:set var = "rs" value ="<%=items %>"></c:set>
		
		
		<c:forEach var="item" items ="${rs}">
			${item.memId }
			${item.memName } <br>			
		</c:forEach>
		
		<hr>
	
		<table class="table" border="2">
		<c:forEach var = "mber" items ="${ds }" varStatus="status" >
		<tr>
			<td>${status.first ? '시작' : ''}</td>
			<td>${status.count }</td>
			<td>${mber.memId }	</td>
			<td>${mber.memName }</td>
			<td>${status.last ? '마지막' : ''}</td>
		</tr>
		</c:forEach>
		</table>
		
		<hr>

		<% 
			List<CommCodeVo> hobby = MemberUtil.getHobbyItems(); 
		%>
		<c:set var = "hobbys" value="<%=hobby %>"></c:set>
		
		<select name = "hobby">
			<c:forEach var ="rs" items="${hobbys }">
				<option value = "${rs.key }">
					 ${rs.value }
				</option>	
			</c:forEach>
		</select>		
		
		<br>
		
		취미: radio
		<c:forEach var="rs" items="${hobbys}"><br>
			<input type = "radio" name="hobbyRadio" value = "${rs.key }" > 
			${rs.value } <br>
		</c:forEach>
		
		<hr>
		취미 : checkbox
		<c:forEach var="rs" items="${hobbys }">
			<br><input type = "checkBox" name="hobbyCheckBox" value="${rs.key }">
			${rs.value} <br>
		</c:forEach>
		
		
		
		
		
		
		
		
	</div>
</body>
</html>