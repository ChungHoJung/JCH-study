package kr.or.nextit.board.service;

import java.util.List;

public interface BoardService {

	/**
	 * Board 글 등록 ~~
	 * @param boardVo
	 * @return
	 * @throws Exception
	 */
	public boolean InsertboardItem(
			BoardVo boardVo
			) throws Exception;
	
	/**
	 * Board List 구현
	 * @param boardvo
	 * @return
	 * @throws Exception
	 */
	public List<BoardVo> getBoardList(
			BoardVo boardvo
			) throws Exception;
	
	
	/**
	 * 1건을 가지고 오는 녀석
	 * @param boardVo
	 * @return
	 * @throws Exception
	 */
	public BoardVo getBoardItem(
			BoardVo boardVo
			) throws Exception;
	
	
	/**
	 * seqNo 삭제 하는 기능....
	 * @param seqNo
	 * @throws Exception
	 */
	public void deleteBoardItem(
				String seqNo
			) throws Exception;
	
	
	/**
	 * 제목과 내용을 수정...
	 * @param params
	 * @throws Exception
	 */
	public void updateBoardItem(
			BoardVo params
			) throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
