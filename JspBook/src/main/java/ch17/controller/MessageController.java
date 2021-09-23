package ch17.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MessageController
 */
@WebServlet("/MessageController")
public class MessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		requestPro(request, response); // �� �������� ��û�� ����
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		requestPro(request, response);
	}
	
	private void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ���������� �䱸�ϴ� �۾��� �м�
		String message = request.getParameter("message");
		
		//��û�� �۾� ó��
		Object result = null;
		if(message == null||message.equals("base")) {
			result="������";
		}else if (message.equals("name")) {
			result = "ȫ�浿�Դϴ�.";
		}else {
			result = "Ÿ���� ���� �ʽ��ϴ�.";
		}
		
		//���� ó�� ����� request ��ü�� �Ӽ��� ����
		request.setAttribute("result", result);
		
		//������ �並 ���� �� �ش� ��� ������
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ch17/messageView.jsp");
		dispatcher.forward(request, response);
		
	}

}
