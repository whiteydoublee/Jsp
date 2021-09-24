package kr.co.farmstory3.service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory3.dao.ArticleDao;
import kr.co.farmstory3.service.CommonService;
import kr.co.farmstory3.vo.ArticleVo;

public class ModifyService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		String seq = req.getParameter("seq");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		req.setAttribute("seq", seq);
		
		ArticleDao dao = ArticleDao.getInstance();
		
		dao.updateArticle(title,content,seq);
		ArticleVo vo =dao.selectArticle(seq);
		
		return "/board/modify.jsp?group="+group+"&cate="+cate+"&seq="+seq;
	}

}
