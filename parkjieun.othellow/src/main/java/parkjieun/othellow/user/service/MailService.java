package parkjieun.othellow.user.service;

import javax.servlet.http.HttpSession;

import parkjieun.othellow.user.domain.User;

public interface MailService {
	void sendEmail(HttpSession session, String email);
	void sendEmailPw(User user, String userEmail);
}
