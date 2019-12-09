package parkjieun.othellow.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import parkjieun.othellow.user.domain.User;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		boolean userMain = true;
		User user = (User)request.getSession().getAttribute("user");
		if(user!=null && user.getUserId().equals("admin")){
			response.sendRedirect("admin");
			userMain = false;
		}
		return userMain;
	}

}
