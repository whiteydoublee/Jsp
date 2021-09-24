package kr.co.farmstory3.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.co.farmstory3.dao.MemberDao;
import kr.co.farmstory3.service.CommonService;

public class CheckHp implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		//전송데이터 수신
		String hp = req.getParameter("hp");
		
		int count = MemberDao.getInstance().selectCountUserInfo(4, hp);
		
		JsonObject json = new JsonObject();
		json.addProperty("result", count);
		
		return "json"+json.toString();
	}

}
