<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.nextit.login.service.LoginVO"%>
<%@page import="kr.or.nextit.common.utils.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.*" %>
 <% request.setCharacterEncoding("utf-8"); %>
    
    <% 
    	request.setCharacterEncoding("utf-8");
    	
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	try{
    		
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		
    		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
					"java",
					"oracle");
    		
    		StringBuilder sql = new StringBuilder();
			sql.append(" select * from tbb_member ");
			sql.append(" where mem_id = ? ");
			sql.append(" and mem_pw = ? ");
			
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, request.getParameter("userId"));
			pstmt.setString(2, request.getParameter("userPw"));
			
			rs = pstmt.executeQuery();
			// 하나의 쿼리 select - > executerQuery();
			// select를 제외한 나머지 -> executeUpdate(); -> 반환값 int 정수값을 갖음
			
			if(rs.next()){
				LoginVO loginInfo = new LoginVO();
				loginInfo.setUserId(rs.getString("mem_id"));
				loginInfo.setUserName(rs.getString("mem_name"));
				loginInfo.setUserEmail(rs.getString("mem_email"));
				loginInfo.setResult(true);
				loginInfo.setMessage("정상 로그인");
				
				
				session.setAttribute("loginInfo", loginInfo);
				
			}else{
				session.invalidate();
			}
			
    		
    	}catch(SQLException ex){
    		out.print(ex.getMessage());
    		ex.printStackTrace();
    	}finally{
    		if(rs != null){
    			try{
    				rs.close();
    				
    			}catch(Exception ex){}
    		}
    		
    		if(pstmt != null){
    			try{
    				pstmt.close();
    				
    			}catch(Exception ex){}
    		}
    		if(conn != null){
    			try{
    				conn.close();
    				
    			}catch(Exception ex){}
    		}
    	}
    	
    	
    
    
    	CookieBox cookieBox = new CookieBox(request);
    	
    	String userRemember = request.getParameter("userRemember");
    	String userId = request.getParameter("userId");
    	String userPw = request.getParameter("userPw");
    	
    	if("y".equals(userRemember)){
			Cookie cId = CookieBox.createCookie("userId",userId,"/",60);
			Cookie cRemember = CookieBox.createCookie("userRemember",userRemember,"/",60);
			response.addCookie(cId);
			response.addCookie(cRemember);
			
		}else{
			Cookie cId = CookieBox.createCookie("userId", "","/",0);
			Cookie cRemember = CookieBox.createCookie
					("userRemember", "","/",0);			
			response.addCookie(cId);
			response.addCookie(cRemember);
		}
    	
    	
    %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<jsp:include page="/inc/lib.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/inc/navbar.jsp"></jsp:include>
	<pre>
	요청씬 id : ${param.userId }
	요청씬 pw : ${param.userPw }
	아이디 저장 유무 : ${param.userRemember }
	
	dd : ${loginInfo.userName}
	dd : ${loginInfo.userId}
	dd : ${loginInfo.userPw}
	
	
	
	
	<%-- <%
		LoginVO login = (LoginVO)request.getSession().getAttribute("loginInfo");
		out.print(login.getUserEmail());
		out.print(login.getUserPw());
		out.print(login.getUserRemember());
		
	%> --%>
	
		
	</pre>
</body>
</html>