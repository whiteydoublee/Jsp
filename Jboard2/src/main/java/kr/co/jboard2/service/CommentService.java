package kr.co.jboard2.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.dao.ArticleDao;
import kr.co.jboard2.vo.ArticleVo;

public class CommentService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String parent = req.getParameter("parent");
		String uid = req.getParameter("uid");
		String content = req.getParameter("content");
		String regip = req.getRemoteAddr();
		
		ArticleVo vo = new ArticleVo();
		vo.setParent(parent);
		vo.setContent(content);
		vo.setUid(uid);
		vo.setRegip(regip);
		
		ArticleDao.getInstance().insertComment(vo);
		
		return "redirect:/view.do?seq="+parent;
	}
	
}
