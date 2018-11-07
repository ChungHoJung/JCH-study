package kr.or.nextit.mber.service;

public interface MberService {
	
	// 회원 상세 정보
	public MberVO getMemberItem(String memId);
	
	// 회원 정보 수정
	public MberVO updateMemberItem(String memId, 
									String memPw,
									String memName,
									String memPhone,
									String memEmail);
	// 회원 정보 삭제
	public boolean deleteMemberItem(String memId);
}
