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
	//���� �ĺ� ��ȣ (������ ���� ����)
	private static final long serialVersionUID = 1L;
	//init�� ����ó�� ���
	private Map<String, Object> instances = new HashMap<>();
	
	//�ʱ�ȭ �۾� (initialization)
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		//���� ��û�� ����Ǵ� ��Ʈ�ѷ� �ʱ�ȭ �޼���
		System.out.println("MainController init ����!");
		
		//�׼��ּ� ������Ƽ ���� ��� ���ϱ� 
		ServletContext ctx = config.getServletContext();
		String path = ctx.getRealPath("/WEB-INF")+"/urlMapping.properties";
		
		
		//������Ƽ ���� �Է½�Ʈ�� ���� �� ������Ƽ ��ü ����
		Properties prop = new Properties();
//		Map<String, String>map = new HashMap<>();
		
		try {
			FileInputStream fis = new FileInputStream(path);
			prop.load(fis);
			fis.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		//������Ƽ ��ü�� ���� ��ü���� (iterator:�ݺ���)
		//prop�� key �� (keySet) ����
		Iterator iter = prop.keySet().iterator();
		
		while(iter.hasNext()) {
			String k = iter.next().toString();
			String v = prop.getProperty(k);
			
			
			try { // �������� �̿�
				Class obj = Class.forName(v);
				Object instance =obj.newInstance();
				
				instances.put(k, instance);
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}//init end...
	
	//Get���
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
	}
	
	//Post���
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		requestProc(req, resp);
	}
	
	protected void requestProc(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		//��û�ּҿ��� key ���ϱ�
		String path = req.getContextPath();
		String uri = req.getRequestURI();
		String key = uri.substring(path.length());
		
		// Map���� Service ��ü ������
//		Object instance = instances.get(key);
//		CommonService service = (CommonService) instances;
		CommonService instance = (CommonService) instances.get(key);
		
		// Service ��ü ���� �� ��� ���� �ޱ�
		String result = instance.requestProc(req, resp);
		if(result.startsWith("redirect:")) {
			//�����̷�Ʈ
			String redirectUrl = result.substring(9);
			resp.sendRedirect(path+redirectUrl);
			
		} else{
			// �ش� View�� forward �ϱ�
			RequestDispatcher dispatcher = req.getRequestDispatcher(result);
			dispatcher.forward(req, resp);
		}
		
	}
}
