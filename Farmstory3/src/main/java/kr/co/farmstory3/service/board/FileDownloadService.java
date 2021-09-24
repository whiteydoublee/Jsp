package kr.co.farmstory3.service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory3.dao.ArticleDao;
import kr.co.farmstory3.service.CommonService;
import kr.co.farmstory3.vo.FileVo;

public class FileDownloadService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		String fseq = req.getParameter("fseq");
		
		//파일 다운로드 카운트 +1
		
		
		//파일정보가져오기
		FileVo fvo =ArticleDao.getInstance().selectFile(fseq);
		
		//Controller에서 파일객체 참조하기위해
		req.setAttribute("fvo", fvo);
		
		//Controller에서 파일기능 실행을 위한 문자열
		return "file:";
	}

}
