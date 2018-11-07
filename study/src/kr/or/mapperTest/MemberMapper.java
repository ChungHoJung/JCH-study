package kr.or.mapperTest;

import kr.or.nextit.member.service.MemberVo;

public interface MemberMapper {
	
	public MemberVo selectMember(String userId) throws Exception;
}

// 요청 , 서블릿, 비지니스 레이어(service intf,impl),
// 데이터레이어(인터페이스, mapeer , xml) , dbms , mapper, 비지니스 레이어 -> 서블릿 jsp

// mvc  mapper(데이터 레이어 작업-> 구현체 생성)
//, view(jsp로 마지막에 뿌려주는 것) ,controller(비즈니스 레이어) 

// 서블릿 요청
