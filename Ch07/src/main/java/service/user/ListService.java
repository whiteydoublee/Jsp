package service.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import model.CommonService;
import vo.UserVo;

public class ListService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		List<UserVo> users = UserDao.getInstance().selectUsers();
		
		//컴포넌트간의 데이터 공유(View에서 해당 리스트 참조 후 출력해야하기 때문)
		req.setAttribute("users", users);
		
		
		return "/user/list.jsp";
	}

}
