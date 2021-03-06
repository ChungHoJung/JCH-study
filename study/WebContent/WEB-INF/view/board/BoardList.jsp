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
<title> 리스트 </title>

<c:import url="/inc/lib.jsp"></c:import>

</head>
<body>
	<c:import url="/inc/navbar.jsp"></c:import>
	
	<div class = "container">
		<br><a href = "/board/boardInsertForm.do">등록</a>
		<table class = "table">
			<thead>
				<tr>
					<th>순번</th>
					<th>제목</th>
					<th>조회수</th>
					<th>등록자</th>
					<th>등록일</th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach var="rs" items="${boardList }"></c:forEach>
				<tr>
					<td>${status.index }</td>
					<td>
					<c:url var="viewPage" value = "/board/boardView.do">
						<c:param name="seqNo" value="${rs.seqNo }"></c:param>
					</c:url>
						<a href ="${viewPage}" > ${rs.title }</a>						
					</td>
					<td>${rs.viewCount }</td>
					<td>${rs.regUser }</td>
					<td>${rs.regDate }</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>