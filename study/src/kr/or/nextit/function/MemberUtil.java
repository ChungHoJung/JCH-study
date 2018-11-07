package kr.or.nextit.function;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import kr.or.nextit.function.service.CommCodeVo;

public class MemberUtil {
	
	public List<CommCodeVo> getSexItems(){
		List<CommCodeVo> result = new ArrayList<>();
		result.add(new CommCodeVo("M", "남자"));
		result.add(new CommCodeVo("W", "여성"));
		
		return result; 
	}

	public static List<String> getHobby(String[] params) {
		List<String> result = new ArrayList<>();
		List<HashMap<String, Object>> hobbyList = getDisplayHobbyList();
		
		for(String hobby : params) {
			
			for(HashMap<String, Object> item: hobbyList) {
				String key = (String)item.get("key");
				if(hobby.equalsIgnoreCase(key)) {
					String dis = String.format("%s (%s)",item.get("display"), item.get("display"));
					result.add(dis);
				}
			}
		}
		
		return result;
	}
	

	
	
	public static List<CommCodeVo> getHobbyItems(){
		
		List<CommCodeVo> result = new ArrayList<>();
		
		CommCodeVo item = new CommCodeVo();
		item.setKey("H0001");
		item.setValue("잠꾸러기");
		result.add(item);
		
		item = new CommCodeVo();
		item.setKey("H0002");
		item.setValue("코파기");
		result.add(item);
		
		result.add(new CommCodeVo("H0003", "귀찮"));
		result.add(new CommCodeVo("H0004", "부지런"));
		
		
		
		return result;
	}
	
	
	/**
	 * 취미 목록 
	 * @return
	 */
	public static List<HashMap<String, Object>> getDisplayHobbyList(){
		
		List<HashMap<String, Object>> result  = new ArrayList<>();
		
		HashMap<String, Object> item = new HashMap<>();
		item.put("key","HO001");
		item.put("display","잠자기");
		
		result.add(item);
		
		item = new HashMap<>();
		item.put("key","HO002");
		item.put("display","여행");
		result.add(item);
		
		item = new HashMap<>();
		item.put("key","HO003");
		item.put("display","자전거");
		result.add(item);
		
		item = new HashMap<>();
		item.put("key","HO004");
		item.put("display","키우기");
		result.add(item);
		
		return result;
	}
	
	
	
	/**
	 * 미성년자 판단 및 나이 출력
	 * @param age
	 * @return
	 */
	public static String getDisplayAge(int age) {
		
		if(age<=18){
			return String.format("미성년자 (%d)",age);
		}else{
			return String.format("성인 (%d)",age);
		}
		
	}
}
