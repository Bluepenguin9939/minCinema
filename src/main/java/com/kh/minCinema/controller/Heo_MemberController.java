package com.kh.minCinema.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.minCinema.domain.Heo_MemberVO;
import com.kh.minCinema.service.Heo_MemberService;

@Controller
@RequestMapping("/member")
public class Heo_MemberController {

	@Autowired
	private Heo_MemberService heo_MemberService;
	
	@PostMapping("/register")
	public String register(Heo_MemberVO vo) {
		System.out.println("컨트롤러" + vo);
		heo_MemberService.register(vo);
		return "redirect:/member/jo_login";
	}
	
	@PostMapping("/updateBen")
	public void updateBen(Heo_MemberVO vo) {
		heo_MemberService.updateBen(vo);
	}
	
	
}
