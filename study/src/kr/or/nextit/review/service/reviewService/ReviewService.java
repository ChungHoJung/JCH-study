package kr.or.nextit.review.service.reviewService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import kr.or.nextit.function.MemberUtil;
import kr.or.nextit.function.service.CommCodeVo;


public class ReviewService {
	
	public void getRequestTest(HttpServletRequest request) {
		List<String> member = new ArrayList();
		member.add("ㅎㅇ1");
		member.add("ㅎㅇ2");
		member.add("ㅎㅇ3");
		member.add("ㅎㅇ4");
		member.add("ㅎㅇ5");
		
		request.setAttribute("memberList", member);
	}
	
	public static void getRequestCodeTest(HttpServletRequest req){
		
		List<ReViewVo> result = new ArrayList<>();
		

		result.add(new ReViewVo("001","모니터"));
		result.add(new ReViewVo("002","키보드"));
		result.add(new ReViewVo("003","의자"));
		result.add(new ReViewVo("004","마우스"));
		result.add(new ReViewVo("005","책상"));
		
		req.setAttribute("codeList", result);
	}
	
	public HashMap<String,Object> getReqestParamsTest(HttpServletRequest request){
		
		HashMap<String, Object> result = new HashMap<>();
		
		String name = request.getParameter("userName");
		int age = Integer.parseInt(request.getParameter("userAge"));
		
		System.out.println(name);
		System.out.println(age);
		
		result.put("uName",name);
		result.put("uAge",age);
		
		List<CommCodeVo> hobbyItems = MemberUtil.getHobbyItems();
		
		result.put("hobbyList",hobbyItems);
		
		return result;
	}
	
	// 선택한 목록을 내용 (key) 값의 배열로 반환 구현
	public String[] selectHobby(String[] selectHobby) {
		
		
		List<CommCodeVo> items = MemberUtil.getHobbyItems();
		int i=0;
		
		for(String selectItem : selectHobby) {
			for(CommCodeVo item : items ){
				if(selectItem.equals(item.getKey())) {
					selectHobby[i] = String.format("%s (%s) 선택한 취미",item.getKey(), item.getValue());
					i++;
				}
			}
			break;
		}
		
		return selectHobby;
	}
}
