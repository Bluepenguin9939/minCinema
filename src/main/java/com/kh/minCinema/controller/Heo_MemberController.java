package com.kh.minCinema.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.minCinema.domain.Heo_LoginDTO;
import com.kh.minCinema.domain.Heo_MemberVO;
import com.kh.minCinema.service.Heo_MemberService;

@Controller
@RequestMapping("/member")
public class Heo_MemberController {

	@Autowired
	private Heo_MemberService heo_MemberService;
//	@Autowired
//	private Heo_PointService heo_PointService;
	
	@PostMapping("/register")
	public String register(Heo_MemberVO heo_MemberVO) {
		System.out.println("컨트롤러" + heo_MemberVO);
		heo_MemberService.register(heo_MemberVO);
		return "redirect:/member/jo_login";
	}
	
	@PostMapping("/updateBen")
	public void updateBen(Heo_MemberVO heo_MemberVO) {
		heo_MemberService.updateBen(heo_MemberVO);
	}
	
	@PostMapping("/login")
	public void login(Model model, Heo_LoginDTO heo_LoginDTO) {
		Heo_MemberVO heo_MemberVO = heo_MemberService.memberLogin(heo_LoginDTO);
		if (heo_MemberVO == null) {
			return;
		}
		model.addAttribute("loginInfo", heo_MemberVO);
		model.addAttribute("useCookie", heo_LoginDTO.getUseCookie());
	}
	
}
