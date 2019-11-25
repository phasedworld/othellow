package parkjieun.othellow.user.dao;

import parkjieun.othellow.user.domain.User;

public interface UserDao {
	int addUser(User user);
	User getUser(User user);
	int idVerify(String userId);
	int nicknameVerify(String userNickname);
}
