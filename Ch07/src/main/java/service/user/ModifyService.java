package service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import model.CommonService;
import vo.UserVo;

public class ModifyService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		// TODO Auto-generated method stub
		if (req.getMethod().equals("GET")) {
			String uid = req.getParameter("uid");
			UserVo vo = UserDao.getInstance().selectUser(uid);
			req.setAttribute("user", vo);
			
			return "/user/modify.jsp";
		}
	else {
		String uid = req.getParameter("uid");
		String name = req.getParameter("name");
		String hp = req.getParameter("hp");
		String age = req.getParameter("age");
		
		
		UserVo vo = new UserVo();
		vo.setUid(uid);
		vo.setName(name);
		vo.setHp(hp);
		vo.setAge(age);
		
		UserDao.getInstance().updateUser(vo);
		
		return "redirect:/user/list.do";
	}
	}

}
