package com.kh.minCinema.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.minCinema.domain.Heo_MemberVO;

public class Jo_AdminInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if (session != null) {
			System.out.println("session : " + session);
			Heo_MemberVO heo_MemberVO = (Heo_MemberVO)session.getAttribute("loginInfo");
			System.out.println("vo : " + heo_MemberVO);
			if (heo_MemberVO == null) {
				response.sendRedirect("/");
				return false;
			}
			if (heo_MemberVO != null && heo_MemberVO.getMid().equals("admin")) {
				return true;
			}
		}
		response.sendRedirect("/");
		return false;
	}
	
}
