package parkjieun.othellow.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import parkjieun.othellow.user.domain.User;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		boolean isPass = true;
		
		if(!request.getRequestURI().equals("/othellow/")){
			User user = (User) request.getSession().getAttribute("user");
			//null 검증해야
			System.out.println("prehandle 작동!");
		}
		return isPass;
	}

}
