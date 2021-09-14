package kr.co.jboard2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jboard2.dao.MemberDao;
import kr.co.jboard2.service.CommonService;
import kr.co.jboard2.vo.MemberVo;

public class LoginService implements CommonService{
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
	if (req.getMethod().equals("GET")) {
		return "/user/login.jsp";
		}else {
			
			String uid = req.getParameter("uid");
			String pass = req.getParameter("pass");
			
			MemberVo vo =MemberDao.getInstance().selectMember(uid, pass);
		
			if (vo != null) {
				//ȸ���� ���� ��� -> ����� ������ü ���� ������ ����Ʈ �����̷�Ʈ
				HttpSession sess =req.getSession();
				sess.setAttribute("sessMember", vo);
				
				return "redirect:/list.do";
			}else {
				//ȸ�� �ƴ� ��� -> �ٽ� �α��� ������ �����̷�Ʈ
				return "redirect:/user/login.do?success=100";
			}
		}
	}
}
