package parkjieun.othellow.user.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import parkjieun.othellow.user.domain.User;
import parkjieun.othellow.user.service.UserService;

@Controller
public class UserController {
	@Autowired UserService userService;
	
	@RequestMapping("user/signup")
	public String signin(){
		return "user/signUp";
	}
	
	//아이디 찾기 페이지로 이동하기. 
	@RequestMapping("uservice/findIdForm")
	public String findIdForm(){
		return "uservice/findIdForm";
	}
	
	//입력한 이메일주소에 맞는 아이디리스트를 리턴
	@RequestMapping(value="uservice/findId", method=RequestMethod.POST, produces="application/json;")
	@ResponseBody
	public ArrayList<String> findId(@ModelAttribute("userEmail") String userEmail){		
		ArrayList<String> idList = userService.findId(userEmail);
		return idList;
	}
	
	//비밀번호 찾기 페이지로 이동하기. 
	@RequestMapping("uservice/findPasswdForm")
	public String findPasswdForm(){
		return "uservice/findPasswdForm";
	}
	
	@RequestMapping("user/addUser")
	@ResponseBody
	public int addUser(User user){
		return userService.addUser(user);
	}
	
	@RequestMapping("login")
	@ResponseBody
	public int login(String userId, String userPassword, HttpSession session){
		int result = 1;
		User user = new User();
		userId = userId.trim();
		userPassword = userPassword.trim();
		user.setUserId(userId);
		user.setUserPassword(userPassword);
		if(userService.getUser(user)!=null){
			session.setAttribute("user", userService.getUser(user));
			result =0;
		}else{
			result =1;
		}
		return result;
	}
	
	@RequestMapping("user/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("user/idVerify")
	@ResponseBody
	public int idVerify(String userId){
		return userService.idVerify(userId);
	}
	
	@RequestMapping("user/nicknameVerify")
	@ResponseBody
	public int nicknameVerify(String userNickname){
		return userService.nicknameVerify(userNickname);
	}
	
}
