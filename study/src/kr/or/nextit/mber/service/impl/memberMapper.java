package kr.or.nextit.mber.service.impl;

import java.util.HashMap;
import java.util.List;

import kr.or.nextit.member.service.MemberVo;
// 회원 정보를 데이터 베이스에서 처리한 결과를 받아오는
// 데이터 레이어 처리 영역
public interface memberMapper {
	// 데이터 회원 정보를 목록으로 받아오는 기능
	// 마이바티스에서 자동으로 해쉬맵 형식으로 자동 처리 해주기 때문에 
	// memberMaaper.xml에서 파라미터와 결과값을 vo형식으로 처리
	public List<MemberVo> selectMemberList(MemberVo memberVo) throws Exception;
	
	
	
	// 선택된 정보(userId) 가지고 회원 정보를 가지고 오는 기능
	public MemberVo selectMemberItem(String userId) throws Exception;
	
	public HashMap<String,Object> selectMemberInfo(HashMap<String, Object> params) throws Exception;
	
	public List<HashMap<String,Object>> selectMemberInfoList(HashMap<String, Object> params) throws Exception;
}
