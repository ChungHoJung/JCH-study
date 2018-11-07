package kr.or.nextit.board.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.nextit.board.service.BoardService;
import kr.or.nextit.board.service.BoardVo;
import kr.or.nextit.board.service.impl.BoardServiceImpl;
import kr.or.nextit.common.web.IController;
import kr.or.nextit.login.service.LoginVO;

public class BoardInsertProcController implements IController {

	private BoardService boardService = new BoardServiceImpl();
	
	
	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(
			HttpServletRequest req, 
			HttpServletResponse resp
		) throws Exception {

		BoardVo boardVo = new BoardVo();
		boardVo.setTitle(req.getParameter("title"));
		boardVo.setContents(req.getParameter("contents"));
		boardVo.setServiceType(req.getParameter("serviceType"));
		
		LoginVO loginInfo = (LoginVO) req.getSession().getAttribute("loginInfo");
		
		if (loginInfo != null) {
			boardVo.setRegUser(loginInfo.getUserName());
			boardVo.setUpUser(loginInfo.getUserName());
		} else {
			boardVo.setRegUser("guest");
			boardVo.setUpUser("guest");
		}
		
		boolean result = boardService.InsertboardItem(boardVo);
		
		if (result) {
			System.out.println("정상처리 되었습니다.");
		} else {
			System.err.println("에러가 발생하였습니다.");
		}
		
		return "/board/boardList.do";
	}

	
	
	
	
	
	
	
}
