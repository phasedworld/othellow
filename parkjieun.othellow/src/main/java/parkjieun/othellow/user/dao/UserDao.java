package parkjieun.othellow.user.dao;

import java.util.List;

import parkjieun.othellow.user.domain.User;

public interface UserDao {
	int addUser(User user);
	User getUser(User user);
	int idVerify(String userId);
	int nicknameVerify(String userNickname);
	
	List<String> findId(String userEmail);
	int pwCheckList(User user);			//비밀번호찾을 때 아이디 메일주소 확인용
}
