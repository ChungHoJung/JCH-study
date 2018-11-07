package kr.or.mapperTest;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.nextit.jdbc.MybatisSqlSessionFactory;
import kr.or.nextit.member.service.MemberVo;

public class MemberServiceImpl implements MemberService {
	
	private SqlSessionFactory sessionFactory = MybatisSqlSessionFactory.getSqlSessionFactory();
	
	private	MemberMapper memberMapper;
	
	@Override
	public MemberVo getSelectMember(String userId) throws Exception {
		// TODO Auto-generated method stub
		SqlSession session = null;
		
		MemberVo result;
		try {
			session = sessionFactory.openSession();	
			memberMapper = session.getMapper(MemberMapper.class);	
			result = memberMapper.selectMember(userId);
			
			return result;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.err.println(e.getMessage());
			
			return null;
			
		}finally {
			if(session != null) {
				try {
					session.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.err.println(e.getMessage());
				}
				
			}
		}
	
		
		
	}

}
