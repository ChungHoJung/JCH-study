package kr.or.nextit.servlet;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.nextit.common.web.IController;

@WebServlet(name="comBoardServlet", urlPatterns="*.do")
public class ComBoardServlet extends HttpServlet {
	
	private Map<String, IController> controllerMap = new HashMap<>();
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("ComBoardServlet.init()");
		// 클래스에서 프로퍼티파일 검색
		ResourceBundle bundle = ResourceBundle.getBundle("ComBoardMapper");
		
		// resource file(*.properties) 파일의 키값만 가지고 옴
		Enumeration<String> keys = bundle.getKeys();
		
		
		// 가지고 온 키 값의 목록을 갯수 만큼 반복함(while)
		while(keys.hasMoreElements()) {
			//trim() : 빈 공간 띄어 쓰기가 되어 있으면 제거 하고, 해당하는 값을 가지고옴
			String key = keys.nextElement().trim();
			// key 값에 해당하는 녀석의 value 값을 가지고 옴
			String value = bundle.getString(key).trim();
			
			try {
				// class.forName 으로 인터페이스에 해당하는 객체를 찾아서
				// 인스턴스를 생성함 ( controller 변수에 생성)
				IController controller = (IController) Class.forName(value).newInstance();
				
				//controllerMpa 객체에 등록
				//(map.put 프로퍼티 파일 키, 생성된 인스턴스 객체)
				controllerMap.put(key, controller);
				
				System.out.printf(" %s 의 컨트롤 등록 %s",key,value);
			}catch( ClassNotFoundException | InstantiationException
					| IllegalAccessException ex) {
				ex.printStackTrace();
				System.err.println(ex.getMessage());
				throw new ServletException(ex);
				
			}
		}
	}
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		try {
		// 2. 사용자의 요청을 분석(URI 분석)
		String uri = req.getRequestURI();
		System.out.printf("사용자 요청 URI : %s", uri);
		
		// was contextPast 를 제거 해줌
		uri = uri.substring(req.getContextPath().length());
		System.out.printf("변경된 uri : %s", uri);
		
		Set<String> keys =  controllerMap.keySet();
		
		// properties 파일에서 uri 에서 요청된 값이 등록 되었는지 true/flase 값을 반환
		if(controllerMap.containsKey(uri)) {
			
		for(String key : keys) {
			System.out.printf("key : %s" , key);
			
				if(uri.equals(key)) {
					IController controller =  controllerMap.get(key);
					String viewPage = controller.process(req, resp);
					
					
					if(controller.isRedirect()) {
						resp.sendRedirect(viewPage);
					}else {
					RequestDispatcher dispathcer = req.getRequestDispatcher(
							String.format("/WEB-INF/view%s.jsp",viewPage));
					dispathcer.forward(req, resp);
					}
				}else {
					// 요청에 대한 컨트롤러가 없는 경우 404 에러
					resp.setStatus(HttpServletResponse.SC_NOT_FOUND);	
				}
				
			}
		}
				}catch (Exception e) {
				e.printStackTrace();
			}
		
		}
	}

