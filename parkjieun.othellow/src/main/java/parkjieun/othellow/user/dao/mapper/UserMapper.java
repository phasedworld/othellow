package parkjieun.othellow.user.dao.mapper;

import java.util.List;

import parkjieun.othellow.user.domain.User;

public interface UserMapper {
	int addUser(User user);
	User getUser(User user);
	int idVerify(String userId);
	int nicknameVerify(String userNickname);
	
	List<String> findId(String userEmail);
}
