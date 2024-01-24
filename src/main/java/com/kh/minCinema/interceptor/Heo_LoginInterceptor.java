package com.kh.minCinema.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.minCinema.domain.Heo_MemberVO;

public class Heo_LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Heo_MemberVO heo_MemberVO = (Heo_MemberVO)session.getAttribute("loginInfo");
		System.out.println("login pre inter" + heo_MemberVO);
		if(heo_MemberVO != null) {
			session.removeAttribute("loginInfo");
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		ModelMap map = (ModelMap)modelAndView.getModel();
		Heo_MemberVO heo_MemberVO = (Heo_MemberVO)map.get("loginInfo");
		System.out.println("login post inter" + heo_MemberVO);
		Boolean useCookie = (Boolean)map.get("useCookie");
		System.out.println("쿠키"+useCookie);
		if(heo_MemberVO == null) {
			modelAndView.setViewName("redirect:/member/jo_login");
		} else {
			HttpSession session = request.getSession();
			String targetLocation = (String)session.getAttribute("targetLocation");
			session.removeAttribute("targetLocation");
			if (targetLocation == null) {
				modelAndView.setViewName("redirect:/");
			} else {
				modelAndView.setViewName("redirect:" + targetLocation);
			}
			request.getSession().setAttribute("loginInfo", heo_MemberVO);
			if (useCookie != null && useCookie == true) {
				Cookie cookie = new Cookie("savedId", heo_MemberVO.getMid());
				cookie.setMaxAge(60 * 60 * 24 * 7);
				response.addCookie(cookie);
			}
		}
	}
}
