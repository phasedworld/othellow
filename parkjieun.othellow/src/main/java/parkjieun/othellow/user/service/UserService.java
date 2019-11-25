package parkjieun.othellow.user.service;

import parkjieun.othellow.user.domain.User;


public interface UserService {
	int addUser(User user);
	User getUser(User user);
	int idVerify(String userId);
	int nicknameVerify(String userNickname);
}
