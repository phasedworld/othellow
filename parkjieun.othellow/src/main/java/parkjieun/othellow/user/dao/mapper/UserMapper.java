package parkjieun.othellow.user.dao.mapper;

import parkjieun.othellow.user.domain.User;

public interface UserMapper {
	int addUser(User user);
	User getUser(User user);
	int idVerify(String userId);
	int nicknameVerify(String userNickname);
	//주리
	String findId(String userEmail);
}
