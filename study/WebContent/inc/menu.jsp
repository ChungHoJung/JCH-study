<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<% request.setCharacterEncoding("UTF-8"); %>
	<% request.setAttribute("name", "ㅇㅎㅇ"); %>
	<% request.setAttribute("name1",  1); %>
	<% request.setAttribute("name2",  0.11255); %>

	<%	
	HashMap<String,Object> item = new HashMap();
	item.put("test","문자열");	
	item.put("Integer","88");	
	%>
	
	<% request.setAttribute("item",  item); %>
	
	
	<pre>
<%-- 		<%= nextit %>  --%>
<%-- 		${nextit} --%>
		
	메뉴를 구성해주세요
	<%= request.getParameter("test") %>
	
	el tag : ${param.test}
	request.setAttribute el tag : ${name}
	request.setAttribute el tag : ${name1}
	request.setAttribute el tag : ${name2}
	
	request.setAttribute Map : ${item.test}
	request.setAttribute Map : ${item.Integer}
	</pre>