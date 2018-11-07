<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page buffer="1kb" autoFlush="true"%>
    
    @@@autoFlush
    <br>
    - true : 버퍼가 다 찼을 경우 자동적으로 버퍼의 내용이 웹 브라우저에 출력되고, 출력 버퍼는 비워진다.
    <br>
	- false :  buffer 속성의 값을 none 으로 지정한 경우 autoflush 속성값을 false 로 지정할 수 없다.



    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<jsp:include page="/inc/lib.jsp"></jsp:include>

</head>
<body>
	<jsp:include page="/inc/navbar.jsp"></jsp:include>
	
	<div class = "container">
	
	<pre>
	out.isAutoFlush() : <%=out.isAutoFlush() %>
	<%
		out.flush();	// 버퍼의 내용을 내보냄
		out.clearBuffer();
		out.println(String.format("버퍼사이즈 %d" , out.getRemaining()));
		out.flush();
		out.clearBuffer();
	%>
	
<%-- 	 <% for(int i=0; i<1000; i++){
		
			out.println(out.getBufferSize());
			out.println(out.getRemaining());	//남은 크기
			out.println(i + "~~~~");
			
		if( (i % 5) == 0 ){
			out.clearBuffer();
		}else{
			out.flush();
			/* out.clearBuffer(); */	
		}
	}
	%>  --%>
	
		버퍼이용 구구단 
	<%	
		for(int i=1; i<=10; i++){
			for(int j= 1; j<=10; j++){
				
				out.println(String.format(" %d * %d = %d " , i , j , (i*j)));
				
				if(i!=5){
					out.clearBuffer();
				}
				else{
					out.flush();
				}
			}
		}
	%>
		<br>
		
	</pre>
		<% out.println(String.format( " 버퍼 사이즈 %d", out.getRemaining())); %>
	</div>
	
</body>
</html>
<% out.flush(); %>












