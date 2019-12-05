package parkjieun.othellow.uservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import parkjieun.othellow.user.domain.User;
import parkjieun.othellow.uservice.service.MypageService;
@RequestMapping("/uservice")
@Controller
public class MypageController {
	@Autowired
	public MypageService mypageService;
	
	@RequestMapping("/mypageRank")
	public String mypageRank(){
		return "uservice/mypageRank";
	}
	
	@RequestMapping("/mypageUpdate")
	public String mypageUpdate(){
		return "uservice/mypageUpdate";
	}

	@RequestMapping("/nickname")
	@ResponseBody
	public int nicknameUpdate(User user) {
		return mypageService.nicknameUpdate(user);
	}

	@RequestMapping("/password")
	@ResponseBody
	public int passwordUpdate(User user) {
		return mypageService.passwordUpdate(user);
	}
	
	@RequestMapping("/nicknameVerify")
	@ResponseBody
	public int nicknameVerify(String userNickname){
		return mypageService.nicknameVerify(userNickname);
	}
	
	@RequestMapping("/passwordVerify")
	@ResponseBody
	public int passwordVerify(String userPassword) {
		return mypageService.passwordVerify(userPassword);
	}
	
/*
	@RequestMapping("/email")
	@ResponseBody
	public int emailUpdate(String userEmail) {
		return mypageService.emailUpdate(userEmail);
	}*/

	
}