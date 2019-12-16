package parkjieun.othellow.community.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import parkjieun.othellow.community.domain.Community;
import parkjieun.othellow.community.domain.Paging;
import parkjieun.othellow.community.service.CommunityService;
import parkjieun.othellow.user.domain.User;

@Controller
@RequestMapping("/community")
public class CommunityController {
	@Autowired private CommunityService communityService;


	/** 전체조회 리스트 요청 list() 구현
	         - 요청타입 : get
                    - 요청매핑: /list
                    - 요청 파라미터 : Model model
                    - 리턴값 : 없음, 분기 : list.jsp
                    - 처리 : service의 communityList()호출
	 **/
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void communityList(Model model){
		model.addAttribute("communityList", communityService.communityList());
	}

	@RequestMapping(value="/informList", method=RequestMethod.GET)
	public void informList(Model model){
		model.addAttribute("informList", communityService.informList());
	}

	@RequestMapping(value="/chatList", method=RequestMethod.GET)
	public void chatList(Model model){
		model.addAttribute("chatList", communityService.chatList());
	}

	@RequestMapping(value="/artList", method=RequestMethod.GET)
	public void artList(Model model){
		model.addAttribute("artList", communityService.artList());
	}
	
	/**페이징**/
	@RequestMapping(value="/list")
	public String list(Paging paging, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage){
		int total = communityService.countPost();
		if(nowPage == null && cntPerPage == null){
			nowPage = "1";
			cntPerPage = "10";
		}else if(nowPage == null){
			nowPage = "1";
		}else if(cntPerPage == null){
			cntPerPage = "10";
		}
		paging = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", paging);
		model.addAttribute("viewAll", communityService.selectPost(paging));
		return "community/paging";
	}
	

	/** 게시판 등록 화면 요청 register () 구현
	         - 요청타입 : get
                    - 요청매핑: /register
                    - 요청 파라미터 : 없음
                    - 리턴값 : 없음, 분기 : register.jsp
                    - 처리 : 없음
	 **/
	@RequestMapping(value="/insertPost", method = RequestMethod.GET)
	public void insertPost(){
	}


	/** 게시판 등록 처리 요청 register( ) 구현
	         - 요청타입 :  post
                    - 요청매핑: /insertPost
                    - 요청 파라미터 : Community community, RedirectAttributes rttr
                    - 리턴값 : redirect:/board/list 
                    - 처리 : service의 register()호출처리
	 **/
	@RequestMapping(value="/insertPost", method = RequestMethod.POST)
	public String insertPost(Community community, RedirectAttributes rttr){
		communityService.insertPost(community);
		rttr.addFlashAttribute("result", community.getSeq());
		return "redirect:/community/list";
	}

	/** 게시판 상세조회 처리 요청 viewPost( ) 구현
	         - 요청타입 :  get
                    - 요청매핑: /viewPost?seq={seq}
                    - 요청 파라미터 : @RequestParam("seq") Long bno, Model model
                    - 리턴값 : 없음 , get.jsp 
                    - 처리 : service의 get()호출처리
	 **/
	@RequestMapping(value="/viewPost/{seq}", method = RequestMethod.GET)
	public String viewPost(@PathVariable("seq") int seq, Model model){
		model.addAttribute("community", communityService.viewPost(seq));
		communityService.hitCountUpdate(seq);
		return "community/viewPost";
	}

	/** 5.3) 게시판 수정 화면 요청 modify( ) 구현
    - 요청타입 :  get
           - 요청매핑: /modify
           - 요청 파라미터 : @RequestParam("seq") Long bno, Model model
           - 리턴값 : 없음 , updatePost.jsp 
           - 처리 : service의 get()호출처리
	 **/
	
/*	@RequestMapping(value={"/updatePost/{seq}"}, method = RequestMethod.GET)
	public void updatePost(@PathVariable("seq") int seq, Model model){
		model.addAttribute("community", communityService.viewPost(seq));
	}
	
	*//** 5.3) 게시판 수정 처리 modify( ) 구현
    - 요청타입 :  post
           - 요청매핑: /modify
           - 요청 파라미터 : Community community, RedirectAttributes rttr
           - 리턴값 : redirect:/community/list
           - 처리 : service의 updatePost()호출처리
	 **//*

	@RequestMapping(value="/updatePost/{seq}", method = RequestMethod.POST)
	public String updatePost(@PathVariable("seq") int seq, Community community, RedirectAttributes rttr){
		if(communityService.updatePost(community)){
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/community/list";
	}*/
	
	@RequestMapping(value="/updatePost", method=RequestMethod.POST)
	public String updatePost(@ModelAttribute Community community){
		communityService.updatePost(community);
		return "redirect:/community/list";
	}
	
	@RequestMapping("/delPost")
	public String delPost(@RequestParam int seq){
		communityService.delPost(seq);
		return "redirect:/community/list";
	}

	/*@RequestMapping(value="/delPost", method = RequestMethod.POST)
	public boolean delPost(int seq){
		return communityService.delPost(seq);
	}*/
	
	@RequestMapping(value="/mainlist")
	@ResponseBody
	public List<Community> mainList(){
		return communityService.communityList();
	}
	
	@RequestMapping(value="/bestlist")
	@ResponseBody
	public List<Community> bestList(){
		return communityService.bestPost();
	}
}
