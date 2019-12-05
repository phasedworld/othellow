package parkjieun.othellow.uservice.service;

import org.springframework.stereotype.Service;

import parkjieun.othellow.user.domain.User;


@Service
public interface MypageService {
	int nicknameUpdate(User user);		//닉네임 수정버튼
	int passwordUpdate(User user);		//비밀번호 수정버튼
	int emailUpdate(User user);			//이메일 수정버튼
	int nicknameVerify(String userNickname);	//닉네임 중복확인
	int passwordVerify(String userPassword);	//기존패스워드확인
}
