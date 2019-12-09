package parkjieun.othellow.user.dao.mapper;

import java.util.List;

import parkjieun.othellow.user.domain.User;

public interface UserMapper {
	int addUser(User user);
	User getUser(User user);
	int idVerify(String userId);
	int nicknameVerify(String userNickname);
	
	List<String> findId(String userEmail);	//아이디찾기
	int pwCheckList(User user);				//비밀번호찾기(이메일,아이디 확인)
	int updatePw(User user);				//임시 비밀번호로 비밀번호 변경하기
}
