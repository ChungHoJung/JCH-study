package kr.or.nextit.mber.service.impl;

import java.util.HashMap;

import kr.or.nextit.member.service.MemberVo;


public class MapTest {

	public static void main(String[] args) {
		
		HashMap<String, Object> parameterType = new HashMap<>();
		parameterType.put("merberVo",new MemberVo());
		parameterType.put("userId","user");
		
		HashMap<String, Object> resultType = new HashMap<>();
		
		MemberVo member = new MemberVo();
		member.setUserId("");
		
		HashMap<String, Object> vo = new HashMap<>();
		vo.put("userId", member.getUserId());
	}

}
