package kr.co.jboard2.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.jboard2.dao.ArticleDao;
import kr.co.jboard2.vo.ArticleVo;


public class WriteService implements CommonService{
	
	private String path = null;
	
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		if(req.getMethod().equals("GET")){
			return "/write.jsp";
		}else {
			
			MultipartRequest mReq=getMultipartRequest(req);
			
			String title = mReq.getParameter("title");
			String content = mReq.getParameter("content");
			String uid = mReq.getParameter("uid");
			String fname = mReq.getFilesystemName("fname");
			String regip = req.getRemoteAddr();
			
			ArticleVo vo = new ArticleVo();
			vo.setTitle(title);
			vo.setContent(content);
			vo.setFile(fname== null?0:1);
			vo.setUid(uid);
			vo.setRegip(regip);
			
			
			int seq= ArticleDao.getInstance().insertArticle(vo);
			
			if(fname != null) {
				//파일 첨부 이후, 이름 수정하고 INSERT
				String newName = renameFile(fname, uid);
				//파일테이블 INSERT
				ArticleDao.getInstance().insertFile(seq, fname, newName);
			}
			
			
			return "redirect:/list.do";
		}
	}//reqProc
	
	public MultipartRequest getMultipartRequest (HttpServletRequest req) {
		MultipartRequest mReq=null;
		
		try {
			 path =req.getServletContext().getRealPath("/file");
			int maxSize = 1024* 1024 *10; // 최대 파일 허용 크기 10MB
			
			 mReq = new MultipartRequest(req, path, maxSize,"UTF-8", new DefaultFileRenamePolicy());
		
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return mReq;
		
	}
	
	public String renameFile(String fname, String uid) {
			//파일명 수정 
			int i = fname.lastIndexOf("."); // 인덱스 번호를 구해줌: IndexOf => .의 인덱스 번호를 찾아줌
			String ext = fname.substring(i);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_");
			String now = sdf.format(new Date());
			String newName = now+uid+ext;
			
			File oriFile = new File(path+"/"+fname);
			File newFile = new File(path+"/"+newName);
			
			oriFile.renameTo(newFile);
			return newName;
	
	}
}
