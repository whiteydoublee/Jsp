package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CommonService;
import model.HelloService;

public class MainController extends HttpServlet{
	//서블릿 식별 번호 (역할은 따로 없음)
	private static final long serialVersionUID = 1L;
	//init의 최종처리 결과
	private Map<String, Object> instances = new HashMap<>();
	
	//초기화 작업 (initialization)
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		//최초 요청시 실행되는 컨트롤러 초기화 메서드
		System.out.println("MainController init 실행!");
		
		//액션주소 프로퍼티 파일 경로 구하기 
		ServletContext ctx = config.getServletContext();
		String path = ctx.getRealPath("/WEB-INF")+"/urlMapping.properties";
		
		
		//프로퍼티 파일 입력스트림 연결 후 프로퍼티 객체 생성
		Properties prop = new Properties();
//		Map<String, String>map = new HashMap<>();
		
		try {
			FileInputStream fis = new FileInputStream(path);
			prop.load(fis);
			fis.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		//프로퍼티 객체로 서비스 객체생성 (iterator:반복자)
		//prop의 key 값 (keySet) 집합
		Iterator iter = prop.keySet().iterator();
		
		while(iter.hasNext()) {
			String k = iter.next().toString();
			String v = prop.getProperty(k);
			
			
			try { // 다형성을 이용
				Class obj = Class.forName(v);
				Object instance =obj.newInstance();
				
				instances.put(k, instance);
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}//init end...
	
	//Get방식
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
	}
	
	//Post방식
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		requestProc(req, resp);
	}
	
	protected void requestProc(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		//요청주소에서 key 구하기
		String path = req.getContextPath();
		String uri = req.getRequestURI();
		String key = uri.substring(path.length());
		
		// Map에서 Service 객체 꺼내기
//		Object instance = instances.get(key);
//		CommonService service = (CommonService) instances;
		CommonService instance = (CommonService) instances.get(key);
		
		// Service 객체 실행 후 결과 정보 받기
		String result = instance.requestProc(req, resp);
		if(result.startsWith("redirect:")) {
			//리다이렉트
			String redirectUrl = result.substring(9);
			resp.sendRedirect(path+redirectUrl);
			
		} else{
			// 해당 View로 forward 하기
			RequestDispatcher dispatcher = req.getRequestDispatcher(result);
			dispatcher.forward(req, resp);
		}
		
	}
}
