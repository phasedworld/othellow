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
}
