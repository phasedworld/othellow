package parkjieun.othellow.user.dao;

import java.util.List;

import parkjieun.othellow.user.domain.User;

public interface UserDao {
	int addUser(User user);
	User getUser(User user);
	int idVerify(String userId);
	int nicknameVerify(String userNickname);
	
	List<String> findId(String userEmail);
}
