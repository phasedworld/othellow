package parkjieun.othellow.user.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

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
	
	@Override
	public ArrayList<String> findId(String userEmail){
		List<String> list = userDao.findId(userEmail);
		ArrayList<String> findId = new ArrayList<String>();  
		for(int i = 0; i < list.size(); i ++) {
			String email = list.get(i);
			findId.add(email);
		}
		return findId;
	}
}
