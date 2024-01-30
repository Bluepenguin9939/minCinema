package com.kh.minCinema.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.minCinema.domain.Heo_MemberVO;
import com.kh.minCinema.domain.Jo_MovieVO;
import com.kh.minCinema.service.Jo_AttachService;
import com.kh.minCinema.service.Jo_HeartService;
import com.kh.minCinema.service.Jo_MovieService;

@Controller
@RequestMapping("/myPage")
public class Jo_MyPageController {
	
	@Autowired
	private Jo_MovieService movieService;
	
	@GetMapping("/jo_myInfo")
	public void myPage() {
		
	}
	
	@GetMapping("/jo_myPoint")
	public void myPoint() {
		
	}
	
	@GetMapping("/jo_myInterest")
	public void myHeart(HttpSession session, Model model) {
		Heo_MemberVO memberVO = (Heo_MemberVO)session.getAttribute("loginInfo");
		String mid = memberVO.getMid();
		List<Jo_MovieVO> movieList = movieService.getInterestToHeart(mid);
		model.addAttribute("movieList", movieList);
	}
}
