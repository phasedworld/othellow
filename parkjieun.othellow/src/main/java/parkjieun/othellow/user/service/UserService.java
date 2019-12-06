package parkjieun.othellow.user.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import parkjieun.othellow.user.domain.User;


public interface UserService {
	int addUser(User user);
	User getUser(User user);
	int idVerify(String userId);
	int nicknameVerify(String userNickname);
	
	ArrayList<String> findId(String userEmail);
	int pwCheckList(User user);		//비밀번호찾을 때 아이디 메일주소 확인용
}
