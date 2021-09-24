package kr.co.farmstory3.service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.farmstory3.service.CommonService;
import kr.co.farmstory3.dao.ArticleDao;
import kr.co.farmstory3.vo.ArticleVo;
import kr.co.farmstory3.vo.MemberVo;

public class ListService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		// TODO Auto-generated method stub
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		String includeFile="./_aside"+group+".jsp";
		
		req.setAttribute("includeFile", includeFile);
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		
		
		
		HttpSession sess = req.getSession();
		MemberVo sessMember = (MemberVo) sess.getAttribute("sessMember");
		
		if (sessMember == null) {
			
			return "redirect:/member/login.do?success=102";
		}
			else {
			String pg = req.getParameter("pg");
			//������ ó��
			//pg �ĸ����� ���� �������� ������ null ���̹Ƿ� error �߻� 
			int currentPage = getCurrentPageNum(pg);
			int total = ArticleDao.getInstance().selectCountTotal();
			int lastPageNum = getLastPageNum(total);
			int start = getLimitStart(currentPage);
			int pageStartNum = getPageStartNum(total,start);
			int []groups = getPageGroup(currentPage, lastPageNum);
			
			List<ArticleVo> articles = ArticleDao.getInstance().selectArticles(cate,start);
			req.setAttribute("articles", articles);
			req.setAttribute("lastPageNum", lastPageNum);
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("pageStartNum", pageStartNum);
			req.setAttribute("groups", groups);
			return "/board/list.jsp";
		}
		
	}

public int getPageStartNum(int total, int start) {
	return (total-start);
}

public int getCurrentPageNum(String pg) {
	if(pg==null) {
		pg="1";
	}
	return Integer.parseInt(pg);
}

public int getLastPageNum(int total) {
	int lastPageNum = 0; // 10�� ���ʰ��ϴ� ���, 1�������� �ä� ���ܾ��ϹǷ� +1
	
	if (total %10 == 0){
		lastPageNum = total /10;
	}else{
		lastPageNum = total / 10 +1;
	}
	return lastPageNum;
}

public int getLimitStart(int currentPage) {
	return (currentPage -1)*10;
}

public int[] getPageGroup(int currentPage, int lastPageNum) {
	
	int groupCurrent= (int) Math.ceil(currentPage/10.0); // �Ǽ��� ���� (1~10pg: 1/ 11~20: 2//): �������� �׷����� ����.
	int groupStart = (groupCurrent-1)*10+1;
	int groupEnd= groupCurrent*10;
	
	if(groupEnd>lastPageNum){
		groupEnd=lastPageNum;
	}
	
	int[] groups = {groupStart, groupEnd};
	
	return groups;
}

}
