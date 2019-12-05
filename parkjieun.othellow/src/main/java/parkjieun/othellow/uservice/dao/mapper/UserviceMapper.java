package parkjieun.othellow.uservice.dao.mapper;

import java.util.List;

import parkjieun.othellow.user.domain.User;

public interface UserviceMapper {
	List<User> rankUsers(); 	//랭크 목록찾기
	//User searchUser(String userNickname);	//랭크 닉네임 찾기
	int nicknameUpdate(User user);		//닉네임수정
	int passwordUpdate(User user);		//비밀번호 수정
	int nicknameVerify(String userNickname);
	String passwordVerify(String userPassword);
	//int emailUpdate(String userEmail);				//이메일 수정
	
}
