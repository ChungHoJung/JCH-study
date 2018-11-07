<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.*" %>
<%@ page import= "kr.or.nextit.function.MemberUtil" %>


<%
//response.setCharacterEncoding("UTF-8");
request.setCharacterEncoding("UTF-8");


	String name = "";
	int age = -1;
	String gender = "";
	
	try{
		name = request.getParameter("name");
		age = Integer.parseInt(request.getParameter("age"));
		gender = request.getParameter("gender");
		
	}catch(Exception ex){
		String error;
		error = String.format("에러 발생 :  %s <br>", ex.getMessage());
		out.print(error);
	}
	
	
	
	
%> 


<%!public String dispalyGender(String gender){
	
	String result = null;
	
	if("M".equals(gender)){
		result = String.format("남성(%s)", gender);
	}else if("W".equals(gender)){
		result = String.format("여성(%s)", gender);
	}
	
	else{
		//중성
		result = String.format("중성(%s)", gender);
	}
		return result;
}

public String displayAge(int age){
	String result = null;
	if(age<=18){
		result = String.format("미성년자 (%d)",age);
	}else{
		result = String.format("성인 (%d)",age);
	}
	
	return result;
}
%>
   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<pre>
	취미 : <%=request.getParameter("hobby") %>
	
	취미 : (name 값이 1개 이상일 경우 배열로 넘어옴) 
	<% String[] hobby = request.getParameterValues("hobby");

	List<HashMap<String,Object>> hobbyItems = MemberUtil.getDisplayHobbyList();
			for(String ho : hobby){
				for(HashMap<String,Object> item : hobbyItems){
					String key = (String)item.get("key");
					if(ho.equals(key)){
						String di = null;
						di = String.format("당신의 취미는 %s (%s) <br>" , item.get("display"), item.get("key"));
						out.print(di);
						break;
					}
				}
			}
	%>



		<%List<String> hobbyDisplay = MemberUtil.getHobby(hobby); 
			for(String item : hobbyDisplay){
				out.print(item);
			}
		%>
		
		
		
</pre>
	이름: <%=name %><br>
	
	성별: <%=dispalyGender(gender)%> <br>
	
	나이1: <%=MemberUtil.getDisplayAge(age) %> <br>
		
	나이2: <% out.print(displayAge(age)); %>
	
	<pre>
		<%
		Enumeration<String> params = request.getParameterNames();
	
		while(params.hasMoreElements()){ 	// params 요소의 첫번째부터 마지막 까지
			String key = params.nextElement();	
			
			//out.println(key);
			String result = "";
			String value = request.getParameter(key);
			result = String.format("parameter key = %s : value = %s",key , value);
			out.println(result);
		}
		%>
	</pre>
</body>
</html>