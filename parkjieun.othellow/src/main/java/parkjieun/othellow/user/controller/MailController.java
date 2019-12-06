package parkjieun.othellow.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import parkjieun.othellow.user.domain.User;
import parkjieun.othellow.user.service.MailService;

@Controller
public class MailController {
	@Autowired private MailService mailService;
	
	@RequestMapping(value="user/emailAuth", method=RequestMethod.GET)
	@ResponseBody
	public int send(HttpSession session, String email){
		mailService.sendEmail(session, email);
		return 0;
	}
	
	@RequestMapping(value="user/emailVerify", method=RequestMethod.GET)
	@ResponseBody
	public int verify(HttpSession session, String auth){
		if(session.getAttribute("emailAuth").equals(auth)){
			return 0;
		}else{
			return 1;
		}
	}
	
	/*@RequestMapping(value="")
	void sendEmailPw(User user, String userEmail);*/
}
