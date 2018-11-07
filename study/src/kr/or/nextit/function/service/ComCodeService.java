package kr.or.nextit.function.service;

import java.util.List;

import kr.or.nextit.common.error.BizException;

public interface ComCodeService {
	
	/*	groupId를 가지고서 비지니스 플로우를 처리하는 기능으로
	 공통 코드 리스트를 반환	*/
	public List<CommCodeVo> getCodeList(String groupId);
	
	public CommCodeVo getCodeName(String codeKey);
	
	public void getErrorTest(String testValue) throws Exception;
	
	public void getErrorTest2(String testValue) throws Exception;
	
	public void getBizErrorTest(String testValue) throws BizException;
	
	public void getBizErrorTest2(String testValue) throws Exception;
	
	public void getBizErrorTest3(String testValue) throws Exception;
	
	public List<CommCodeVo> getIpList() throws Exception;
	
	public CommCodeVo getIpItem(String clientIp) throws Exception;
	
}
