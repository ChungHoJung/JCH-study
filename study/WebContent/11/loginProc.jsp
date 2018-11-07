<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.nextit.login.service.LoginVO"%>
<%@page import="kr.or.nextit.common.utils.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.*" %>
    
    <% 
    	request.setCharacterEncoding("utf-8");
    
    	List<LoginVO> memberList = new ArrayList();
    	memberList.add(new LoginVO("홍길동","master","12345","master@naver.com"));
    	memberList.add(new LoginVO("이영애","admin","12345","admin@naver.com"));
    	memberList.add(new LoginVO("박촌순","user","12345","user@naver.com"));
    	memberList.add(new LoginVO("말자","biz","12345","biz@naver.com"));
    	memberList.add(new LoginVO("철수","total","12345","total@naver.com"));
    
    
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
</head>
<body>
	<pre>
	요청씬 id : ${param.userId }
	요청씬 pw : ${param.userPw }
	아이디 저장 유무 : ${param.userRemember }
		<%
		
			// session -> 서버에서 내려줌 
		/* 	out.println(session.getId());
			out.println(session.getCreationTime());
			out.println(session.getLastAccessedTime()); */
			
			for(LoginVO loginInfo : memberList){
				/* out.println(loginInfo.getUserId());
				out.println(loginInfo.getUserPw()); */
				if(userId.equals(loginInfo.getUserId()) && userPw.equals(loginInfo.getUserPw())){
					
					loginInfo.setResult(true);
					loginInfo.setMessage("로그인 성공 ~~~~");
					
					session.setAttribute("loginInfo", loginInfo);
					// (위 선언과 같은 방법)
					//request.getSession().setAttribute("loginInfo", loginInfo);
					
					// 아이디 번호 일치 
					break;
				}else{
					// sesssion을 완전히 초기화 시킴 
					/* session.invalidate();  -> 절대 반복문 안에 쓰지 말것..*/
					
					
					session.setAttribute("loginInfo", null);
					session.removeAttribute("loginInfo");
				}
			}
			
			response.sendRedirect(String.format(" %s /11/loginForm.jsp", 
					request.getContextPath()));
			
			
		%>
		
	</pre>
</body>
</html>