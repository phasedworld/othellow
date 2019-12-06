package parkjieun.othellow.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import parkjieun.othellow.user.domain.User;

public class GameInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		boolean isPass = true;
		if(request.getMethod().equals("GET")){
			//url 직접입력으로 게임방 접근시
			System.out.println("prehandle - GET 작동 :곧 막힙니다.");
			response.sendRedirect("../lobby");
		}
		return isPass;
	}

}
