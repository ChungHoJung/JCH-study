<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.or.nextit.login.service.*" %>

<% request.setCharacterEncoding("UTF-8"); %>

<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="<%= request.getContextPath() %>/">
          		${loginInfo.userName } 님 프로젝트
          </a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="<%=request.getContextPath()%>">Home</a></li>
            <li><a href="<%=request.getContextPath()%>/02/reqForm.jsp">About</a></li>
            <li><a href="<%=request.getContextPath()%>/03/include.jsp">Contact</a></li>
            <li><a href="<%=request.getContextPath()%>/05/bufferTest.jsp">Buffer</a></li>
            <li><a href="<%=request.getContextPath()%>/06/fileRead.jsp">fileRead</a></li>
            <% 
            	LoginVO loginvo = (LoginVO)session.getAttribute("loginInfo"); 
				if(loginvo == null){            
            %>
            <li><a href="<%=request.getContextPath()%>/13/loginForm.jsp">로그인</a></li>
            <li><a href="<%=request.getContextPath()%>/14/memberInsertForm.jsp">회원가입</a></li>
			<% 
				}else{
			%>            	
            <li><a href="<%=request.getContextPath()%>/11/logoutProc.jsp"> 
            	${loginInfo.userName}로그아웃
           	</a></li>
           	
           	<li><a href="<%=request.getContextPath()%>/14/memberListForm.jsp"> 
            	${loginInfo.userName}회원관리
           	</a></li>
            <%
				}
            %>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
   <% 
   	  out.flush(); 
   	  out.clearBuffer();
   %>