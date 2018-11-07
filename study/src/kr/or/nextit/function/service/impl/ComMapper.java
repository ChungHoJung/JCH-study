package kr.or.nextit.function.service.impl;

import java.util.List;

import kr.or.nextit.function.service.CommCodeVo;

public interface ComMapper {
	
	// 아이피 목록 조회
	public List<CommCodeVo> getIpList(CommCodeVo params) throws Exception; 
	
	public CommCodeVo getIpItem(CommCodeVo codeVo) throws Exception;
	
	// 요청된 ip가 데이터 베이스에 없을 경우 등록
	public void InsertIpItem(CommCodeVo paramCode) throws Exception;
}
