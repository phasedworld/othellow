package parkjieun.othellow.uservice.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import parkjieun.othellow.user.domain.User;
import parkjieun.othellow.uservice.service.RankService;

@Controller
@RequestMapping("/uservice")
public class RankController{
	@Autowired 
	private RankService rankService;
	
	@RequestMapping("/RankList")
	public String RankList(){
		return "uservice/RankList";
	}
	
	@RequestMapping(value="/rankUsers", method=RequestMethod.GET)
	@ResponseBody
	public List<User> rankUsers(){
		List<User> rankUsers = new ArrayList<User>();
		rankUsers = rankService.rankUsers();
		return rankUsers;
	}

	/*@RequestMapping(value="/searchUser", method=RequestMethod.GET)
	@ResponseBody
	public User searchUser(String userNickname) {
		return rankService.searchUser(userNickname);
	}*/
	
}
