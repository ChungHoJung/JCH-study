<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구구단</title>
</head>
<body>
	<% 
		for(int i=1; i<=9; i++){
			out.print(i+"단<br>");
			for(int dan=1; dan<=9; dan++){
				out.print(i + " * " + dan + " ="  +   i * dan + "<br>"); 
			}
			out.print("<br>");
		}
	%>
</body>
</html>