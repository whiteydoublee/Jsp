package kr.co.farmstory3.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory3.dao.MemberDao;
import kr.co.farmstory3.service.CommonService;
import kr.co.farmstory3.vo.TermsVo;

public class TermsService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		
		TermsVo vo = MemberDao.getInstance().selectTerms();
		
		//terms.jsp에 약관 출력해야하므로 
		req.setAttribute("vo", vo);
		
		return "/member/terms.jsp";
	}
	
}
