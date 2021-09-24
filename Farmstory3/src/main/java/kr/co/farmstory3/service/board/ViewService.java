package kr.co.farmstory3.service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory3.service.CommonService;
import kr.co.farmstory3.dao.ArticleDao;
import kr.co.farmstory3.vo.ArticleVo;

public class ViewService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");

		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		
		String seq = req.getParameter("seq");
		
		ArticleDao dao=ArticleDao.getInstance();
		
		ArticleVo vo = dao.selectArticle(seq);
		List<ArticleVo> comments =dao.selectComments(seq);
		req.setAttribute("vo", vo);
		req.setAttribute("comments", comments);
		
		return "/board/view.jsp?group="+group+"&cate="+cate+"&seq="+seq;
	}

}
