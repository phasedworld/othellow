package parkjieun.othellow.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import parkjieun.othellow.community.domain.Community;
import parkjieun.othellow.community.service.CommunityService;

@Controller
@RequestMapping("/community")
public class CommunityController {
	@Autowired private CommunityService communityService;
	
	@RequestMapping("/list")
	@ResponseBody
	public List<Community> getPosts(){
		return communityService.getPosts();
	}
	
	@RequestMapping("/post")
	@ResponseBody
	public Community viewPost(int seq){
		return communityService.findViewPost(seq);
	}
	
	@RequestMapping("/myPost")
	@ResponseBody
	public Community myPost(int seq){
		return communityService.findMyPost(seq);
	}
	
	@RequestMapping("/register")
	@ResponseBody
	public boolean register(Community community){
		return communityService.register(community);
	}
	
	@RequestMapping("/updatePost")
	@ResponseBody
	public boolean updatePost(Community community){
		return communityService.updatePost(community);
	}
	
	@RequestMapping("/delPost")
	@ResponseBody
	public boolean delPost(int seq){
		return communityService.delPost(seq);
	}

}
