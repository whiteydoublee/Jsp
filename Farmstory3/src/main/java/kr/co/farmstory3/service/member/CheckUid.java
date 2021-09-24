package kr.co.farmstory3.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.co.farmstory3.dao.MemberDao;
import kr.co.farmstory3.service.CommonService;

public class CheckUid implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		//전송데이터 수신
		String uid = req.getParameter("uid");
		
		int count = MemberDao.getInstance().selectCountUserInfo(1, uid);
		
		//Json출력
		JsonObject json = new JsonObject();
		json.addProperty("result", count);
		
		return "json"+json.toString();
	}

}
