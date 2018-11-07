package kr.or.nextit.mber.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.or.nextit.mber.service.MberVO;
public class MberServiceDao {
private static MberServiceDao instance = null;
	
	public static MberServiceDao getInstance() {
		if(instance == null) {
			instance = new MberServiceDao();
		}
		return instance;
	}
	
	public MberVO getMemberItem(Connection conn, String memId) throws SQLException {
		
		StringBuilder query = new StringBuilder();
		
		query.append("		SELECT		");
		query.append("		mem_id,		");
		query.append("		mem_pw,		");
		query.append("		mem_name,	");
		query.append("		mem_email,	");
		query.append("		mem_phone,	");
		query.append("		reg_date	");
		query.append("		FROM		");
		query.append("		tbb_member	");
		query.append("		where mem_id = ?	");
		
		
		PreparedStatement pstmt = conn.prepareStatement(query.toString());
		pstmt.setString(1, memId);
		
		ResultSet rs =  pstmt.executeQuery();
		
		MberVO result = null;
		
		if(rs.next()) {
			result = new MberVO();
			result.setMemId(rs.getString("mem_Id"));
			result.setMemName(rs.getString("mem_name"));
			result.setMemPhone(rs.getString("mem_phone"));
			result.setMemEmail(rs.getString("mem_email"));
			result.setMemPw(rs.getString("mem_pw"));
			result.setRegDate(rs.getString("reg_date"));
		}
		
		return result;
	}
	
	
	
	public int updateMemberItem(	
					Connection conn ,
					MberVO params) throws SQLException {
		
		StringBuilder query = new StringBuilder();
		query.append("	update tbb_member set	");
		query.append("	 mem_name =  ? 		,	");
		query.append("	 mem_pw =    ? 		,	");
		query.append("	 mem_email = ? 		,	");
		query.append("	 mem_phone = ? 		,	");
		query.append("	 reg_date = sysdate 	");
		query.append("	  where					");
		query.append("	 mem_id =  ?			");
		System.out.println(query.toString());
		
		
		PreparedStatement pstmt = conn.prepareStatement(query.toString());
		
		pstmt.setString(1, params.getMemName());
		pstmt.setString(2, params.getMemPw());
		pstmt.setString(3, params.getMemEmail());
		pstmt.setString(4, params.getMemPhone());
		pstmt.setString(5, params.getMemId());
		
		int result = pstmt.executeUpdate();
		
		return result;
	}
	
	public int deleteMemberItem(Connection conn, String memId) throws Exception {
		
		StringBuilder sql = new StringBuilder();
		sql.append("	DELETE FROM tbb_member	");
		sql.append("	WHERE					");
		sql.append("	mem_id = ?				");

		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		
		pstmt.setString(1, memId);
		
		return pstmt.executeUpdate();
	}
	
	
	
	
	

}
