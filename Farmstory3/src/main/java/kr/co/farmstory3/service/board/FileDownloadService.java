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
		
		//���� �ٿ�ε� ī��Ʈ +1
		
		
		//����������������
		FileVo fvo =ArticleDao.getInstance().selectFile(fseq);
		
		//Controller���� ���ϰ�ü �����ϱ�����
		req.setAttribute("fvo", fvo);
		
		//Controller���� ���ϱ�� ������ ���� ���ڿ�
		return "file:";
	}

}
