package kr.co.jboard2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.co.jboard2.dao.MemberDao;
import kr.co.jboard2.service.CommonService;

public class CheckUidService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String uid =req.getParameter("uid");
		
		int count = MemberDao.getInstance().selectCountUid(uid);
		
		//Json 데이터 생성
		JsonObject json = new JsonObject();
		json.addProperty("result", count);
		
		//Json 데이터 문자열 출력
		return "json:"+json.toString();
	}

}
