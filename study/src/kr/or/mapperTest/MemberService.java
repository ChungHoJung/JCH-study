package kr.or.mapperTest;

import kr.or.nextit.member.service.MemberVo;
public interface MemberService {
	
	public MemberVo getSelectMember(String userId) throws Exception;
}
