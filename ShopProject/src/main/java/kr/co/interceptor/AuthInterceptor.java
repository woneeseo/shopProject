package kr.co.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		/* 로그인이 안 된 상태면? 로그인 화면으로 
		 * 로그인이 되어있으면 작업을 그냥 진행 : 인증작업을 할 때는 preHandle이 필요없다 
		 * 작업에 진입을 하게 할 것인가? 진입을 못하게 막을것인가? -> preHandle()만 있으면 됨 */
		
		HttpSession session = request.getSession();
		Object login = session.getAttribute("login");
		
		if (login == null) {
			
			String uri = request.getRequestURI();
			String query = request.getQueryString(); 
			/* uri?col=data 처럼 쿼리스트링으로 넘어오는 데이터를 받아옴 
			 * 만약 쿼리값이 있다면 id=m001&pw=m001 와 같이 ? 뒤쪽으로 잘라서 가져옴 */
			
			if (query == null || query.equalsIgnoreCase("null")) {
				query="";
			} else {
				query = "?" + query; /* ?id=m001&pw=m001 와 같은 형태를 가진다 */
			}
			
			if(request.getMethod().equalsIgnoreCase("get")) {
				/* 메서드 전송방식이 get(view로 넘어갈 때)일 때만 session객체를 바인딩해 내보낸다 */
				session.setAttribute("dest", uri + query);
				/* ex) /board/insert?id=m001&pw=m001 나 /board/update?id=m001&pw=m001 와 같은 destination 을 갖게 된다 */
				/* 만약 쿼리에 데이터가 없거나 null이면 아무런 값도 갖지 않고 uri만을 반환한다 ex)/board/insert 
				 * dest - 로그인이 이루어 진 후에 사용됨 : 어디로 리다이렉트 할 지 결정해주는 값 */
			}
			
			response.sendRedirect("/member/login");
			/* 로그인 정보가 없다? -> 로그인 화면으로 보내는 코드 */
			return false; /* 컨트롤러로 넘어가지 못하게 false를 값으로 return */
		}
		
		return true;
		/* 로그인 정보가 있다? 컨트롤러로 보내서 해당 기능을 사용할 수 있게 함 */
	
	}	

}
