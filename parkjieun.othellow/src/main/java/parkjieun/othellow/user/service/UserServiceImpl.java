package parkjieun.othellow.user.service;

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
	
}
