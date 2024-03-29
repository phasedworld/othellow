package parkjieun.othellow.uservice.dao.mapper;

import java.util.List;

import parkjieun.othellow.user.domain.User;

public interface UserviceMapper {
	//1.랭크
	List<User> rankUsers(); 	//랭크 목록찾기
	List<User> searchUser(String userNickname);	//랭크 닉네임 찾기
	
	//2.마이페이지 수정
	int nicknameUpdate(User user);		//닉네임수정
	int passwordUpdate(User user);		//비밀번호 수정
	int emailUpdate(User user);			//이메일 수정
	int characterUpdate(User user);		//사진 수정
	
	int nicknameVerify(String userNickname);	//닉네임검사
	String passwordVerify(String userPassword);	//비밀번호 검사
}
