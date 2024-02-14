package com.kh.minCinema.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.minCinema.domain.Heo_MemberVO;

public class Heo_AuthInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Heo_MemberVO heo_MemberVO = (Heo_MemberVO)session.getAttribute("loginInfo");
		if (heo_MemberVO == null) {
			saveTargetLocation(request);
			response.sendRedirect("/member/jo_login");
			return false;
		}
		return true;
	}
	
	public void saveTargetLocation(HttpServletRequest request) {
		String uri = request.getRequestURI();
		String query = request.getQueryString();
		String method = request.getMethod();
		if (method.equals("GET")) {
			if(query == null || query.equals("null")) {
				query = "";
			} else {
				query = "?" + query;
			}
		}
		String targetLocation = uri + query;
//		if (targetLocation.equals("/")) {
//			
//		}
		request.getSession().setAttribute("targetLocation", targetLocation);
	}
}
