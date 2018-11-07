package kr.or.nextit.function.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.nextit.function.service.CommCodeVo;

// 공통 코드 처리 하는 데이터 레이어 영역 클래스
public class ComCodeServiceDao {

	// ComcodeServiceDao instance 생성
	private static ComCodeServiceDao instance = null;

	/*
	 * instance가 null 일 경우 new instance 생성 return -> ComCodeServiceDao 생성된 instance
	 * 반환
	 */
	public static ComCodeServiceDao getInstance() {
		if (instance == null) {
			instance = new ComCodeServiceDao();
		}
		return instance;
	}

	/*
	 * 공통 코드 테이블에서 groupId 조건에 해당하는 값을 반환 데이터 베이스 연결 Connection 객체 param 값으로 받아옴 공통
	 * 코드 테이블에 들어갈 조건 list<CommCodeVo> 반환
	 */
	public List<CommCodeVo> selectCodeList(Connection conn, String groupId) throws SQLException {

		StringBuilder query = new StringBuilder();
		query.append(" 		select code_id, code_name from tb_com_code  	");
		query.append(" 		where group_id = ?  	");

		PreparedStatement pstmt = conn.prepareStatement(query.toString());
		pstmt.setString(1, groupId);

		ResultSet rs = pstmt.executeQuery();

		List<CommCodeVo> result = new ArrayList<>();
		while (rs.next()) {
			CommCodeVo item = new CommCodeVo(rs.getString("code_id"), rs.getString("code_name"));
			result.add(item);
		}

		return result;
	}

	// 데이터베이스에서 codeKey 값을 조건절로 찾아서 반환
	public CommCodeVo selectCodeName(Connection conn, String codeKey) throws SQLException {

		StringBuilder sql = new StringBuilder();
		sql.append("	SELECT		");
		sql.append("	group_id,	");
		sql.append("	code_id	,	");
		sql.append("	code_name,	");
		sql.append("	reg_date	");
		sql.append("	FROM		");
		sql.append("	tb_com_code		");
		sql.append("	where code_id = ?  ");

		System.out.println(sql.toString());
		System.out.println(codeKey);
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		pstmt.setString(1, codeKey);

		ResultSet rs = pstmt.executeQuery();

		CommCodeVo codeResult = null;
		if (rs.next()) {
			codeResult = new CommCodeVo(rs.getString("code_id"), rs.getString("code_name"));
		}
		return codeResult;
	}
}
