


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("utf-8"); %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DBCP TEST</title>

<jsp:include page="/inc/lib.jsp"></jsp:include>

</head>
<body>
	<jsp:include page="/inc/navbar.jsp"></jsp:include>
	
	<h1> 작업 DBCP </h1>
	<%
		//1. 드라이버 로딩
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		long startTime = System.currentTimeMillis();
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2. 연결설정
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
												"java",
												"oracle");		
			
			StringBuilder sql = new StringBuilder();
			sql.append(" select * from tb_member ");
			sql.append(" where mem_id = ? ");
			sql.append(" and mem_pw = ? ");
			
			
			// 3. 구문 객체 생성
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, request.getParameter("mem_id"));
			pstmt.setString(2, request.getParameter("mem_pw"));
	
			// 4. 구문 객체 실행
			rs = pstmt.executeQuery();
			
			//비즈니스 로직
			if(rs.next()){
				out.print(rs.getString("mem_id"));
				out.print(rs.getString("mem_pw"));
				out.print(rs.getString("mem_addr"));
			}
			

	%>
	
	<% 
		}catch(SQLException ex){
			out.println(ex.getMessage());
			ex.printStackTrace();
		}finally{
			// 6. 자원 해제
			if(rs != null)
				try{
					rs.close();
				}catch(SQLException ex){}
			if(pstmt != null)
				try{
					pstmt.close();
				}catch(SQLException ex){}
			
			// 7. 연결종료(제일 중요)
			if(conn!=null)
				try{
					conn.close();
				}catch(SQLException ex){}
			
		}
	%>
	
	걸린시간 :
	<%=System.currentTimeMillis() - startTime %>ms
	
		
</body>
</html>