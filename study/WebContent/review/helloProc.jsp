<%@page import="kr.or.nextit.function.service.CommCodeVo"%>
<%@page import="kr.or.nextit.review.service.reviewService.ReViewVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.*" %>
    <%@ page import = "kr.or.nextit.review.service.reviewService.ReviewService" %>
    <%@ page import = "kr.or.nextit.function.service.CommCodeVo" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<pre>
	
	<%
		ReviewService paramService = new ReviewService();
		HashMap<String,Object> hashMap =  paramService.getReqestParamsTest(request);
		
		
		out.println(hashMap.get("uName"));
		out.println(hashMap.get("uAge"));
		
		out.println(request.getParameter("userName"));		
		out.println(request.getParameter("userAge"));		
		
		List<CommCodeVo> hobby =  (List<CommCodeVo>)hashMap.get("hobbyList");
		
		String[] uHobby = request.getParameterValues("userHobby");
		
		for(String itemm : uHobby){
			for(CommCodeVo item : hobby){
				if(itemm.equals(item.getKey())){
					out.println(String.format("%s  (%s) 당신이 선택한 취미"
							, item.getValue()
							, item.getKey()));
					break;
				}else{
					out.println(String.format("%s  (%s)"
		 					,item.getValue()
		 					, item.getKey()));
				}
			}
		}
		
	%>
	
	===========================================================================
	코드 목록
	<%
		ReviewService.getRequestCodeTest(request);
		
		
		List<ReViewVo> cList = (List<ReViewVo>)request.getAttribute("codeList");
		
		
  		for(ReViewVo c : cList){
  			out.print(c.getName());
  			out.println(c.getCode());
  		}
	%>
	
	==========================================================================
	회원 목록:
		<%  
			ReviewService service = new ReviewService();
			service.getRequestTest(request);
			
			List<String> mList = (List<String>)request.getAttribute("memberList");
			out.println(mList);
				
			for(String value : mList){
				out.println(value);
			}
		%>
		
	==========================================================================
	
	나이 3 인 녀석이 넘어오면 "이벤트 당첨~~~~~~~~~~~" 문구 출력
	<%
		int age = Integer.parseInt(request.getParameter("userAge"));
		if(age == 3){
			out.println(String.format("%s 이벤트 당첨 !!", age));
		}else{
			out.println(String.format("%s 다 음 기 회 에 xxxxxxxxxxxxxx !!", age));
		}
		
		String result = (age == 3 ? "ㅊㅋ" : "ㄴㄴ");
		
		out.println(result);
	%>
	
	표현식 : <%= (age==3 ? "축하" : "다음") %>
	el == ${param.userAge == 3 ? "경축" : "꽝" }
	
	
	==========================================================================
	이름
	request.getParameter	: <%=request.getParameter("userName") %>
	el param	: ${param.userName}
	
	==========================================================================
	나이
	request.getParameter	: <%=request.getParameter("userAge") %>
	el param	: ${param.userAge}
	
	==========================================================================
	<% 
		request.setAttribute("testName", "객체 데이터 넣기"); 
		request.setAttribute("testAge", 50);
	%>
	
	request.setAttribute : <%=request.getAttribute("testName")%>
	el	request.setAttribute : 	${testName}
	el	request.setAttribute : 	${testAge}
	
	</pre>
</body>
</html>