package kr.co.farmstory3.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.co.farmstory3.dao.MemberDao;
import kr.co.farmstory3.service.CommonService;

public class CheckNick implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		//전송데이터 수신
		String nick = req.getParameter("nick");
		
		int count = MemberDao.getInstance().selectCountUserInfo(2, nick);
		
		JsonObject json = new JsonObject();
		json.addProperty("result", count);
		
		return "json"+json.toString();
	}

}
