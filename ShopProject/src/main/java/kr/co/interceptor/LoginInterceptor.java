package kr.co.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	
		HttpSession session = request.getSession();
		Object login = session.getAttribute("login");
		/* 현재 로그인이라는 이름으로 바인딩 된 데이터가 있는지 확인 */
		if (login != null) {
			session.removeAttribute("login");
			// session.invalidate(); 도 사용할 수 있음
		} /* 만약 session에 값이 존재한다면, 값을 지워버려라 */
	
		System.out.println(":::::::::::::::::: prehandle ::::::::::::::::::");
		System.out.println(login);

		
		return true; 
	
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		System.out.println(":::::::::::::::::: postHandle ::::::::::::::::::");
		/* 진짜 세션 작업은 postHandle에서 이루어진다 */
		HttpSession session = request.getSession();
		Object login = modelAndView.getModel().get("login");

		if (login != null) {	
			session.setAttribute("login", login);
			String dest = (String)session.getAttribute("dest");
			if (dest != null) {
				response.sendRedirect(dest);

			} else {
				response.sendRedirect("/");
			}

		} else {

			response.sendRedirect("/member/login");
		}
		
		System.out.println(login);
	}
	
	

}
