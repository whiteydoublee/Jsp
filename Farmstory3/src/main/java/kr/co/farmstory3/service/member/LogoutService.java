package kr.co.farmstory3.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.farmstory3.service.CommonService;

public class LogoutService implements CommonService{
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		//���ǿ��� ����� ������ü ����
		HttpSession sess =req.getSession();
		sess.invalidate();
		
		return "redirect:/member/login.do?success=101";
	}
}
