package kr.co.jboard2.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ModifyService implements CommonService{
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		return "/write.jsp";
	}

}
