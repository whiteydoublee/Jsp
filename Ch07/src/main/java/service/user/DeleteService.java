package service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import model.CommonService;

public class DeleteService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String uid = req.getParameter("uid");
		UserDao.getInstance().deleteUser(uid);
		
		return "redirect:/user/modify.do";
	}

}
