package parkjieun.othellow.user.service;

import javax.servlet.http.HttpSession;

public interface MailService {
	void sendEmail(HttpSession session, String email);
}
