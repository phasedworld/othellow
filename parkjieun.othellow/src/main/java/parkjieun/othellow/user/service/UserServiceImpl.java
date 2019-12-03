package parkjieun.othellow.user.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import parkjieun.othellow.user.dao.UserDao;
import parkjieun.othellow.user.domain.User;

@Service
public class UserServiceImpl implements UserService{
	@Autowired UserDao userDao;

	@Override
	public int addUser(User user) {
		return userDao.addUser(user);
	}

	@Override
	public User getUser(User user) {
		return userDao.getUser(user);
	}

	@Override
	public int idVerify(String userId) {
		return userDao.idVerify(userId);
	}

	@Override
	public int nicknameVerify(String userNickname) {
		return userDao.nicknameVerify(userNickname);
	}
	
	//주리
	@Override
	public String findId(HttpServletResponse response, String userEmail){
	
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out;
			String id = null;
			try {
				out = response.getWriter();
				id = userDao.findId(userEmail);
				
				if(id == null){
					out.println("<script>");
					out.println("alert('가입된 아이디가 없습니다.');");
					out.println("history.go(-1);");
					out.println("</script>");
					out.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			return id;
		}
}
