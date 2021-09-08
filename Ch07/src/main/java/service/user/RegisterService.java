package service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import model.CommonService;
import vo.UserVo;

public class RegisterService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		
		if(req.getMethod().equals("GET")) {
			return "/user/register.jsp";
		}else {
			
			String uid = req.getParameter("uid");
			String name = req.getParameter("name");
			String hp = req.getParameter("hp");
			String age = req.getParameter("age");
			
			UserVo vo = new UserVo();
			vo.setUid(uid);
			vo.setName(name);
			vo.setHp(hp);
			vo.setAge(age);
			
//			Dao 실행 
			UserDao.getInstance().insertUser(vo);
			
			
//			리다이렉트 명령을 내려야함 (Controller가 Client에 response해주기때문) -> Controller로 return 값이 전달됨.
			return "redirect:/user/list.do";
		}
		
	}

}
