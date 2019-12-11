package parkjieun.othellow.community.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import parkjieun.othellow.community.domain.Community;
import parkjieun.othellow.community.service.CommunityService;
import parkjieun.othellow.user.domain.User;

@Controller
@RequestMapping("/community")
public class CommunityController {
	@Autowired private CommunityService communityService;
	
	@RequestMapping("/list")
	public String boardList(){
		return "community/list";
	}

	@RequestMapping(value="/communityList", method=RequestMethod.GET)
	@ResponseBody
	public List<Community> communityList(){
		List<Community> communityList = new ArrayList<Community>();
		communityList = communityService.communityList();
		return communityList;
	}
	
	@RequestMapping(value="/informList", method=RequestMethod.GET)
	@ResponseBody
	public List<Community> informList(){
		List<Community> informList = new ArrayList<Community>();
		informList = communityService.informList();
		return informList;
	}
	
	@RequestMapping(value="/chatList", method=RequestMethod.GET)
	@ResponseBody
	public List<Community> chatList(){
		List<Community> chatList = new ArrayList<Community>();
		chatList = communityService.chatList();
		return chatList;
	}
	
	@RequestMapping(value="/artList", method=RequestMethod.GET)
	@ResponseBody
	public List<Community> artList(){
		List<Community> artList = new ArrayList<Community>();
		artList = communityService.artList();
		return artList;
	}
	
	@RequestMapping(value="/insertPost", method = RequestMethod.GET)
	public void insertPost(){
	}
	
	@RequestMapping(value="/insertPost", method = RequestMethod.POST)
	public String insertPost(Community community, RedirectAttributes rttr){
		communityService.insertPost(community);
		rttr.addFlashAttribute("result", community.getSeq());
		return "redirect:/community/list";
	}
	
	@RequestMapping(value="/viewPost", method = RequestMethod.GET)
	public void post(@RequestParam("seq") int seq, Model model){
		model.addAttribute("community", communityService.get(seq));
	}
	
	@RequestMapping(value="/updatePost", method = RequestMethod.POST)
	public boolean updatePost(Community community){
		return communityService.updatePost(community);
	}
	
	@RequestMapping(value="/delPost", method = RequestMethod.POST)
	public boolean delPost(int seq){
		return communityService.delPost(seq);
	}

}
