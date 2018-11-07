<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록</title>
<jsp:include page="/inc/lib.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="/inc/navbar.jsp"></jsp:include>
	
	<div class = "container">
<%

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	StringBuilder query = new StringBuilder();
	
	query.append("		SELECT		");
	query.append("		mem_id,		");
	query.append("		mem_pw,		");
	query.append("		mem_name,	");
	query.append("		mem_email,	");
	query.append("		mem_phone,	");
	query.append("		reg_date	");
	query.append("		FROM		");
	query.append("		tbb_member	");
	query.append("		order by reg_date DESC	 ");
	
	
	
%>
		<a href="<%=request.getContextPath()%>/14/memberInsertForm.jsp"></a>
		<table class = "table">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>연락처</th>
				<th>가입일</th>
			</tr>
		</thead>
			<tbody>
			<%
				try{
					// 드라이버 로딩
					Class.forName("oracle.jdbc.driver.OracleDriver");
					
					// DB 연결 
					conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
							"java",
							"oracle");
					
					// 쿼리 준비
					ps = conn.prepareStatement(query.toString());
				
					// 데이터 가져오기
					rs = ps.executeQuery();
					// 1. execute -> executerQuery , executeUpdate 두 가지 모두를 갖는 경우
					// 2. executerQuery() -> 하나의 쿼리 select 
					// 3. executeUpdate() -> select를 제외한 나머지 -> 반환값 int 정수값을 갖음@@
					
					while(rs.next()){
					String memId = rs.getString("mem_id");
			%>
				<tr>
					<td>
						<c:url var="viewPage" value="/14/memberViewForm.jsp">
							<c:param name="memId" value="<%=memId%>"></c:param>
						</c:url>
						
						<c:set var="memId" value="<%=memId%>"></c:set>
						
						<c:url var="viewPage2" value="/14/memberViewForm.jsp">
							<c:param name="memId" value="${memId}"></c:param>
						</c:url>
						
						
						<a href = "${viewPage2}">
						<%= rs.getString("mem_id") %>
						</a>
					</td>
					
					<td><%= rs.getString("mem_name") %></td>
					<td><%= rs.getString("mem_email") %></td>
					<td><%= rs.getString("mem_phone") %></td>
					<td><%= rs.getString("reg_date") %></td>
				</tr>
				<%
					}
				}catch(Exception ex){
					out.println(ex.getMessage());
				}finally{
					if(rs != null){ 
						try{rs.close();} catch(Exception e){};
					}
					if(ps != null){ 
						try{rs.close();} catch(Exception e){};
					}
					if(conn != null){ 
						try{rs.close();} catch(Exception e){};
					}
				}
				%>
			</tbody>
		</table>
	
	</div>
	
</body>
</html>