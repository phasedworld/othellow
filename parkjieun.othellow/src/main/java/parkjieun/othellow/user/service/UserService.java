package parkjieun.othellow.user.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import parkjieun.othellow.user.domain.User;


public interface UserService {
	int addUser(User user);
	User getUser(User user);
	int idVerify(String userId);
	int nicknameVerify(String userNickname);
	
	ArrayList<String> findId(String userEmail);	//아이디찾기
	int pwCheckList(User user);					//비밀번호찾기(이메일,아이디 확인)
	boolean rearrangePw(User user);				//임시 비밀번호로 비밀번호 변경하기
}
