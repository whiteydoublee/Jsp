package kr.co.farmstory3.service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory3.dao.ArticleDao;
import kr.co.farmstory3.service.CommonService;

public class DeleteService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String group=req.getParameter("group");
		String cate=req.getParameter("cate");
		
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		
		String seq = req.getParameter("seq");
		
		ArticleDao.getInstance().deleteArticle(seq);
		
		return "/board/list.do?group="+group+"&cate="+cate;
	}

}
