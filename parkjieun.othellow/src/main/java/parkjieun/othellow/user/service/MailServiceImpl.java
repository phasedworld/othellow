package parkjieun.othellow.user.service;

import java.util.Random;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import parkjieun.othellow.user.dao.UserDao;
import parkjieun.othellow.user.domain.User;

@Service
public class MailServiceImpl implements MailService{
	@Autowired private JavaMailSender mailSender;
	@Autowired private UserDao userDao;
	
	@Override
	public void sendEmail(HttpSession session, String email) {
		MimeMessage message = mailSender.createMimeMessage();
		String emailAuth ="";
		Random r = new Random();
		for(int i=0;i<5;i++){
			int pick = r.nextInt(36);
			if(pick>9){
				emailAuth += (char) (pick+87);
			}else{
				emailAuth += pick;
			}
		}
		
		String text = "<div style='width:350px;padding:100px;background:linear-gradient(135deg, #c3ec52, #0ba29d);"
					 +"border-radius:8px;text-align:center;font-weight:bold;line-height:50px;'>"
					 +"<FONT style='font-size:21px;'>캐주얼 온라인 보드게임! 오델로W</FONT><br>회원님을 위한 계정 생성 인증코드입니다 :"
					 +"<div style='padding:5px; background:white; border-radius:5px; box-shadow:3px 3px 0px #333; font-size:23px;'>"
					 + emailAuth+"</div></div>";
		session.setAttribute("emailAuth", emailAuth);
				
		try{
			message.addRecipient(RecipientType.TO, new InternetAddress(email));
			message.setSubject("[오델로W] 계정 생성 인증번호입니다.");
			message.setText(text,"utf-8","html");
		}catch(Exception e){}
		mailSender.send(message);
	}
	
	//Password찾기 발송메일이다.(임시 비밀번호 생성 메일)
	@Override
	public void sendEmailPw(User user, String userEmail){
		MimeMessage message = mailSender.createMimeMessage();
		String tmpPw ="";
		Random r = new Random();
		for(int i=0;i<8;i++){
			int pick = r.nextInt(36);
			if(pick>9){
				tmpPw += (char) (pick+87);
			}else{
				tmpPw += pick;
			}
		}
		user.setUserPassword(tmpPw);		
		userDao.updatePw(user);			
		
		String text = "<div style='width:350px;padding:100px;background:linear-gradient(135deg, #c3ec52, #0ba29d);"
					 +"border-radius:8px;text-align:center;font-weight:bold;line-height:50px;'>"
					 +"<FONT style='font-size:21px;'>캐주얼 온라인 보드게임! 오델로W</FONT><br>"+ user.getUserId() +"님을 위한 임시 비밀번호입니다."
					 +"<div style='padding:5px; background:white; border-radius:5px; box-shadow:3px 3px 0px #333; font-size:23px;'>"
					 + user.getUserPassword()+"</div>"
					 +"로그인 후 비밀번호를 다시 설정해주세요 :)"+"</div>";				
		try{
			message.addRecipient(RecipientType.TO, new InternetAddress(userEmail));
			message.setSubject("[오델로W] 임시 비밀번호입니다.");
			message.setText(text,"utf-8","html");
		}catch(Exception e){}
		mailSender.send(message);
	}
}
