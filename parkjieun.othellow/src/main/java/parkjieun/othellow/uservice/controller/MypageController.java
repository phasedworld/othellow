package parkjieun.othellow.uservice.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import parkjieun.othellow.character.domain.Character;
import parkjieun.othellow.character.service.CharacterService;
import parkjieun.othellow.user.domain.User;
import parkjieun.othellow.uservice.service.MypageService;

@RequestMapping("/uservice")
@Controller
public class MypageController {
	@Autowired private MypageService mypageService;
	@Autowired CharacterService characterService;
	
	//마이페이지-내랭킹조회 페이지로 이동
	@RequestMapping("/mypageRank")
	public String mypageRank(){
		return "uservice/mypageRank";
	}
	//마이페이지-내랭킹조회 페이지로 이동
	@RequestMapping("/mypageUpdate")
	public String mypageUpdate(Model model){
		List<Character> character = characterService.getCharacters();
		model.addAttribute("character", character);
		return "uservice/mypageUpdate";
	}

	@RequestMapping("/nicknameUpdate")
	@ResponseBody
	public int nicknameUpdate(User user, HttpSession session) {
		//session.setAttribute("user", user);
		//보완
		User curUser = (User) session.getAttribute("user");
		curUser.setUserNickname(user.getUserNickname());			//user의 바뀐 유저 닉네임만 curUser에 넣어준다. 
		session.setAttribute("user", curUser);
		return mypageService.nicknameUpdate(user);
	}

	@RequestMapping("/passwordUpdate")
	@ResponseBody
	public int passwordUpdate(User user, HttpSession session) {
		User userPwd = (User) session.getAttribute("user");
		userPwd.setUserPassword(user.getUserPassword());
		session.setAttribute("user", userPwd);
		return mypageService.passwordUpdate(user);
	}
	
	@RequestMapping("/emailUpdate")
	@ResponseBody
	public int emailUpdate(User user, HttpSession session) {
		User userMail = (User) session.getAttribute("user");
		userMail.setUserEmail(user.getUserEmail());		//userMail에 바뀐 user.getUserEmail()를 넣어준다.
		session.setAttribute("user", userMail);				//session.setAttrivb
		return mypageService.emailUpdate(user);
	}
	
	@RequestMapping("/characterUpdate")
	@ResponseBody
	public int characterUpdate(User user, HttpSession session){
		User userPic = (User) session.getAttribute("user");
		userPic.setCharacterNo(user.getCharacterNo());
		session.setAttribute("user", userPic);
		return mypageService.characterUpdate(user);
		
	}
	
	@RequestMapping("/nicknameVerify")
	@ResponseBody
	public int nicknameVerify(String userNickname){
		return mypageService.nicknameVerify(userNickname);
	}
	
	@RequestMapping("/passwordVerify")
	@ResponseBody
	public int passwordVerify(String userPassword, HttpSession session) {
		User user = new User();
		User selUser = (User) session.getAttribute("user");
		selUser.setUserPassword(user.getUserPassword());
		session.setAttribute("user", selUser);
		return mypageService.passwordVerify(userPassword);
	}
	
	
}