package kr.co.jboard2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.dao.MemberDao;
import kr.co.jboard2.service.CommonService;
import kr.co.jboard2.vo.TermsVo;

public class TermsService implements CommonService{
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		TermsVo vo =MemberDao.getInstance().selectTerms();
		//terms.jsp�� �̿��� ������ ����ؾ��ϹǷ�
		req.setAttribute("vo", vo);
		
		
		return "/user/terms.jsp";
	}
}
