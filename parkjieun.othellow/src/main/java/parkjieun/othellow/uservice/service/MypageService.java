package parkjieun.othellow.uservice.service;


import org.springframework.stereotype.Service;

import parkjieun.othellow.user.domain.User;


@Service
public interface MypageService {
	int nicknameUpdate(User user);		//닉네임수정
	int passwordUpdate(User user);		//비밀번호 수정
	int nicknameVerify(String userNickname);
	int passwordVerify(String userPassword);
	//int emailUpdate(String userEmail);				//이메일 수정
}
