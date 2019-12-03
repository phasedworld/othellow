package parkjieun.othellow.user.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import parkjieun.othellow.user.dao.mapper.UserMapper;
import parkjieun.othellow.user.domain.User;

@Repository
public class UserDaoImpl implements UserDao{
	@Autowired UserMapper userMapper;
	
	@Override
	public int addUser(User user) {
		return userMapper.addUser(user);
	}

	@Override
	public User getUser(User user) {
		return userMapper.getUser(user);
	}

	@Override
	public int idVerify(String userId) {
		return userMapper.idVerify(userId);
	}

	@Override
	public int nicknameVerify(String userNickname) {
		return userMapper.nicknameVerify(userNickname);
	}

	@Override
	public String findId(String userEmail){;
		return userMapper.findId(userEmail);
	}

}
